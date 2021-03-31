package com.fuful.utils;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.model.AuthConfig;
import com.github.dockerjava.api.model.AuthResponse;
import com.github.dockerjava.api.model.PushResponseItem;
import com.github.dockerjava.core.DefaultDockerClientConfig;
import com.github.dockerjava.core.DockerClientBuilder;
import com.github.dockerjava.core.DockerClientConfig;
import com.github.dockerjava.core.command.PushImageResultCallback;

/**
 * Created by SunRuiBin on 2020/3/12.
 */
public class DockerUtils {

    private static DockerClient dockerClient;

    private static final Object lock = new Object();

    private DockerUtils (){}

    public static DockerClient getConnection(String ip, String port) {
        if (dockerClient == null) {
            synchronized (lock) {
                if (dockerClient == null) {
                    DockerClientConfig config = getConfig(ip, port);
                    dockerClient = DockerClientBuilder.getInstance(config).build();
                }
            }
        }
        return dockerClient;
    }

    private static DockerClientConfig getConfig(String ip, String port) {
        DockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder()
                .withDockerHost("tcp://" + ip + ":" + port)
                .withDockerTlsVerify(false)
                .withDockerCertPath("/root/.docker/certs")
                .withDockerConfig("/root/.docker")
                .withApiVersion("1.26")
//                .withRegistryUrl("https://172.16.1.57/v2/")  //这里登陆对后面push镜像没关系
//                .withRegistryUsername("admin")
//                .withRegistryPassword("Harbor12345")
                .build();
        return config;
    }

    public static void main(String[] args) {
        DockerClient client = DockerUtils.getConnection("172.16.1.57", "5555");
        AuthResponse authResponse = client.authCmd().exec();
        System.out.printf("authResponse"+ authResponse.getStatus());

        //上传验证的私服仓库的镜像必须设置
        AuthConfig authConfig = new AuthConfig();
        authConfig.withRegistryAddress("http://172.16.1.57/v2/");
        authConfig.withUsername("admin");
        authConfig.withPassword("Harbor12345");

        try {
            client.pushImageCmd("172.16.2.36:5000/myTomcat:v1.0").withAuthConfig(authConfig).exec(new PushImageResultCallback() {
                @Override
                public void onNext(PushResponseItem item) {
                    System.out.println("id:" + item.getId()  +" status: "+item.getStatus());
                    super.onNext(item);
                }

                @Override
                public void onComplete() {
                    System.out.println("Image pushed completed!");
                    super.onComplete();
                }

                @Override
                public void onError(Throwable throwable) {
                    System.out.println("Image pushed onError!");
                    super.onError(throwable);
                }
            }).awaitSuccess();
            System.out.println("OK");
        } catch (Exception e) {
            System.out.println("e:" + e.getMessage());
            e.printStackTrace();
        }
    }
}