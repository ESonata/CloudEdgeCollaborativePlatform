package com.fuful.utils;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.command.DockerCmdExecFactory;
import com.github.dockerjava.api.command.ListImagesCmd;
import com.github.dockerjava.api.command.LoadImageCmd;
import com.github.dockerjava.api.model.*;
import com.github.dockerjava.core.DefaultDockerClientConfig;
import com.github.dockerjava.core.DockerClientBuilder;
import com.github.dockerjava.core.DockerClientConfig;
import com.github.dockerjava.core.command.PushImageResultCallback;
import com.github.dockerjava.jaxrs.JerseyDockerCmdExecFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;


/**
 * Created by SunRuiBin on 2020/3/11.
 */
public class UploadThread extends Thread {

    private final static Logger logger = LoggerFactory.getLogger(UploadThread.class);

    private String dockerHost;

    private String registryAddress;

    private String registryUserName;

    private String registryPassword;

    private InputStream inputStream;

    private String originalImageName;

    private String imageName;

    private String Version;

    public UploadThread(String registryAddress, String dockerHost, String registryUserName, String registryPassword,
                        String originalImageName, String imageName,String Version, InputStream inputStream) {
        super();
        this.originalImageName = originalImageName;
        this.imageName = imageName;
        this.dockerHost = dockerHost;
        this.registryAddress = registryAddress;
        this.registryUserName = registryUserName;
        this.registryPassword = registryPassword;
        this.inputStream = inputStream;
        this.Version=Version;
    }

    @Override
    public void run() {

        long beginTime = System.currentTimeMillis();
        if (StringUtils.isEmpty(registryUserName)) {
            registryUserName = null;
        }
        if (StringUtils.isEmpty(registryPassword)) {
            registryPassword = null;
        }
        System.out.println("imageName = " + imageName);
        System.out.println("originalname = " + originalImageName);
        System.out.println("dockerHost = " + dockerHost);
        System.out.println("registryAddress = " + registryAddress);
        System.out.println("registryUserName = " + registryUserName);
        System.out.println("registryPassword = " + registryPassword);

        AuthConfig authConfig = new AuthConfig()
                .withUsername(registryUserName)
                .withPassword(registryPassword)
                .withRegistryAddress(registryAddress);

        DockerClientConfig dockerClientConfig = DefaultDockerClientConfig.createDefaultConfigBuilder()
                .withDockerHost(dockerHost)
                .build();

        DockerCmdExecFactory dockerCmdExecFactory = new JerseyDockerCmdExecFactory().withReadTimeout(60000)
                .withConnectTimeout(1000)
                .withMaxTotalConnections(100)
                .withMaxPerRouteConnections(10);

        DockerClient dockerClient = DockerClientBuilder.getInstance(dockerClientConfig)
                .withDockerCmdExecFactory(dockerCmdExecFactory)
                .build();
        System.out.println("docker versin is " + dockerClient.versionCmd().exec().getVersion().toString());

        Info info = dockerClient.infoCmd().exec();
        System.out.print("info:"+info);
        System.out.println(originalImageName+"  "+imageName);

        System.out.println("inputStream:"+inputStream);
        try {
            //加载镜像
            LoadImageCmd loadImageCmd = dockerClient.loadImageCmd(inputStream);
            loadImageCmd.exec();


            //push至镜像仓库
            PushImageResultCallback pushImageResultCallback = new PushImageResultCallback() {
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
            };

            if (!originalImageName.equalsIgnoreCase(imageName+":"+Version)) {
                dockerClient.tagImageCmd(originalImageName, imageName, Version).exec();
            }

            dockerClient.pushImageCmd(imageName+":"+Version)
                    .withAuthConfig(authConfig)
                    .exec(pushImageResultCallback)
                    .awaitSuccess();

            System.out.println("push至docker镜像仓库后，删除本地load的镜像");
//            dockerClient.removeImageCmd(originalImageName).exec();
            if (!originalImageName.equalsIgnoreCase(imageName+":"+Version)) {
                dockerClient.removeImageCmd(imageName+":"+Version).exec();
            }

            System.out.println("本地镜像删除成功");

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("上传Docker镜像失败");
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("文件流关闭失败");
                }
            }
        }
        // }
        long endTime = System.currentTimeMillis();
        System.out.println("上传Docker镜像结束，用时：" + (endTime - beginTime) + "ms");
    }
}
