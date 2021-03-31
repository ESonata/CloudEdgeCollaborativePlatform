package com.fuful.service.admin;

import com.fuful.dao.admin.AdminUserDao;
import com.fuful.domain.ManageUser;
import com.fuful.domain.Mark;
import com.fuful.domain.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/17.
 */
@Service
public class AdminUserService {
    @Autowired
    AdminUserDao adminUserDao;

    public ManageUser login(String uname,String password){
        ManageUser user=adminUserDao.findUserInfo(uname,password);
        return user;
    }

    public PageInfo<ManageUser> getAdminUserList(int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<ManageUser> manageUserList = adminUserDao.findAllManageUser();
        PageInfo<ManageUser> data = new PageInfo<>(manageUserList);
        return data;
    }

    public ManageUser finManafUserById(String id){
        ManageUser res=adminUserDao.findManagerById(id);
        return res;
    }

    public boolean updateManageUser(ManageUser p){
        int res=adminUserDao.UpdateManager(p);
        if(res>0){
            return true;
        }
        else
        {
            return false;
        }
    }

    public int addManageUser(ManageUser p){
        int res=adminUserDao.AddManager(p);
        return res;
    }

    public boolean deleteManageByVid(String id){
        boolean res=adminUserDao.DeleteManager(id);
        return res;
    }

    public PageInfo<User> getUserList(int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<User> users = adminUserDao.findAllUserList();
        PageInfo<User> data = new PageInfo<>(users);
        return data;
    }


    public boolean deleteUserById(String id){
        boolean res=adminUserDao.DeleteUser(id);
        return res;
    }




}
