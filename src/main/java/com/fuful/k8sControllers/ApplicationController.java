package com.fuful.k8sControllers;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fuful.k8sentity.DaemonSet.Daemonset;
import com.fuful.k8sentity.DaemonSet.ListDaemonset;
import com.fuful.k8sentity.Deployment.*;
import com.fuful.k8sentity.NameSpace.ListNamespace;
import com.fuful.k8sentity.Pod.ListContainer;
import com.fuful.k8sentity.Pod.ListPod;
import com.fuful.k8sentity.Pod.Pod_condition;
import com.fuful.k8sentity.Service.ListService;
import com.fuful.k8sentity.Service.Service;
import com.fuful.k8sentity.Service.ServicePorts;
import com.fuful.k8sentity.Service.ServiceSpec;
import com.fuful.k8sentity.StatefulSet.ListStatefulsets;
import com.fuful.utils.HttpSend;
import com.google.gson.Gson;
import net.sf.json.JSON;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.JSONObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * Created by SunRuiBin on 2020/3/13.
 */

@Controller
public class ApplicationController {

//    @JsonInclude(JsonInclude.Include.NON_NULL)
//    当属性为空时转换JSON数据不显示



    //前台通过设置Deployment参数，设置Service参数，创建应用


    /**
     * 创建Deployment
     * HTTP请求参数：/apis/apps/v1/namespaces/{namespace}/deployments
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/CreateDeployment",method = POST)
    public String createApplication(HttpServletRequest request, HttpServletResponse response){

        String deployment_name=request.getParameter("deployment_name");
        String label_key=request.getParameter("label_key");
        String label_value=request.getParameter("label_value");
        String namespace_name=request.getParameter("namespace_name");
        String node_select=request.getParameter("node_select");
        System.out.println(deployment_name+" "+label_key+" "+label_value+" "+namespace_name+" "+node_select);
        Deployment deployment=new Deployment();
        deployment.setKind("Deployment");
        Metadata deploy_metadata=new Metadata();
//        设置Deployment-name
        deploy_metadata.setName(deployment_name);
//        设置Deployment-metadata.labels=new HashMap<>();
        Map<String,String> labels=new HashMap<>();
        labels.put(label_key,label_value);
        deploy_metadata.setLabels(labels);
//        设置Deployment-metadata.namespace
        deploy_metadata.setNamespace(namespace_name);

//        metadata添加进deployment
        deployment.setMetadata(deploy_metadata);




        int replicas=Integer.parseInt(request.getParameter("replicas"));
        Deployment_spec spec=new Deployment_spec();
        // 设置副本数量
        spec.setReplicas(replicas);
        //设置标签
        Selector selector=new Selector();
        Map<String,String> matchLabels=new HashMap<>();
        matchLabels.put(label_key,label_value);
        selector.setMatchLabels(matchLabels);
        spec.setSelector(selector);
        //设置POD的模板
        Deployment_template template=new Deployment_template();
        PodMetadata pod_metadata=new PodMetadata();
        pod_metadata.setLabels(labels);
        template.setMetadata(pod_metadata);


        String container_name=request.getParameter("container_name");
        String container_image=request.getParameter("container_image");
        int container_port=Integer.parseInt(request.getParameter("container_port"));
        List<Containers> containersLis=new ArrayList<>();
        PodSpec podSpec=new PodSpec();
        Containers containers=new Containers();
        containers.setName(container_name);
//        containers.setImage("nginx:1.7.9");
        containers.setImage(container_image);
        PodPorts podPorts=new PodPorts();
//        podPorts.setContainerPort(81);
        podPorts.setContainerPort(container_port);
//        containers.setPorts(podPorts);
        containersLis.add(containers);
        podSpec.setContainers(containersLis);
        if(node_select.equals("1")){
            Map<String,String> nodeSelector=new HashMap<>();
            nodeSelector.put("node-role.kubernetes.io/edge","");
            podSpec.setNodeSelector(nodeSelector);
        }

        template.setSpec(podSpec);
        spec.setTemplate(template);

        deployment.setSpec(spec);
        JSONObject jsonObject=new JSONObject(deployment);


        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/deployments";
        String result= HttpSend.post(jsonObject,url);

        return  "redirect:/GetDeploymentsServicesPods?namespace_name=default";
    }




    @RequestMapping(value = "/CreateDaemonSet",method = POST)
    public String CreateDaemonSet(HttpServletRequest request, HttpServletResponse response){

        String deployment_name=request.getParameter("deployment_name");
        String label_key=request.getParameter("label_key");
        String label_value=request.getParameter("label_value");
        String namespace_name=request.getParameter("namespace_name");
        String node_select=request.getParameter("node_select");
        System.out.println(deployment_name+" "+label_key+" "+label_value+" "+namespace_name+" "+node_select);
        Deployment deployment=new Deployment();
        deployment.setKind("DaemonSet");
        Metadata deploy_metadata=new Metadata();
//        设置Deployment-name
        deploy_metadata.setName(deployment_name);
//        设置Deployment-metadata.labels=new HashMap<>();
        Map<String,String> labels=new HashMap<>();
        labels.put(label_key,label_value);
        deploy_metadata.setLabels(labels);
//        设置Deployment-metadata.namespace
        deploy_metadata.setNamespace(namespace_name);

//        metadata添加进deployment
        deployment.setMetadata(deploy_metadata);




        Deployment_spec spec=new Deployment_spec();
        // 设置副本数量

        //设置标签
        Selector selector=new Selector();
        Map<String,String> matchLabels=new HashMap<>();
        matchLabels.put(label_key,label_value);
        selector.setMatchLabels(matchLabels);
        spec.setSelector(selector);
        //设置POD的模板
        Deployment_template template=new Deployment_template();
        PodMetadata pod_metadata=new PodMetadata();
        pod_metadata.setLabels(labels);
        template.setMetadata(pod_metadata);


        String container_name=request.getParameter("container_name");
        String container_image=request.getParameter("container_image");
        int container_port=Integer.parseInt(request.getParameter("container_port"));
        List<Containers> containersLis=new ArrayList<>();
        PodSpec podSpec=new PodSpec();
        Containers containers=new Containers();
        containers.setName(container_name);
//        containers.setImage("nginx:1.7.9");
        containers.setImage(container_image);
        PodPorts podPorts=new PodPorts();
//        podPorts.setContainerPort(81);
        podPorts.setContainerPort(container_port);
//        containers.setPorts(podPorts);
        containersLis.add(containers);
        podSpec.setContainers(containersLis);
        if(node_select.equals("1")){
            Map<String,String> nodeSelector=new HashMap<>();
            nodeSelector.put("node-role.kubernetes.io/edge","");
            podSpec.setNodeSelector(nodeSelector);
        }

        template.setSpec(podSpec);
        spec.setTemplate(template);

        deployment.setSpec(spec);
        JSONObject jsonObject=new JSONObject(deployment);


        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/daemonsets";
        String result= HttpSend.post(jsonObject,url);

        return  "redirect:/GetDeploymentsServicesPods?namespace_name=default";
    }

    @RequestMapping(value = "/CreateStatafulSet",method = POST)
    public String CreateStatafulSet(HttpServletRequest request, HttpServletResponse response){

        String deployment_name=request.getParameter("deployment_name");
        String label_key=request.getParameter("label_key");
        String label_value=request.getParameter("label_value");
        String namespace_name=request.getParameter("namespace_name");
        String node_select=request.getParameter("node_select");
        System.out.println(deployment_name+" "+label_key+" "+label_value+" "+namespace_name+" "+node_select);
        Deployment deployment=new Deployment();
        deployment.setKind("StatefulSet");
        Metadata deploy_metadata=new Metadata();
//        设置Deployment-name
        deploy_metadata.setName(deployment_name);
//        设置Deployment-metadata.labels=new HashMap<>();
        Map<String,String> labels=new HashMap<>();
        labels.put(label_key,label_value);
        deploy_metadata.setLabels(labels);
//        设置Deployment-metadata.namespace
        deploy_metadata.setNamespace(namespace_name);

//        metadata添加进deployment
        deployment.setMetadata(deploy_metadata);




        int replicas=Integer.parseInt(request.getParameter("replicas"));
        Deployment_spec spec=new Deployment_spec();
        // 设置副本数量
        spec.setReplicas(replicas);
        //设置标签
        Selector selector=new Selector();
        Map<String,String> matchLabels=new HashMap<>();
        matchLabels.put(label_key,label_value);
        selector.setMatchLabels(matchLabels);
        spec.setSelector(selector);
        //设置POD的模板
        Deployment_template template=new Deployment_template();
        PodMetadata pod_metadata=new PodMetadata();
        pod_metadata.setLabels(labels);
        template.setMetadata(pod_metadata);


        String container_name=request.getParameter("container_name");
        String container_image=request.getParameter("container_image");
        int container_port=Integer.parseInt(request.getParameter("container_port"));
        List<Containers> containersLis=new ArrayList<>();
        PodSpec podSpec=new PodSpec();
        Containers containers=new Containers();
        containers.setName(container_name);
//        containers.setImage("nginx:1.7.9");
        containers.setImage(container_image);
        PodPorts podPorts=new PodPorts();
//        podPorts.setContainerPort(81);
        podPorts.setContainerPort(container_port);
//        containers.setPorts(podPorts);
        containersLis.add(containers);
        podSpec.setContainers(containersLis);
        if(node_select.equals("1")){
            Map<String,String> nodeSelector=new HashMap<>();
            nodeSelector.put("node-role.kubernetes.io/edge","");
            podSpec.setNodeSelector(nodeSelector);
        }

        template.setSpec(podSpec);
        spec.setTemplate(template);

        deployment.setSpec(spec);
        JSONObject jsonObject=new JSONObject(deployment);


        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/statefulsets";
        String result= HttpSend.post(jsonObject,url);

        return  "redirect:/GetDeploymentsServicesPods?namespace_name=default";
    }









    /**
     * 创建Serive服务
     * 请求地址：POST /api/v1/namespaces/{namespace}/services
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/CreateService",method = POST )
    public String  createService(HttpServletRequest request,HttpServletResponse response){


        Service service=new Service();

        String service_name=request.getParameter("service_name");
        String namespace=request.getParameter("namespace_name");
        String label_key=request.getParameter("label_key");
        String label_value=request.getParameter("label_value");

        Metadata service_metadata=new Metadata();
//        service_metadata.setName("test-nginxservice");
        service_metadata.setName(service_name);
//        service_metadata.setNamespace("default");
        service_metadata.setNamespace(namespace);
        Map<String,String>   servicelabels=new HashMap<>();
        //设置Service自己的标签
        servicelabels.put(label_key,label_value);
        service_metadata.setLabels(servicelabels);

        service.setMetadata(service_metadata);

        ServiceSpec service_spec=new ServiceSpec();
        Map<String,String>   service_spec_selector=new HashMap<>();
        service_spec_selector.put(label_key,label_value);
        service_spec.setSelector(service_spec_selector);


        String type=request.getParameter("type");
        service_spec.setType(type);


        String port_name=request.getParameter("port_name");
        String port_protocol=request.getParameter("port_protocol");
        int port_port=Integer.parseInt(request.getParameter("port_port"));
        int port_targetport=Integer.parseInt(request.getParameter("port_targetport"));
        List<ServicePorts> service_spec_ports=new ArrayList<>();
        ServicePorts servicePorts=new ServicePorts();
        servicePorts.setName(port_name);
        servicePorts.setProtocol(port_protocol);
        servicePorts.setPort(port_port);
        servicePorts.setTargetPort(port_targetport);
        service_spec_ports.add(servicePorts);

        if(type.equals("NodePort")){
            int port_nodeport=Integer.parseInt(request.getParameter("port_nodeport"));
            servicePorts.setNodePort(port_nodeport);
        }

        service_spec.setPorts(service_spec_ports);

        service.setSpec(service_spec);
        String url="http://192.168.43.156:8080/api/v1/namespaces/default/services";

        JSONObject jsonObject=new JSONObject(service);
        String result= HttpSend.post(jsonObject,url);


        return  "redirect:/GetDeploymentsServicesPods?namespace_name=default";
    }



    /**
     *获取具体Deployment
     * HTTP请求：/apis/apps/v1/namespaces/{namespace}/deployments/{name}
     */
    @RequestMapping(value = "/GetDeployment",method = GET)
    public String  getDeployment(HttpServletRequest request, HttpServletResponse response)
    {

        HttpSession session=request.getSession();
        String namespace= (String) session.getAttribute("namespace_name");

        String name=request.getParameter("name");

        System.out.println("name="+name+" "+namespace);


        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace+"/deployments/"+name;

        System.out.println(url);
        String result= HttpSend.get(url);


        ListDeployment deployment=new ListDeployment();

        deployment.setKind("Deployment");

        JSONObject deployment_item=new JSONObject(result);
        JSONObject metadata= deployment_item.getJSONObject("metadata");
        JSONObject spec=deployment_item.getJSONObject("spec");
        JSONObject status=deployment_item.getJSONObject("status");

        JSONObject labels=metadata.getJSONObject("labels");
        JSONObject annotations=metadata.getJSONObject("annotations");
        Gson gson = new Gson();
        Map<String,String> label_map = new HashMap<>();
        label_map= gson.fromJson(labels.toString(), label_map.getClass());
        deployment.setLabels(label_map);


        Map<String,String> annotations_map = new HashMap<>();
        annotations_map= gson.fromJson(annotations.toString(), annotations_map.getClass());
        deployment.setAnnotations(annotations_map);



        Strategy strategy=new Strategy();
        JSONObject stra=spec.getJSONObject("strategy");
        JSONObject rollingUpdate=stra.getJSONObject("rollingUpdate");
        strategy.setType(stra.getString("type"));
        Map<String,String> rollingUpdate_map = new HashMap<>();
        rollingUpdate_map= gson.fromJson(rollingUpdate.toString(), rollingUpdate_map.getClass());
        strategy.setRollingUpdate(rollingUpdate_map);


        int replicas=spec.getInt("replicas");



        List<depoloyment_condition> conditions=new ArrayList<>();

        JSONArray condition_jsonarray=status.getJSONArray("conditions");

        for(int i=0;i<condition_jsonarray.length();i++){
            depoloyment_condition condition=new depoloyment_condition();

            JSONObject item=condition_jsonarray.getJSONObject(i);

            condition.setType(item.getString("type"));
            condition.setStatus(item.getString("status"));
            condition.setLastUpdateTime(item.getString("lastUpdateTime"));
            condition.setMessage(item.getString("message"));
            condition.setReason(item.getString("reason"));
            conditions.add(condition);

        }


        deployment.setReplicas(replicas);
        deployment.setName(name);
        deployment.setStrategy(strategy);
        deployment.setCondition(conditions);
        session.setAttribute("deployment_detail",deployment);








        String url_pod="http://192.168.43.156:8080/api/v1/namespaces/"+namespace+"/pods";

        System.out.println(url_pod);
        String pod_result=HttpSend.get(url_pod);

        JSONObject podList=new JSONObject(pod_result);
        JSONArray pod_items=podList.getJSONArray("items");
        List<ListPod>  pods=new ArrayList<>();

        for(int i=0;i<pod_items.length();i++){

            JSONObject item=pod_items.getJSONObject(i);
            JSONObject pod_matadata=item.getJSONObject("metadata");
            JSONObject pod_spec=item.getJSONObject("spec");
            JSONObject pod_status=item.getJSONObject("status");
            ListPod pod=new ListPod();
            String generateName=pod_matadata.getString("generateName");

            boolean belong=generateName.startsWith(name);
            if(belong){
//                添加该POD

                String pod_name=pod_matadata.getString("name");
                System.out.println("name="+name+" pod_name="+pod_name);

                String namespace_name=pod_matadata.getString("namespace");
                String creationTimestamp=pod_matadata.getString("creationTimestamp");




                String phase=pod_status.getString("phase");




                if(!phase.equals("Pending")){
                    String nodeNmae=pod_spec.getString("nodeName");
                    String podIP=pod_status.getString("podIP");
                    String hostIp=pod_status.getString("hostIP");
                    pod.setNodeName(nodeNmae);
                    pod.setPodIP(podIP);
                    pod.setHostIP(hostIp);
                }




                JSONArray pod_jsonconditon=pod_status.getJSONArray("conditions");
                List<Pod_condition> pod_conditions=new ArrayList<>();

                for(int j=0;j<pod_jsonconditon.length();j++){
                    Pod_condition condition=new Pod_condition();

                    JSONObject Pod_item_condition=pod_jsonconditon.getJSONObject(j);

                    condition.setType(Pod_item_condition.getString("type"));
                    condition.setStatus(Pod_item_condition.getString("status"));
                    condition.setLastTransitionTime(Pod_item_condition.get("lastTransitionTime").toString());

                    pod_conditions.add(condition);

                }




                JSONArray container_array=new JSONArray();
                if(pod_status.has("containerStatuses")){
                    container_array= (JSONArray) pod_status.get("containerStatuses");
                }
                List<ListContainer> containerList=new ArrayList<>();
                for(int k=0;k<container_array.length();k++){
                    ListContainer container=new ListContainer();
                    JSONObject pod_item_container_status=container_array.getJSONObject(k);


                    container.setName(pod_item_container_status.getString("name"));
                    container.setImage(pod_item_container_status.getString("image"));
                    container.setReady(pod_item_container_status.getBoolean("ready"));
                    container.setRestartCount(pod_item_container_status.getInt("restartCount"));
                    container.setImagePullPolicy("Always");

                    containerList.add(container);

                }



                pod.setContainerList(containerList);
                pod.setName(pod_name);
                pod.setConditions(pod_conditions);
                pod.setNamespace_name(namespace_name);
                pod.setCreationTimestamp(creationTimestamp);

                pod.setPhase(phase);

                pods.add(pod);
            }
            else
            {
                continue;
            }

        }
        session.setAttribute("deployment_pods",pods);
        return "redirect:/admin/deployment-detail.jsp";


    }

