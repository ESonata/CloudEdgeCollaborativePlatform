package com.fuful.k8sentity.StatefulSet;

/**
 * Created by SunRuiBin on 2020/3/13.
 */
public class Deployment {


    String apiVersion="apps/v1";
    String kind="Daemonset";
    Metadata metadata;
    Deployment_spec spec;


    public String getApiVersion() {
        return apiVersion;
    }

    public void setApiVersion(String apiVersion) {
        this.apiVersion = apiVersion;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public Metadata getMetadata() {
        return metadata;
    }

    public void setMetadata(Metadata metadata) {
        this.metadata = metadata;
    }

    public Deployment_spec getSpec() {
        return spec;
    }

    public void setSpec(Deployment_spec spec) {
        this.spec = spec;
    }
}
