package com.fuful.k8sControllers;

import com.fuful.domain.BookSuperType;
import com.fuful.k8sentity.Harbor.HarborImage;
import com.fuful.k8sentity.Harbor.ImageBean;
import com.fuful.k8sentity.Harbor.Project_id_name;
import com.fuful.service.HarborService;
import com.fuful.utils.HttpSend;
import com.fuful.utils.UnCompress;
import com.fuful.utils.UploadThread;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import net.sf.json.JSON;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * Created by SunRuiBin on 2020/3/11.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
@Controller
public class ImageController {

    private String registryAddress="192.168.43.156";
    private String dockerHost="tcp://192.168.43.156:2375";
    private String registryUserName="admin";
    private String registryPassword="Harbor12345";



    @Autowired
    HarborService harborService;
    /**
     * 上传镜像到Harbor仓库
     * @param file
     * @param project
     * @param softwareName
     * @param Version
     * @return
     */
    @RequestMapping(value="/loadToRepository", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String loadImageToRepository (@RequestPart(value = "image") MultipartFile file,@RequestParam("originImageName")  String originImageName,@RequestParam("project") String project,@RequestParam("softwareName") String softwareName, @RequestParam("version") String Version,@RequestParam("create_time") String create_time) {

        try {
        String imageName = registryAddress + "/" + project + "/" + softwareName ;
        new UploadThread(registryAddress, dockerHost, registryUserName, registryPassword,originImageName, imageName,Version, file.getInputStream()).start();
      }   catch (IOException e) {
        System.err.println("获取文件流失败");
       }

        HarborImage harborImage=new HarborImage();
        harborImage.setName(softwareName);

        Project_id_name project_id_name=new Project_id_name();

        Integer value=project_id_name.getMaps().get("kubernetes");
        harborImage.setProject_id(value);
        harborImage.setTags_count(1);
        harborImage.setCreate_time(create_time);
        harborImage.setProject_name(project);
        boolean save_msg=harborService.addImage(harborImage);
        return "redirect:/admin/upload_image.jsp" ;
    }






    /**
     *  查看指定仓库的镜像列表镜像列表
     *  HTTP请求参数：http://192.168.43.156/api/repositories?project_id=2
     *  @Param project_id:2
     */
    @RequestMapping(value = "/ListImageByProjectID",method = GET)
    @ResponseBody
    public void listimage(@RequestParam("project_id") String project_id){

            String url="http://192.168.43.156/api/repositories?project_id="+project_id;
            String result = HttpSend.get(url);

            JSONObject jsonObject=new JSONObject(result);

            System.out.println(result);
    }


    /**
     * 列出所有的镜像
     * @param
     */
    @RequestMapping(value = "/ListImages",method = GET)
    public String listimages(HttpServletRequest request, HttpServletResponse response){
        long start = System.currentTimeMillis();
        int page;
        if(request.getParameter("curPage")==null){
            page=1;
        }else
        {
            page=Integer.parseInt(request.getParameter("curPage"));
        }




        PageInfo<HarborImage> list= harborService.getAllImage(page,6);

        HttpSession session=request.getSession();

        System.out.println(list.getList().size());
        session.setAttribute("imageList",list.getList());
        session.setAttribute("curPage", list.getPageNum());
        session.setAttribute("totalPage", list.getPages());
        session.setAttribute("totalCount",list.getTotal());

        long end = System.currentTimeMillis();
        System.out.println("列出镜像耗时:" + (end - start) + "ms");
        return "redirect:/admin/operate-image.jsp";
    }





    /**
     * 查看指定镜像详情
     * Http请求参数:http://192.168.43.156/api/repositories?project_id=2&q=kubernetes%2Fdjango
     * @Param:project_id
     * @Param:imagename
     */
    @RequestMapping(value = "/ImageDetail" ,method = GET)
    @ResponseBody
    public String imagedetail(@RequestParam("project_id") String project_id,@RequestParam("q") String image_name){


        String q=image_name.replace("/","%2F");
        String url="http://192.168.43.156/api/repositories?project_id="+project_id+"&q="+q;
        String result = HttpSend.get(url);
        return  result;
    }



    @RequestMapping(value = "/deleteImage",method = POST)
    public void deleteImage(HttpServletRequest request,HttpServletResponse response) throws IOException {

        String name=request.getParameter("name");
        String project_name=request.getParameter("project_name");

        System.out.println(name+project_name);


        String message="";

        boolean msg=harborService.deleteImage(name,project_name);
        if(msg==true)
        {
            message="删除成功!";
        }
        else
        {
            message="删除失败,请重试!";
        }
        Gson gson=new Gson();
        String json=gson.toJson(message);


        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().write(json);


    }


    @RequestMapping(value = "/CreateImageDemo",method = GET)
    @ResponseBody
    public String   CreateImageDemo(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name=request.getParameter("name");

        String url="http://192.168.43.156/api/projects";

        Map<String,JSONObject> map=new HashMap<>();

        JSONObject data=new JSONObject();
        data.put("project_name",name);

        String result=HttpSend.postImage(data,url);
        System.out.println(result);
        String[] cmds = {"curl", "-XPOST","http://192.168.43.156/api/projects","-u", "admin:Harbor12345", "-H", "accept: application/json", "-H","Content-Type: application/json","-d", "{ \"project_name\": \"mytest\"}"};

        System.out.println(execCurl(cmds));
        return result;
//        Gson gson=new Gson();
//        String json=gson.toJson("success");
//
//
//        response.setContentType("text/html;charset=UTF-8");
//
//        response.getWriter().write(json);
    }









    public static String execCurl(String[] cmds) {
            ProcessBuilder process = new ProcessBuilder(cmds);
            Process p;
            try {
                p = process.start();
                BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                StringBuilder builder = new StringBuilder();
                String line = null;
                while ((line = reader.readLine()) != null) {
                    builder.append(line);
                    builder.append(System.getProperty("line.separator"));
                }
                return builder.toString();

            } catch (IOException e) {
                System.out.print("error");
                e.printStackTrace();
            }
            return null;

        }



}
