package com.fuful.dao;

import com.fuful.k8sentity.Harbor.HarborImage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2020/4/4.
 */

@Repository
public interface HarborDao {

    public int addImage(@Param("HarborImage") HarborImage harborImage);
    public List<HarborImage> getAll();
    public boolean deleteImage(@Param("name") String name,@Param("project_name") String project_name);
}
