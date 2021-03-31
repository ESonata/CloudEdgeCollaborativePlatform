package com.fuful.controllers.admin;

import com.fuful.domain.ManageUser;
import com.fuful.domain.User;
import com.fuful.service.admin.AdminUserService;
import com.fuful.utils.CommonsUtils;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * Created by SunRuiBin on 2019/11/7.
 */
@Controller
public class AdminUserCtrl {

    //tres
    @Autowired
    private AdminUserService adminUserService;


    @RequestMapping(value = "login.do",method = GET)
    public String test(){
        return "redirect:/index.jsp";
    }


    //管理员登录
    @RequestMapping(value="/admin/login",method=POST)
    public String AdminLogin(@RequestParam("uname") String uname,@RequestParam("password") String password,HttpServletRequest request){
        System.out.println(uname+"aaa"+password);
        HttpSession session=request.getSession();
        ManageUser user = adminUserService.login(uname,password);
//        return "redirect:/admin/index.jsp";
        if(user!=null){
            session.setAttribute("manageuser", user);
            return "redirect:/admin/index.jsp";
        }
        else
        {
            return "redirect:/admin/LoginAdmin.jsp";
        }
    }

    @RequestMapping(value = "/ManageUserLogout",method = GET)
    public String ManageUserLogout(HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        session.removeAttribute("manageuser");
        return "redirect:/admin/LoginAdmin.jsp";

    }


    @RequestMapping(value = "/ManageUserListServlet",method = GET)
    public void ManageUserListServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        int page;
        if(request.getParameter("curPage")==null)
        {
            page=1;
        }
        else
        {
            page=Integer.parseInt(request.getParameter("curPage"));
        }
        PageInfo<ManageUser> manageUserPageInfo=adminUserService.getAdminUserList(page,6);


        HttpSession session = request.getSession();

        session.setAttribute("ManageUserplist", manageUserPageInfo.getList());
        session.setAttribute("curPage", manageUserPageInfo.getPageNum());
        session.setAttribute("totalPage", manageUserPageInfo.getPages());
        session.setAttribute("totalCount",manageUserPageInfo.getTotal());


        response.sendRedirect("/admin/operate-manage.jsp");
    }

    @RequestMapping(value = "/ShowPrivilage",method = POST)
    public void ShowPrivilage(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String id=request.getParameter("ID");
        System.out.println("要显示的管理员权限的ID"+id);


        ManageUser  manageinfo=adminUserService.finManafUserById(id);

        Gson gson=new Gson();
        String json=gson.toJson(manageinfo);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }

    @RequestMapping(value = "/UpdateManageUserServlet",method = POST)
    public String UpdateManageUserServlet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        int category=Integer.parseInt(request.getParameter("category"));
        int book=Integer.parseInt(request.getParameter("book"));
        int mark=Integer.parseInt(request.getParameter("mark"));
        int vote=Integer.parseInt(request.getParameter("vote"));
        int order=Integer.parseInt(request.getParameter("order"));
        int change=Integer.parseInt(request.getParameter("change"));
        String id=request.getParameter("muid");
        System.out.println("要更新的管理员的id是"+id);

        HttpSession session=request.getSession();
        ManageUser p=new ManageUser();


        p.setID(id);
        p.setName(name);
        p.setPassword(password);
        p.setCategory(category);
        p.setBook(book);
        p.setMark(mark);
        p.setVote(vote);
        p.setOrder(order);
        p.setChange(change);



        boolean msg=adminUserService.updateManageUser(p);

        System.out.println("更新管理员的信息"+msg);


        return "redirect:/ManageUserListServlet";
    }

    @RequestMapping(value = "/AddManage",method = POST)
    public String AddManage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        int category=Integer.parseInt(request.getParameter("category"));
        int book=Integer.parseInt(request.getParameter("book"));
        int mark=Integer.parseInt(request.getParameter("mark"));
        int vote=Integer.parseInt(request.getParameter("vote"));
        int order=Integer.parseInt(request.getParameter("order"));
        int change=Integer.parseInt(request.getParameter("change"));

        ManageUser p=new ManageUser();

        p.setID(CommonsUtils.getUUID());
        p.setName(name);
        p.setPassword(password);
        p.setCategory(category);
        p.setBook(book);
        p.setMark(mark);
        p.setVote(vote);
        p.setOrder(order);
        p.setChange(change);

        int msg=adminUserService.addManageUser(p);


        return "redirect:/ManageUserListServlet";

    }

    @RequestMapping(value = "/deleteManageUser",method = POST)
    public void deleteManageUser(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String id=request.getParameter("id");

        System.out.println("删除管理员用户的id："+id);

        HttpSession session=request.getSession();
        ManageUser manageuser=(ManageUser)session.getAttribute("manageuser");


        System.out.println("manageuser.getID()"+manageuser.getID());
//		先判断是不是不是一级管理员
        String message="";
        if(manageuser.getID().equals("1"))
        {
            System.out.println("管理员删除。。。。");
            boolean msg=adminUserService.deleteManageByVid(id);

            if(msg==true)
            {
                message="恭喜您:删除成功!";
            }
            else
            {
                message="恭喜您:删除失败!";
            }
        }
        else
        {
            message="no";
        }



        Gson gson=new Gson();
        String json=gson.toJson(message);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);

    }


    @RequestMapping(value = "/UserListServlet",method = GET)
    public void UserListServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int page;
        if(request.getParameter("curPage")==null)
        {
            page=1;
        }
        else
        {
            page=Integer.parseInt(request.getParameter("curPage"));
        }


        PageInfo<User> pageInfo=adminUserService.getUserList(page,6);



        HttpSession session = request.getSession();

        session.setAttribute("UserList", pageInfo.getList());
        session.setAttribute("curPage",pageInfo.getPageNum());
        session.setAttribute("totalPage", pageInfo.getPages());
        session.setAttribute("totalCount", pageInfo.getTotal());


        response.sendRedirect("/admin/operate-user.jsp");
    }

    @RequestMapping(value = "/deleteUser",method = POST)
    public void deleteUser(HttpServletRequest request,HttpServletResponse response){
        String id=request.getParameter("id");

        System.out.println("删除用户的id："+id);

        HttpSession session=request.getSession();
        ManageUser manageuser=(ManageUser)session.getAttribute("manageuser");

        System.out.println("manageuser.getID()"+manageuser.getID());
//		先判断是不是不是一级管理员
        String message="";
        if(manageuser.getID().equals("1"))
        {
            System.out.println("管理员删除。。。。");
            boolean msg=adminUserService.deleteUserById(id);

            if(msg==true)
            {
                message="恭喜您:删除成功!";
            }
            else
            {
                message="恭喜您:删除失败!";
            }
        }
        else
        {
            message="no";
        }



        Gson gson=new Gson();
        String json=gson.toJson(message);
        response.setContentType("text/html;charset=UTF-8");
        try {
            response.getWriter().write(json);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
