package com.fuful.k8sentity.Deployment;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/4/20.
 */
public class Strategy {
    String type;
    Map<String,String> rollingUpdate=new HashMap<>();

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Map<String, String> getRollingUpdate() {
        return rollingUpdate;
    }

    public void setRollingUpdate(Map<String, String> rollingUpdate) {
        this.rollingUpdate = rollingUpdate;
    }
}