    @RequestMapping(value = "/GetStatefulSet",method = GET)
    public String  GetStatefulSet(HttpServletRequest request, HttpServletResponse response)
    {

        HttpSession session=request.getSession();
        String namespace= (String) session.getAttribute("namespace_name");

        String name=request.getParameter("name");

        System.out.println("name="+name+" "+namespace);


        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace+"/statefulsets/"+name;

        System.out.println(url);
        String result= HttpSend.get(url);


        ListDeployment deployment=new ListDeployment();

        deployment.setKind("Statefulset");

        JSONObject deployment_item=new JSONObject(result);
        JSONObject metadata= deployment_item.getJSONObject("metadata");
        JSONObject spec=deployment_item.getJSONObject("spec");
        JSONObject status=deployment_item.getJSONObject("status");

        JSONObject labels=metadata.getJSONObject("labels");
//        JSONObject annotations=metadata.getJSONObject("annotations");
        Gson gson = new Gson();
        Map<String,String> label_map = new HashMap<>();
        label_map= gson.fromJson(labels.toString(), label_map.getClass());
        deployment.setLabels(label_map);


        Map<String,String> annotations_map = new HashMap<>();
//        annotations_map= gson.fromJson(annotations.toString(), annotations_map.getClass());
//        deployment.setAnnotations(annotations_map);



//        Strategy strategy=new Strategy();
//        JSONObject stra=spec.getJSONObject("strategy");
//        JSONObject rollingUpdate=stra.getJSONObject("rollingUpdate");
//        strategy.setType(stra.getString("type"));
//        Map<String,String> rollingUpdate_map = new HashMap<>();
//        rollingUpdate_map= gson.fromJson(rollingUpdate.toString(), rollingUpdate_map.getClass());
//        strategy.setRollingUpdate(rollingUpdate_map);


        int replicas=spec.getInt("replicas");



        List<depoloyment_condition> conditions=new ArrayList<>();

//        JSONArray condition_jsonarray=status.getJSONArray("conditions");
//
//        for(int i=0;i<condition_jsonarray.length();i++){
//            depoloyment_condition condition=new depoloyment_condition();
//
//            JSONObject item=condition_jsonarray.getJSONObject(i);
//
//            condition.setType(item.getString("type"));
//            condition.setStatus(item.getString("status"));
//            condition.setLastUpdateTime(item.getString("lastUpdateTime"));
//            condition.setMessage(item.getString("message"));
//            condition.setReason(item.getString("reason"));
//            conditions.add(condition);
//
//        }


        deployment.setReplicas(replicas);
        deployment.setName(name);
//        deployment.setStrategy(strategy);
        deployment.setCondition(conditions);
        session.setAttribute("deployment_detail",deployment);








        String url_pod="http://192.168.43.156:8080/api/v1/namespaces/"+namespace+"/pods";

        System.out.println(url_pod);
        String pod_result=HttpSend.get(url_pod);

        JSONObject podList=new JSONObject(pod_result);
        JSONArray pod_items=podList.getJSONArray("items");
        List<ListPod>  pods=new ArrayList<>();

        for(int i=0;i<pod_items.length();i++){

            JSONObject item=pod_items.getJSONObject(i);
            JSONObject pod_matadata=item.getJSONObject("metadata");
            JSONObject pod_spec=item.getJSONObject("spec");
            JSONObject pod_status=item.getJSONObject("status");
            ListPod pod=new ListPod();
            String generateName=pod_matadata.getString("generateName");

            boolean belong=generateName.startsWith(name);
            if(belong){
//                添加该POD

                String pod_name=pod_matadata.getString("name");
                System.out.println("name="+name+" pod_name="+pod_name);

                String namespace_name=pod_matadata.getString("namespace");
                String creationTimestamp=pod_matadata.getString("creationTimestamp");




                String phase=pod_status.getString("phase");




                if(!phase.equals("Pending")){
                    String nodeNmae=pod_spec.getString("nodeName");
                    String podIP=pod_status.getString("podIP");
                    String hostIp=pod_status.getString("hostIP");
                    pod.setNodeName(nodeNmae);
                    pod.setPodIP(podIP);
                    pod.setHostIP(hostIp);
                }




                JSONArray pod_jsonconditon=pod_status.getJSONArray("conditions");
                List<Pod_condition> pod_conditions=new ArrayList<>();

                for(int j=0;j<pod_jsonconditon.length();j++){
                    Pod_condition condition=new Pod_condition();

                    JSONObject Pod_item_condition=pod_jsonconditon.getJSONObject(j);

                    condition.setType(Pod_item_condition.getString("type"));
                    condition.setStatus(Pod_item_condition.getString("status"));
                    condition.setLastTransitionTime(Pod_item_condition.get("lastTransitionTime").toString());

                    pod_conditions.add(condition);

                }




                JSONArray container_array=new JSONArray();
                if(pod_status.has("containerStatuses")){
                    container_array= (JSONArray) pod_status.get("containerStatuses");
                }
                List<ListContainer> containerList=new ArrayList<>();
                for(int k=0;k<container_array.length();k++){
                    ListContainer container=new ListContainer();
                    JSONObject pod_item_container_status=container_array.getJSONObject(k);


                    container.setName(pod_item_container_status.getString("name"));
                    container.setImage(pod_item_container_status.getString("image"));
                    container.setReady(pod_item_container_status.getBoolean("ready"));
                    container.setRestartCount(pod_item_container_status.getInt("restartCount"));
                    container.setImagePullPolicy("Always");

                    containerList.add(container);

                }



                pod.setContainerList(containerList);
                pod.setName(pod_name);
                pod.setConditions(pod_conditions);
                pod.setNamespace_name(namespace_name);
                pod.setCreationTimestamp(creationTimestamp);

                pod.setPhase(phase);

                pods.add(pod);
            }
            else
            {
                continue;
            }

        }
        session.setAttribute("deployment_pods",pods);
        return "redirect:/admin/statefulset-detail.jsp";


    }

