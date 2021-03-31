package com.fuful.dao.admin;

import com.fuful.domain.Mark;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/17.
 */
@Repository
public interface AMarkDao {
    public List<Mark> findAllMark();
    public boolean DeleteMark(@Param("mid") String mid);
    public List<Mark> findSearchAllMark(@Param("word") String word);
}

