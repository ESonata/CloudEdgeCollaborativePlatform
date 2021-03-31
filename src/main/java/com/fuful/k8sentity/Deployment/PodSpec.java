package com.fuful.k8sentity.Deployment;

import com.fuful.k8sentity.Deployment.Deployment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/3/13.
 */
public class PodSpec {





    List<Containers> containers=new ArrayList<>();
    Map<String,String> nodeSelector=new HashMap<>();

    public Map<String, String> getNodeSelector() {
        return nodeSelector;
    }

    public void setNodeSelector(Map<String, String> nodeSelector) {
        this.nodeSelector = nodeSelector;
    }

    public List<Containers> getContainers() {
        return containers;
    }

    public void setContainers(List<Containers> containers) {
        this.containers = containers;
    }
}
