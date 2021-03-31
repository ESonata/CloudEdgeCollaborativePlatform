package com.fuful.service;

import com.fuful.dao.HarborDao;
import com.fuful.domain.BookSuperType;
import com.fuful.k8sentity.Harbor.HarborImage;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by SunRuiBin on 2020/4/4.
 */
@Service
public class HarborService {


    @Autowired
    HarborDao harborDao;

    public boolean addImage(HarborImage harborImage) {
        // TODO Auto-generated method stub

        int p = harborDao.addImage(harborImage);
//        try {
//            PreparedStatement ps = conn.prepareStatement("insert into  tb_love  values(?,?,?) ");
        if(p>0){
            return true;
        }
        else {
            return false;
        }
    }

    public PageInfo<HarborImage> getAllImage(int pageNum, int pageSize){
        PageHelper.startPage(pageNum,pageSize);

        List<HarborImage> harborImages=harborDao.getAll();
        PageInfo<HarborImage> data = new PageInfo<>(harborImages);
        return data;
    }


    public boolean deleteImage(String name,String project_name){
        boolean reg=harborDao.deleteImage(name,project_name);
        return reg;
    }
}