    @RequestMapping(value = "/GetDaemonset",method = GET)
    public String  getGetDaemonset(HttpServletRequest request, HttpServletResponse response)
    {

        HttpSession session=request.getSession();
        String namespace= (String) session.getAttribute("namespace_name");

        String name=request.getParameter("name");

        System.out.println("name="+name+" "+namespace);


        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace+"/daemonsets/"+name;

        System.out.println(url);
        String result= HttpSend.get(url);


        ListDeployment deployment=new ListDeployment();

        deployment.setKind("Daemonset");

        JSONObject deployment_item=new JSONObject(result);
        JSONObject metadata= deployment_item.getJSONObject("metadata");
        JSONObject spec=deployment_item.getJSONObject("spec");
        JSONObject status=deployment_item.getJSONObject("status");

        JSONObject labels=metadata.getJSONObject("labels");
        JSONObject annotations=metadata.getJSONObject("annotations");
        Gson gson = new Gson();
        Map<String,String> label_map = new HashMap<>();
        label_map= gson.fromJson(labels.toString(), label_map.getClass());
        deployment.setLabels(label_map);


        Map<String,String> annotations_map = new HashMap<>();
        annotations_map= gson.fromJson(annotations.toString(), annotations_map.getClass());
        deployment.setAnnotations(annotations_map);



        Strategy strategy=new Strategy();

        JSONObject stra=new JSONObject();
        if(spec.has("strategy")){
            stra=spec.getJSONObject("strategy");;
        }
//        JSONObject rollingUpdate=stra.getJSONObject("rollingUpdate");
//        strategy.setType(stra.getString("type"));
//        Map<String,String> rollingUpdate_map = new HashMap<>();
//        rollingUpdate_map= gson.fromJson(rollingUpdate.toString(), rollingUpdate_map.getClass());
//        strategy.setRollingUpdate(rollingUpdate_map);






        List<depoloyment_condition> conditions=new ArrayList<>();

//        JSONArray condition_jsonarray=status.getJSONArray("conditions");

//        for(int i=0;i<condition_jsonarray.length();i++){
//            depoloyment_condition condition=new depoloyment_condition();
//
//            JSONObject item=condition_jsonarray.getJSONObject(i);
//
//            condition.setType(item.getString("type"));
//            condition.setStatus(item.getString("status"));
//            condition.setLastUpdateTime(item.getString("lastUpdateTime"));
//            condition.setMessage(item.getString("message"));
//            condition.setReason(item.getString("reason"));
//            conditions.add(condition);
//
//        }
        deployment.setName(name);
        deployment.setStrategy(strategy);
        deployment.setCondition(conditions);
        session.setAttribute("deployment_detail",deployment);

        String url_pod="http://192.168.43.156:8080/api/v1/namespaces/"+namespace+"/pods";

        System.out.println(url_pod);
        String pod_result=HttpSend.get(url_pod);

        JSONObject podList=new JSONObject(pod_result);
        JSONArray pod_items=podList.getJSONArray("items");
        List<ListPod>  pods=new ArrayList<>();

        for(int i=0;i<pod_items.length();i++){

            JSONObject item=pod_items.getJSONObject(i);
            JSONObject pod_matadata=item.getJSONObject("metadata");
            JSONObject pod_spec=item.getJSONObject("spec");
            JSONObject pod_status=item.getJSONObject("status");
            ListPod pod=new ListPod();
            String generateName=pod_matadata.getString("generateName");

            boolean belong=generateName.startsWith(name);
            if(belong){
//                添加该POD

                String pod_name=pod_matadata.getString("name");
                System.out.println("name="+name+" pod_name="+pod_name);

                String namespace_name=pod_matadata.getString("namespace");
                String creationTimestamp=pod_matadata.getString("creationTimestamp");




                String phase=pod_status.getString("phase");




                if(!phase.equals("Pending")){
                    String nodeNmae=pod_spec.getString("nodeName");
                    String podIP=pod_status.getString("podIP");
                    String hostIp=pod_status.getString("hostIP");
                    pod.setNodeName(nodeNmae);
                    pod.setPodIP(podIP);
                    pod.setHostIP(hostIp);
                }




                JSONArray pod_jsonconditon=pod_status.getJSONArray("conditions");
                List<Pod_condition> pod_conditions=new ArrayList<>();

                for(int j=0;j<pod_jsonconditon.length();j++){
                    Pod_condition condition=new Pod_condition();

                    JSONObject Pod_item_condition=pod_jsonconditon.getJSONObject(j);

                    condition.setType(Pod_item_condition.getString("type"));
                    condition.setStatus(Pod_item_condition.getString("status"));
                    condition.setLastTransitionTime(Pod_item_condition.get("lastTransitionTime").toString());

                    pod_conditions.add(condition);

                }




                JSONArray container_array=new JSONArray();
                if(pod_status.has("containerStatuses")){
                    container_array= (JSONArray) pod_status.get("containerStatuses");
                }
                List<ListContainer> containerList=new ArrayList<>();
                for(int k=0;k<container_array.length();k++){
                    ListContainer container=new ListContainer();
                    JSONObject pod_item_container_status=container_array.getJSONObject(k);


                    container.setName(pod_item_container_status.getString("name"));
                    container.setImage(pod_item_container_status.getString("image"));
                    container.setReady(pod_item_container_status.getBoolean("ready"));
                    container.setRestartCount(pod_item_container_status.getInt("restartCount"));
                    container.setImagePullPolicy("Always");

                    containerList.add(container);

                }



                pod.setContainerList(containerList);
                pod.setName(pod_name);
                pod.setConditions(pod_conditions);
                pod.setNamespace_name(namespace_name);
                pod.setCreationTimestamp(creationTimestamp);

                pod.setPhase(phase);

                pods.add(pod);
            }
            else
            {
                continue;
            }

        }
        session.setAttribute("deployment_pods",pods);
        return "redirect:/admin/daemonset-deatil.jsp";


    }





