package com.fuful.k8sentity.Harbor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SunRuiBin on 2020/4/4.
 */
public class Project_id_name {


    public  Map<String,Integer> maps;


    public Map<String, Integer> getMaps() {
        return maps;
    }

    public void setMaps(Map<String, Integer> maps) {
        this.maps = maps;
    }

    public  Project_id_name(){
        Map<String,Integer> map=new HashMap<>();
        map.put("kubernetes",2);
        this.maps=map;

    }
}
