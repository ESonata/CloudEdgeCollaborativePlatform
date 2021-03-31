package com.fuful.k8sControllers;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.fuful.k8sentity.Deployment.Metadata;
import com.fuful.k8sentity.Harbor.HarborImage;
import com.fuful.k8sentity.NameSpace.ListNamespace;
import com.fuful.k8sentity.NameSpace.NameSpace;
import com.fuful.service.NamespaceService;
import com.fuful.utils.HttpSend;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
 * Created by SunRuiBin on 2019/11/17.
 */
@Controller
public class NameSpaceController {


    @Autowired
    NamespaceService namespaceService;

    @RequestMapping(value = "/ListPods",method = GET)
    @ResponseBody
    public  String MarkListServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String result = HttpSend.get("http://192.168.43.156:8080/api/v1/pods");

        Map<String,String> map=new HashMap<>();

        map.put("app","nginx");
        JSONObject jsonObject=new JSONObject(map);
        System.out.println(jsonObject);
        return result;
    }

    @RequestMapping(value = "/CreateNamespace",method = POST)
    @ResponseBody
    public String createNamespace(@RequestParam("namespace_name") String namespace_name){
        long start = System.currentTimeMillis();


        NameSpace nameSpace=new NameSpace();
        Metadata metadata=new Metadata();
        metadata.setName(namespace_name);
        nameSpace.setMetadata(metadata);
        Gson gson = new Gson();
        String url="http://192.168.43.156:8080/api/v1/namespaces";
        JSONObject jsonObject=new JSONObject(nameSpace);
        String result=HttpSend.post(jsonObject,url);
        System.out.println(result);
        System.out.println(jsonObject);
        long end = System.currentTimeMillis();
        System.out.println("创建命名空间耗时:" + (end - start) + "ms");
        return result;


    }

    @RequestMapping(value = "/DeleteNamespace",method = POST)
    public void DeleteNamespace(@RequestParam("name") String name,HttpServletResponse response) throws IOException {
        long start = System.currentTimeMillis();
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("name",name);
        String url="http://192.168.43.156:8080/api/v1/namespaces/"+name;
        String result=HttpSend.delete(url,jsonObject);
        System.out.println(result);

        String message="";



        message="删除成功!";


        Gson gson=new Gson();
        String json=gson.toJson(message);


        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().write(json);
        long end = System.currentTimeMillis();
        System.out.println("删除命名空间耗时:" + (end - start) + "ms");
    }



    @RequestMapping(value = "/ListNamespace",method = GET)
    public String listnamespace(HttpServletRequest request,HttpServletResponse response){
        long start = System.currentTimeMillis();

        int page=Integer.parseInt(request.getParameter("curPage"));


        String url="http://192.168.43.156:8080/api/v1/namespaces";

        String result=HttpSend.get(url);



        PageInfo<ListNamespace> data = namespaceService.getAll(page,4,result);


        HttpSession session=request.getSession();

        session.setAttribute("namespaces",data.getList());
//        return namespace_items.toString();
        session.setAttribute("curPage",page);
        session.setAttribute("totalPage", data.getPages());
        session.setAttribute("totalCount",data.getTotal());
        long end = System.currentTimeMillis();
        System.out.println("列出命名空间耗时:" + (end - start) + "ms");
        return "redirect:/admin/operate-namespace.jsp";
    }



}
