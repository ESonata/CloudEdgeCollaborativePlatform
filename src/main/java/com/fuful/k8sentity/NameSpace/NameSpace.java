package com.fuful.k8sentity.NameSpace;

import com.fuful.k8sentity.Deployment.Metadata;

/**
 * Created by SunRuiBin on 2020/3/7.
 */
public class NameSpace {
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

    String apiVersion="v1";
    String kind="Namespace";


    public Metadata getMetadata() {
        return metadata;
    }

    public void setMetadata(Metadata metadata) {
        this.metadata = metadata;
    }

    Metadata metadata;
}
