package com.fuful.k8sentity.DaemonSet;

/**
 * Created by SunRuiBin on 2020/3/13.
 */
public class Containers {

    String name;
    String image;
//    PodPorts ports;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

//    public PodPorts getPorts() {
//        return ports;
//    }
//
//    public void setPorts(PodPorts ports) {
//        this.ports = ports;
//    }
}
