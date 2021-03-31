package com.fuful.k8sentity.DaemonSet;

/**
 * Created by SunRuiBin on 2020/4/10.
 */
public class ListDaemonset {
    String name;
    int replicas;
    String savePath;

    int numberReady;

    public int getNumberReady() {
        return numberReady;
    }

    public void setNumberReady(int numberReady) {
        this.numberReady = numberReady;
    }

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

    public int getCurrentNumberScheduled() {
        return currentNumberScheduled;
    }

    public void setCurrentNumberScheduled(int currentNumberScheduled) {
        this.currentNumberScheduled = currentNumberScheduled;
    }

    int currentNumberScheduled;
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
