package com.fuful.dao.admin;

import com.fuful.domain.BookSuperType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/12/9.
 */

@Repository
public interface AdminCategoryDao {
    public List<BookSuperType> findCategory();
    public BookSuperType findCateGoryByName(@Param("tname") String name);
    public int addCategory(@Param("c") BookSuperType b);
    public BookSuperType findSuperTypeById(@Param("id") int id);
    public int UpdateSuperType(@Param("c") BookSuperType c);
    public boolean DeleteSuperType(@Param("id") int id);
}
