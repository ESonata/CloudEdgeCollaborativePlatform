package com.fuful.k8sentity.Pod;

import java.util.List;

/**
 * Created by SunRuiBin on 2020/4/12.
 */
public class ListPod {
    String name;
    List<ListContainer> containerList;
    String phase;
    String nodeName;
    String savePath;

    String creationTimestamp;

    String namespace_name;
    String hostIP;

    public String getNamespace_name() {
        return namespace_name;
    }

    public void setNamespace_name(String namespace_name) {
        this.namespace_name = namespace_name;
    }

    public String getHostIP() {
        return hostIP;
    }

    public void setHostIP(String hostIP) {
        this.hostIP = hostIP;
    }

    public String getCreationTimestamp() {
        return creationTimestamp;
    }

    public void setCreationTimestamp(String creationTimestamp) {
        this.creationTimestamp = creationTimestamp;
    }

    List<Pod_condition> conditions;

    public List<Pod_condition> getConditions() {
        return conditions;
    }

    public void setConditions(List<Pod_condition> conditions) {
        this.conditions = conditions;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getPodIP() {
        return podIP;
    }

    public void setPodIP(String podIP) {
        this.podIP = podIP;
    }

    String podIP;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<ListContainer> getContainerList() {
        return containerList;
    }

    public void setContainerList(List<ListContainer> containerList) {
        this.containerList = containerList;
    }

    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }
}
