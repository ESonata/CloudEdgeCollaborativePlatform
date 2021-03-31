package com.fuful.k8sentity.DaemonSet;

/**
 * Created by SunRuiBin on 2020/3/6.
 */

public class Pod {
    String apiVersion;
    String kind;
    String metdata;

}
/*
apiVersion: v1
kind: Pod
metadata:
  name: influxdb
spec:
  containers:
    - name: influxdb
      image: influxdb
      ports:
        - containerPort: 8086
          hostPort: 8086

 */