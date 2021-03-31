package com.fuful.k8sControllers;

import com.fuful.k8sentity.Deployment.ListDeployment;
import com.fuful.k8sentity.Node.Node;
import com.fuful.utils.HttpSend;
import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * Created by SunRuiBin on 2020/3/22.
 */

@Controller
public class MonitorController {






    public static Map<String,Object> getStringToMap(String str) {
        //根据逗号截取字符串数组
        String[] str1 = str.split(",");
        //创建Map对象
        Map<String, Object> map = new HashMap<>();
        //循环加入map集合
        for (int i = 0; i < str1.length; i++) {
            //根据":"截取字符串数组
            String[] str2 = str1[i].split(":");
            //str2[0]为KEY,str2[1]为值
            map.put(str2[0], str2[1]);
        }
        return map;
    }


    @RequestMapping("/front")
    public String getnode(HttpServletRequest request,HttpServletResponse response){
        String result = HttpSend.get("http://192.168.43.156:8080/api/v1/nodes");

        HttpSession session=request.getSession();
        JSONObject nodelist=new JSONObject(result);
        JSONArray node_items=nodelist.getJSONArray("items");
        System.out.println(node_items.length());
        List<Node> edgeNode=new ArrayList<>();
        List<Node> ordinaryNode=new ArrayList<>();


        for(int i=0;i<node_items.length();i++) {

            Node node = new Node();
            JSONObject o = node_items.getJSONObject(i);

            JSONObject metadata_item = o.getJSONObject("metadata");
            JSONObject status = o.getJSONObject("status");
            JSONObject spec = o.getJSONObject("spec");


            JSONArray conditions=status.getJSONArray("conditions");
            JSONArray addresses=status.getJSONArray("addresses");



            for(int j=0;j<addresses.length();j++){
                JSONObject item=addresses.getJSONObject(j);
                String type=item.getString("type");
                if(type.equals("InternalIP")){
                    String item_address=item.getString("address");
                    System.out.println("j="+j+" "+item_address);
                    node.setAddress(item_address+":9100");
                }
                else
                {
                    continue;
                }
            }


            for(int k=0;k<conditions.length();k++){
                JSONObject item=conditions.getJSONObject(k);
                String type=item.getString("type");
                if(type.equals("Ready")){
                    String item_status=item.getString("status");
                    System.out.println("k="+k+" "+item_status);
                    node.setStatus(item_status);
                }
                else
                {
                    continue;
                }
            }

            JSONObject labels=metadata_item.getJSONObject("labels");

            Map<String,String> map_labels=new HashMap<>();

            Gson gson = new Gson();
            Map<String,String> map = new HashMap<>();
            map= gson.fromJson(labels.toString(), map.getClass());


            Map<String, Object> map1 = getStringToMap(labels.toString());

            String name = metadata_item.getString("name");
            String time = metadata_item.getString("creationTimestamp");



            boolean find=map.containsKey("node-role.kubernetes.io/edge");


            node.setName(name);
            node.setCreationTimestamp(time);

            if(find){
                edgeNode.add(node);
            }
            else
            {
                ordinaryNode.add(node);
            }


        }


        session.setAttribute("OrdinaryNodeNumber",ordinaryNode.size());
        session.setAttribute("EdgeNodeNumber",edgeNode.size());

        session.setAttribute("ordinaryNode",ordinaryNode);
        session.setAttribute("edgeNode",edgeNode);

        session.setAttribute("currentNormalNode",ordinaryNode.get(0).getName());
        session.setAttribute("currentEdgeAddress",edgeNode.get(0).getAddress());
        return "redirect:/admin/LoginAdmin.jsp";
    }




    @RequestMapping(value = "/MonitoringNormal",method = GET)
    public String MonitoringCluster(HttpServletRequest request,HttpServletResponse response){
        String result = HttpSend.get("http://192.168.43.156:8080/api/v1/nodes");

        JSONObject nodelist=new JSONObject(result);
        JSONArray node_items=nodelist.getJSONArray("items");
        System.out.println(node_items.length());
        List<Node> edgeNode=new ArrayList<>();
        List<Node> ordinaryNode=new ArrayList<>();
        for(int i=0;i<node_items.length();i++) {

            Node node = new Node();
            JSONObject o = node_items.getJSONObject(i);

            JSONObject metadata_item = o.getJSONObject("metadata");
            JSONObject status = o.getJSONObject("status");
            JSONObject spec = o.getJSONObject("spec");


            JSONObject labels=metadata_item.getJSONObject("labels");

            Map<String,String> map_labels=new HashMap<>();

            Gson gson = new Gson();
            Map<String,String> map = new HashMap<>();
            map= gson.fromJson(labels.toString(), map.getClass());


            Map<String, Object> map1 = getStringToMap(labels.toString());

            String name = metadata_item.getString("name");
            String time = metadata_item.getString("creationTimestamp");



            boolean find=map.containsKey("node-role.kubernetes.io/edge");


            node.setName(name);
            node.setCreationTimestamp(time);

            if(find){
                edgeNode.add(node);
            }
            else
            {
                ordinaryNode.add(node);
            }


        }


        HttpSession session=request.getSession();
        session.setAttribute("ordinaryNode",ordinaryNode);
        session.setAttribute("edgeNode",edgeNode);


        return "redirect:/admin/monitor-normal.jsp";
    }




}
