package com.fuful.k8sentity.Pod;

/**
 * Created by SunRuiBin on 2020/5/16.
 */
public class Pod_condition {
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLastTransitionTime() {
        return lastTransitionTime;
    }

    public void setLastTransitionTime(String lastTransitionTime) {
        this.lastTransitionTime = lastTransitionTime;
    }

    String type;
    String status;
    String lastTransitionTime;
}
