package com.fuful.dao.admin;

import com.fuful.domain.ManageUser;
import com.fuful.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/17.
 */
@Repository
public interface AdminUserDao {

    public ManageUser findUserInfo(@Param("uname") String name,@Param("password") String password);
    public List<ManageUser> findAllManageUser();
    public ManageUser findManagerById(@Param("id")String id);
    public int UpdateManager(@Param("p") ManageUser p);
    public int AddManager(@Param("p") ManageUser p);
    public boolean DeleteManager(@Param("id") String id);
    public List<User> findAllUserList();
    public boolean DeleteUser(@Param("id") String id);
}
