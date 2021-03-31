package com.fuful.k8sentity.Deployment;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/3/14.
 */
public class PodMetadata {



    public Map<String, String> getLabels() {
        return labels;
    }

    public void setLabels(Map<String, String> labels) {
        this.labels = labels;
    }

    Map<String,String>   labels=new HashMap<>();



}
