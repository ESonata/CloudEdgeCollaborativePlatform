package com.fuful.dao;

import com.fuful.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersDAO {
    public User findByUName(@Param("uname") String uname);
    public int addUser(@Param("User") User user);
    public int getstate(@Param("username") String name);
    public int updateState(@Param("code") String code);
    public User findBybackUser(@Param("username") String username,@Param("nickname") String name,@Param("email") String email);
    public boolean edituser(@Param("username") String username,@Param("password") String password);
}