    @RequestMapping(value = "/statefulset_scale",method = POST)
    public String  statefulset_scale(HttpServletRequest request,HttpServletResponse response){
        String name=request.getParameter("scale_name");
        String scale_number=request.getParameter("scale_number");


        HttpSession session=request.getSession();
        String namespace_name=session.getAttribute("namespace_name").toString();

        System.out.println("scale_statefulset_name="+name);
//        int number=Integer.parseInt(request.getParameter("number"));
        int number=Integer.parseInt(scale_number);
        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/statefulsets/"+name;

        String result= HttpSend.get(url);


        ListDeployment deployment=new ListDeployment();


        JSONObject deployment_item=new JSONObject(result);
        JSONObject metadata= deployment_item.getJSONObject("metadata");
        JSONObject spec=deployment_item.getJSONObject("spec");

        System.out.println(spec);

        spec.put("replicas",number);
        JSONObject spec_new=new JSONObject();

        spec_new.put("spec",spec);


        String url_patch="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/statefulsets/"+name;
        System.out.println(spec_new);
        System.out.println(url_patch);
        String result_patch=HttpSend.patch(spec_new,url);

        return "redirect:/GetStatefulSet?name="+name;

    }


    @RequestMapping(value = "/deployment_scale",method = POST)
    public String  scale_deploy(HttpServletRequest request,HttpServletResponse response){
        String name=request.getParameter("scale_name");
        String scale_number=request.getParameter("scale_number");


        HttpSession session=request.getSession();
        String namespace_name=session.getAttribute("namespace_name").toString();

        System.out.println("scale_deplpymen_name="+name);
//        int number=Integer.parseInt(request.getParameter("number"));
        int number=Integer.parseInt(scale_number);
        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/deployments/"+name;

        String result= HttpSend.get(url);


        ListDeployment deployment=new ListDeployment();


        JSONObject deployment_item=new JSONObject(result);
        JSONObject metadata= deployment_item.getJSONObject("metadata");
        JSONObject spec=deployment_item.getJSONObject("spec");

        System.out.println(spec);

        spec.put("replicas",number);
        JSONObject spec_new=new JSONObject();

        spec_new.put("spec",spec);


        String url_patch="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/deployments/"+name;
        System.out.println(spec_new);
        System.out.println(url_patch);
        String result_patch=HttpSend.patch(spec_new,url);
        return "redirect:/GetDeployment?name="+name;

    }

