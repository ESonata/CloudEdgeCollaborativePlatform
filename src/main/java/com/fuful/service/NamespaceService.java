package com.fuful.service;

import com.fuful.k8sentity.Harbor.HarborImage;
import com.fuful.k8sentity.NameSpace.ListNamespace;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by SunRuiBin on 2020/4/8.
 */
@Service
public class NamespaceService {



    public PageInfo<ListNamespace> getAll(int pageNum, int pageSize,String result){
        PageHelper.startPage(pageNum,pageSize);

        JSONObject namespaceList=new JSONObject(result);
        JSONArray namespace_items=namespaceList.getJSONArray("items");
        System.out.println(namespace_items.length());
        List<ListNamespace>  namespaces=new ArrayList<>();
        for(int i=0;i<namespace_items.length();i++){

            ListNamespace namespace=new ListNamespace();
            JSONObject o=namespace_items.getJSONObject(i);

            JSONObject metadata_item=o.getJSONObject("metadata");
            JSONObject status=o.getJSONObject("status");

            String phase=status.getString("phase");
            System.out.println(metadata_item);
            String name=metadata_item.getString("name");
            String time=metadata_item.getString("creationTimestamp");
            namespace.setName(name);
            namespace.setTime(time);
            namespace.setPhase(phase);
            namespaces.add(namespace);
        }


        PageInfo<ListNamespace> data = new PageInfo<>(namespaces);
        return data;
    }

}
