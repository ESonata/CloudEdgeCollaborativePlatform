package com.fuful.k8sentity.StatefulSet;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/3/13.
 */
public class Selector {

    Map<String,String> matchLabels=new HashMap<>();

    public Map<String, String> getMatchLabels() {
        return matchLabels;
    }

    public void setMatchLabels(Map<String, String> matchLabels) {
        this.matchLabels = matchLabels;
    }
}