    /**
     * 获取命名空间下的所有资源
     * @param namespace_name
     * @param request
     * @param response
     */
    @RequestMapping(value = "/GetDeploymentsServicesPods",method = GET)
    public String getDeployments(@RequestParam("namespace_name") String namespace_name, HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, IOException {

        String namespace=namespace_name;


        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace+"/deployments";

        String result= HttpSend.get(url);


        JSONObject deploymentsList=new JSONObject(result);
        JSONArray deployment_items=deploymentsList.getJSONArray("items");
        System.out.println(deployment_items.length());
        List<ListDeployment>  deployments=new ArrayList<>();
        for(int i=0;i<deployment_items.length();i++){

            ListDeployment deployment=new ListDeployment();
            JSONObject o=deployment_items.getJSONObject(i);

            JSONObject metadata_item=o.getJSONObject("metadata");
            JSONObject status=o.getJSONObject("status");
            JSONObject spec=o.getJSONObject("spec");
            JSONObject spec_template=spec.getJSONObject("template");
            JSONObject spec_template_spec=spec_template.getJSONObject("spec");
            JSONArray containers=spec_template_spec.getJSONArray("containers");



            int replicas=0;

            if(status.has("replicas")){
                replicas=status.getInt("replicas");
            }
            if(status.has("readyReplicas")){
                int readyReplicas=status.getInt("readyReplicas");
                deployment.setReadyReplicas(readyReplicas);
            }
            System.out.println(metadata_item);
            String name=metadata_item.getString("name");
            String time=metadata_item.getString("creationTimestamp");






            String savePath="/Users/SunRuiBin/Documents/graduate/K8sPlatform/src/main/webapp/save/deployment/"+name+".json";
            try {
                File file = new File(savePath);
                if(!file.exists()) {
                    boolean fvar = file.createNewFile();
                    if (fvar) {

                        System.out.println("File has been created successfully");

                    } else {

                        System.out.println("File already present at the specified location");

                    }
                }
                else
                {
                    FileWriter fileWriter =new FileWriter(file);
                    fileWriter.write("");
                    fileWriter.flush();
                    fileWriter.close();
                }

                FileWriter writer = new FileWriter(file, true);
                writer.write(o.toString());
                writer.close();
            }catch (Exception e){
                e.printStackTrace();
            }

            savePath="../save/deployment/"+name+".json";
            deployment.setSavePath(savePath);
            deployment.setName(name);
            deployment.setReplicas(replicas);
            deployment.setTime(time);
            deployments.add(deployment);
        }


        HttpSession session=request.getSession();

        session.setAttribute("deploymentList",deployments);






        String daemonset_url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace+"/daemonsets";

        String daemonset_result= HttpSend.get(daemonset_url);


        JSONObject daemonsetList=new JSONObject(daemonset_result);
        JSONArray daemonset_items=daemonsetList.getJSONArray("items");
        System.out.println(daemonset_items.length());
        List<ListDaemonset>  daemonsets=new ArrayList<>();
        for(int i=0;i<daemonset_items.length();i++){

            ListDaemonset daemonset=new ListDaemonset();
            JSONObject o=daemonset_items.getJSONObject(i);

            JSONObject metadata_item=o.getJSONObject("metadata");
            JSONObject status=o.getJSONObject("status");
            JSONObject spec=o.getJSONObject("spec");
            JSONObject spec_template=spec.getJSONObject("template");
            JSONObject spec_template_spec=spec_template.getJSONObject("spec");
            JSONArray containers=spec_template_spec.getJSONArray("containers");



            int currentNumberScheduled=status.getInt("currentNumberScheduled");
            if(status.has("numberReady")){
                int readyReplicas=status.getInt("numberReady");
                daemonset.setNumberReady(readyReplicas);
            }
            System.out.println(metadata_item);
            String name=metadata_item.getString("name");
            String time=metadata_item.getString("creationTimestamp");


           daemonset.setCurrentNumberScheduled(currentNumberScheduled);
           daemonset.setName(name);
           daemonset.setTime(time);

           daemonsets.add(daemonset);
        }

        session.setAttribute("daemonSetList",daemonsets);



        String statefulset_url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace+"/statefulsets";

        String statefulset_result= HttpSend.get(statefulset_url);


        JSONObject statefulsetList=new JSONObject(statefulset_result);
        JSONArray statefulset_items=statefulsetList.getJSONArray("items");
        System.out.println(statefulset_items.length());
        List<ListStatefulsets>  statefulsets=new ArrayList<>();
        for(int i=0;i<statefulset_items.length();i++){

            ListStatefulsets statefulset=new ListStatefulsets();
            JSONObject o=statefulset_items.getJSONObject(i);

            JSONObject metadata_item=o.getJSONObject("metadata");
            JSONObject status=o.getJSONObject("status");
            JSONObject spec=o.getJSONObject("spec");
            JSONObject spec_template=spec.getJSONObject("template");
            JSONObject spec_template_spec=spec_template.getJSONObject("spec");
            JSONArray containers=spec_template_spec.getJSONArray("containers");



            int replicas=status.getInt("replicas");
            if(status.has("readyReplicas")){
                int readyReplicas=status.getInt("readyReplicas");
                statefulset.setReadyReplicas(readyReplicas);
            }


            System.out.println(metadata_item);
            String name=metadata_item.getString("name");
            String time=metadata_item.getString("creationTimestamp");


            statefulset.setName(name);
            statefulset.setTime(time);
            statefulset.setReplicas(replicas);

            statefulsets.add(statefulset);
        }

        session.setAttribute("statefulsetList",statefulsets);







        String url_service="http://192.168.43.156:8080/api/v1/namespaces/"+namespace+"/services";

        String service_result=HttpSend.get(url_service);

        JSONObject servicesList=new JSONObject(service_result);
        JSONArray services_items=servicesList.getJSONArray("items");
        List<ListService>  services=new ArrayList<>();
        for(int i=0;i<services_items.length();i++){

            ListService service=new ListService();
            JSONObject o=services_items.getJSONObject(i);

            JSONObject metadata_item=o.getJSONObject("metadata");
            JSONObject status=o.getJSONObject("status");
            JSONObject spec=o.getJSONObject("spec");


            JSONArray spec_ports=spec.getJSONArray("ports");


            JSONObject ports=spec_ports.getJSONObject(0);
            int port=ports.getInt("port");


            String type=spec.getString("type");


//                int targetPort=ports.getInt("targetPort");
            if(type.equals("NodePort")){
                int nodePort=ports.getInt("nodePort");
                service.setNodePort(nodePort);
            }





            String clusterIP=spec.getString("clusterIP");

            String name=metadata_item.getString("name");
            String time=metadata_item.getString("creationTimestamp");


            String savePath="/Users/SunRuiBin/Documents/graduate/K8sPlatform/src/main/webapp/save/service/"+name+".json";

            try {
                File file = new File(savePath);
                if(!file.exists()) {
                    boolean fvar = file.createNewFile();
                    if (fvar) {
                        System.out.println("File has been created successfully");
                    } else {
                        System.out.println("File already present at the specified location");
                    }
                }
                else
                {
                    FileWriter fileWriter =new FileWriter(file);
                    fileWriter.write("");
                    fileWriter.flush();
                    fileWriter.close();
                }
                FileWriter writer = new FileWriter(file);
                writer.write(o.toString());
                writer.flush();
                writer.close();
            }catch (Exception e){
                e.printStackTrace();
            }
            savePath="../save/service/"+name+".json";
            service.setSavePath(savePath);
            service.setName(name);
            service.setClusterIP(clusterIP);
            service.setPort(port);
//            service.setTargetPort(targetPort)
            service.setType(type);
            service.setCreationTimestamp(time);
            services.add(service);
        }

        session.setAttribute("serviceList",services);





        String url_pod="http://192.168.43.156:8080/api/v1/namespaces/"+namespace+"/pods";

        String pod_result=HttpSend.get(url_pod);

        JSONObject podList=new JSONObject(pod_result);
        JSONArray pod_items=podList.getJSONArray("items");
        List<ListPod>  pods=new ArrayList<>();


        for(int k=0;k<pod_items.length();k++){
            JSONObject pod=pod_items.getJSONObject(k);
            JSONObject metadata=pod.getJSONObject("metadata");
            JSONObject status=pod.getJSONObject("status");
            JSONObject spec=pod.getJSONObject("spec");


            String name=metadata.getString("name");

            ListPod pod1=new ListPod();
            String phase=status.getString("phase");
            System.out.println("PodPhase"+phase);
            if(!phase.equals("Pending")){
                String nodeNmae=spec.getString("nodeName");
                String podIP=name;
                if(status.has("podIP")){
                    podIP=status.getString("podIP");
                }
                pod1.setNodeName(nodeNmae);
                pod1.setPodIP(podIP);
            }


            String savePath="/Users/SunRuiBin/Documents/graduate/K8sPlatform/src/main/webapp/save/pod/"+name+".json";

            try {
                File file = new File(savePath);

                if(!file.exists()){
                    boolean fvar= file.createNewFile();
                    if (fvar){
                        System.out.println("File has been created successfully");
                    }

                    else{
                        System.out.println("File already present at the specified location");
                    }

                }
                else
                {
                    FileWriter fileWriter =new FileWriter(file);
                    fileWriter.write("");
                    fileWriter.flush();
                    fileWriter.close();
                }
                FileWriter writer = new FileWriter(file);
                writer.write(pod.toString());
                writer.flush();
                writer.close();


            }catch (Exception e){
                e.printStackTrace();
            }

            savePath="../save/pod/"+name+".json";
            pod1.setSavePath(savePath);
            pod1.setName(name);

            pod1.setPhase(phase);

            pods.add(pod1);
        }

        session.setAttribute("podList",pods);

        session.setAttribute("namespace_name",namespace_name);
        return "redirect:/admin/operate-application.jsp";
    }



    @RequestMapping(value = "/deleteDeployment",method = POST)
    public void deleteDeployment(@RequestParam("name") String name, HttpServletRequest request,HttpServletResponse response) throws IOException {

        HttpSession session=request.getSession();
        String namespace_name=session.getAttribute("namespace_name").toString();
        JSONObject jsonObject=new JSONObject();
        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/deployments/"+name;
        String result=HttpSend.delete(url,jsonObject);
        System.out.println(result);

        String message="";
        message="删除成功!";
        Gson gson=new Gson();
        String json=gson.toJson(message);
        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().write(json);
    }

    @RequestMapping(value = "/deleteDaemonSet",method = POST)
    public void deleteDaemonSet(@RequestParam("name") String name, HttpServletRequest request,HttpServletResponse response) throws IOException {

        HttpSession session=request.getSession();
        String namespace_name=session.getAttribute("namespace_name").toString();
        JSONObject jsonObject=new JSONObject();
        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/daemonsets/"+name;
        String result=HttpSend.delete(url,jsonObject);
        System.out.println(result);

        String message="";
        message="删除成功!";
        Gson gson=new Gson();
        String json=gson.toJson(message);
        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().write(json);
    }

    @RequestMapping(value = "/deleteStatefulSet",method = POST)
    public void deleteStatefulSet(@RequestParam("name") String name, HttpServletRequest request,HttpServletResponse response) throws IOException {

        HttpSession session=request.getSession();
        String namespace_name=session.getAttribute("namespace_name").toString();
        JSONObject jsonObject=new JSONObject();
        String url="http://192.168.43.156:8080/apis/apps/v1/namespaces/"+namespace_name+"/statefulsets/"+name;
        String result=HttpSend.delete(url,jsonObject);
        System.out.println(result);

        String message="";
        message="删除成功!";
        Gson gson=new Gson();
        String json=gson.toJson(message);
        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().write(json);
    }



    /**
     * 获取全部的Service
     * HTTP: /api/v1/namespaces/{namespace}/services
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/GetServices",method = GET)
    public void get_service(HttpServletRequest request,HttpServletResponse response){

        String namespace="default";
        String url="http://192.168.43.156:8080/api/v1/namespaces/"+namespace+"/services";

        String result=HttpSend.get(url);

        JSONObject jsonObject=new JSONObject(result);

        System.out.println(result);
    }










}
