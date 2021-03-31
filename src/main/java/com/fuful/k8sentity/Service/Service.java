package com.fuful.k8sentity.Service;

import com.fuful.k8sentity.Deployment.Metadata;

/**
 * Created by SunRuiBin on 2020/3/14.
 */
public class Service {

    String apiVersion="v1";
    String kind="Service";
    Metadata metadata;

    ServiceSpec spec;
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

    public ServiceSpec getSpec() {
        return spec;
    }

    public void setSpec(ServiceSpec spec) {
        this.spec = spec;
    }
}
