package com.fuful.k8sentity.DaemonSet;

/**
 * Created by SunRuiBin on 2020/3/13.
 */
public class Deployment_spec {

    int replicas;
    Selector selector;

    Deployment_template template;

    public int getReplicas() {
        return replicas;
    }

    public void setReplicas(int replicas) {
        this.replicas = replicas;
    }

    public Selector getSelector() {
        return selector;
    }

    public void setSelector(Selector selector) {
        this.selector = selector;
    }

    public Deployment_template getTemplate() {
        return template;
    }

    public void setTemplate(Deployment_template template) {
        this.template = template;
    }
}
