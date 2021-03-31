package com.fuful.k8sentity.Deployment;

/**
 * Created by SunRuiBin on 2020/3/13.
 */
public class Deployment_template {

        PodMetadata metadata;
        PodSpec spec;

    public PodMetadata getMetadata() {
        return metadata;
    }

    public void setMetadata(PodMetadata metadata) {
        this.metadata = metadata;
    }

    public PodSpec getSpec() {
        return spec;
    }

    public void setSpec(PodSpec spec) {
        this.spec = spec;
    }
}
