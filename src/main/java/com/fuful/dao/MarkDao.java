package com.fuful.dao;

import com.fuful.domain.Mark;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by SunRuiBin on 2019/11/16.
 */
@Repository
public interface MarkDao {
    public int addNewMark(@Param("Mark") Mark mark);

}
