package com.fuful.k8sentity.Deployment;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/3/7.
 */
public class Metadata {
    String name;

    String namespace;


    Map<String,String>   labels=new HashMap<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNamespace() {
        return namespace;
    }

    public void setNamespace(String namespace) {
        this.namespace = namespace;
    }

    public Map<String, String> getLabels() {
        return labels;
    }

    public void setLabels(Map<String, String> labels) {
        this.labels = labels;
    }
}
