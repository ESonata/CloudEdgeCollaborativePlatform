package com.fuful.utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.*;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONArray;
import org.json.JSONObject;






public class HttpSend {

    public static String getJsonData(JSONObject jsonParam,String urls) {
        StringBuffer sb=new StringBuffer();
        try {
            ;
            // 创建url资源
            URL url = new URL(urls);
            // 建立http连接
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // 设置允许输出
            conn.setDoOutput(true);
            // 设置允许输入
            conn.setDoInput(true);
            // 设置不用缓存
            conn.setUseCaches(false);
            // 设置传递方式
            conn.setRequestMethod("POST");
            // 设置维持长连接
            conn.setRequestProperty("Connection", "Keep-Alive");
            // 设置文件字符集:
            conn.setRequestProperty("Charset", "UTF-8");
            // 转换为字节数组
            byte[] data = (jsonParam.toString()).getBytes();
            // 设置文件长度
            conn.setRequestProperty("Content-Length", String.valueOf(data.length));
            // 设置文件类型:
            conn.setRequestProperty("contentType", "application/json");
            // 开始连接请求
            conn.connect();
            OutputStream out = new DataOutputStream(conn.getOutputStream()) ;
            // 写入请求的字符串
            out.write((jsonParam.toString()).getBytes());
            out.flush();
            out.close();

            System.out.println(conn.getResponseCode());

            // 请求返回的状态
            if (HttpURLConnection.HTTP_OK == conn.getResponseCode()){
                System.out.println("连接成功");
                // 请求返回的数据
                InputStream in1 = conn.getInputStream();
                try {
                    String readLine=new String();
                    BufferedReader responseReader=new BufferedReader(new InputStreamReader(in1,"UTF-8"));
                    while((readLine=responseReader.readLine())!=null){
                        sb.append(readLine).append("\n");
                    }
                    responseReader.close();
                    System.out.println(sb.toString());

                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
            else  {
                System.out.println("error++");
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return sb.toString();

    }


//    GET的请求
    public static String get(String url){
        String result = "";
        HttpGet get = new HttpGet(url);
        try{
            CloseableHttpClient httpClient = HttpClients.createDefault();

            HttpResponse response = httpClient.execute(get);
            result = getHttpEntityContent(response);

            if(response.getStatusLine().getStatusCode()!= HttpStatus.SC_OK){
                result = "服务器异常";
            }
        } catch (Exception e){
            System.out.println("请求异常");
            throw new RuntimeException(e);
        } finally{
            get.abort();
        }
        return result;
    }

    public static String getHttpEntityContent(HttpResponse response) throws UnsupportedOperationException, IOException{
        String result = "";
        HttpEntity entity = response.getEntity();
        if(entity != null){
            InputStream in = null;
            try {
                in = entity.getContent();
            } catch (IOException e) {
                e.printStackTrace();
            }
            BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
            StringBuilder strber= new StringBuilder();
            String line = null;
            while((line = br.readLine())!=null){
                strber.append(line+'\n');
            }
            br.close();
            in.close();
            result = strber.toString();
        }

        return result;

    }


//    提交数据的请求
    public static String post(JSONObject json, String url){
        String result = "";
        HttpPost post = new HttpPost(url);

        try{
            CloseableHttpClient httpClient = HttpClients.createDefault();

            post.setHeader("Content-Type","application/json;charset=utf-8");
            post.addHeader("Authorization", "Basic YWRtaW46");
            StringEntity postingString = new StringEntity(json.toString(),"utf-8");
            post.setEntity(postingString);
            HttpResponse response = httpClient.execute(post);

            InputStream in = response.getEntity().getContent();
            BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
            StringBuilder strber= new StringBuilder();
            String line = null;
            while((line = br.readLine())!=null){
                strber.append(line+'\n');
            }
            br.close();
            in.close();
            result = strber.toString();
//            if(response.getStatusLine().getStatusCode()!=HttpStatus.SC_OK){
//                result = "服务器异常";
//            }
        } catch (Exception e){
            System.out.println("请求异常");
            throw new RuntimeException(e);
        } finally{
            post.abort();
        }
        return result;
    }

    //    提交数据的请求
    public static String postImage(JSONObject json, String url){
        String result = "";
        HttpPost post = new HttpPost(url);

        try{
            CloseableHttpClient httpClient = HttpClients.createDefault();

            post.setHeader("Content-Type","application/json;charset=utf-8");
//            post.addHeader("Authorization", "Basic YWRtaW5IYXJib3IxMjM0NQ==");
            StringEntity postingString = new StringEntity(json.toString(),"utf-8");
            post.setEntity(postingString);
            HttpResponse response = httpClient.execute(post);

            InputStream in = response.getEntity().getContent();
            BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
            StringBuilder strber= new StringBuilder();
            String line = null;
            while((line = br.readLine())!=null){
                strber.append(line+'\n');
            }
            br.close();
            in.close();
            result = strber.toString();
            if(response.getStatusLine().getStatusCode()!=HttpStatus.SC_OK){
                result = "服务器异常";
            }
        } catch (Exception e){
            System.out.println("请求异常");
            throw new RuntimeException(e);
        } finally{
            post.abort();
        }
        return result;
    }






    //    删除的HTTP请求
    public static String delete(String url,
                               JSONObject json) throws IOException {
        HttpResponse response;
        String result;
        CloseableHttpClient client = HttpClientBuilder.create().build();
        HttpDeleteWithBody delete = new HttpDeleteWithBody(url);
//        StringEntity deleteString = new StringEntity(json.toString(),"utf-8");
//        delete.setEntity(deleteString);
        delete.setHeader("Content-Type","application/json;charset=utf-8");
        response = client.execute(delete);
        InputStream in = response.getEntity().getContent();
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
        StringBuilder strber= new StringBuilder();
        String line = null;
        while((line = br.readLine())!=null){
            strber.append(line+'\n');
        }
        br.close();
        in.close();
        result = strber.toString();
        return result;
    }





    //    Patch操作
    public static String patch(JSONObject json, String url){
        String result = "";
        HttpPatch patch = new HttpPatch(url);

        try{
            CloseableHttpClient httpClient = HttpClients.createDefault();

            patch.setHeader("Content-Type","application/strategic-merge-patch+json");
//            post.addHeader("Authorization", "Basic YWRtaW46");
            patch.addHeader("x-http-method-override","PATCH");
            StringEntity postingString = new StringEntity(json.toString(),"utf-8");
            patch.setEntity(postingString);
            HttpResponse response = httpClient.execute(patch);

            InputStream in = response.getEntity().getContent();
            BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
            StringBuilder strber= new StringBuilder();
            String line = null;
            while((line = br.readLine())!=null){
                strber.append(line+'\n');
            }
            br.close();
            in.close();
            result = strber.toString();
//            if(response.getStatusLine().getStatusCode()!=HttpStatus.SC_OK){
//                result = "服务器异常";
//            }
        } catch (Exception e){
            System.out.println("请求异常");
            throw new RuntimeException(e);
        } finally{
            patch.abort();
        }
        return result;
    }








    public static void main(String[] args) {
        JSONObject jsonParam = new JSONObject();
        jsonParam.put("id", "1401_1406");
        jsonParam.put("device_size", "480x720");
        String url="www.baidu.com";
        String data=HttpSend.getJsonData(jsonParam,url);
        //返回的是一个[{}]格式的字符串时:
//        JSONArray jsonArray = new JSONArray(data);
        //返回的是一个{}格式的字符串时:
//               JSONObject obj= new JSONObject(data);
    }
}

