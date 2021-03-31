package com.fuful.k8sentity.Service;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fuful.k8sentity.Deployment.Selector;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/3/14.
 */
public class ServiceSpec {

    Map<String,String> selector=new HashMap<>();
    String type;
//    String clusterIP;

    List<ServicePorts> ports=new ArrayList<>();


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<ServicePorts> getPorts() {
        return ports;
    }

    public void setPorts(List<ServicePorts> ports) {
        this.ports = ports;
    }

    public Map<String, String> getSelector() {
        return selector;
    }

    public void setSelector(Map<String, String> selector) {
        this.selector = selector;
    }
}
