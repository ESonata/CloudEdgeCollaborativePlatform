package com.fuful.k8sentity.Deployment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/4/10.
 */
public class ListDeployment {
    String name;
    int replicas;
    String savePath;

    public void setKind(String kind) {
        this.kind = kind;
    }

    String kind;

    public String getKind() {
        return kind;
    }

    Strategy strategy;


    public List<depoloyment_condition> getCondition() {
        return condition;
    }

    public void setCondition(List<depoloyment_condition> condition) {
        this.condition = condition;
    }

    List<depoloyment_condition> condition;
    public Strategy getStrategy() {
        return strategy;
    }

    public void setStrategy(Strategy strategy) {
        this.strategy = strategy;
    }

    public Map<String, String> getLabels() {
        return labels;
    }

    public void setLabels(Map<String, String> labels) {
        this.labels = labels;
    }

    public Map<String, String> getAnnotations() {
        return annotations;
    }

    public void setAnnotations(Map<String, String> annotations) {
        this.annotations = annotations;
    }

    Map<String,String> labels=new HashMap<>();
    Map<String,String> annotations=new HashMap<>();



    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public int getReplicas() {
        return replicas;
    }

    public void setReplicas(int replicas) {
        this.replicas = replicas;
    }

    public int getReadyReplicas() {
        return readyReplicas;
    }

    public void setReadyReplicas(int readyReplicas) {
        this.readyReplicas = readyReplicas;
    }

    int readyReplicas;
    String time;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
