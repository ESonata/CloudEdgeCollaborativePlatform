package com.fuful.k8sentity.Harbor;

/**
 * Created by SunRuiBin on 2020/4/4.
 */
public class HarborImage {
    String name;
    String project_name;
    int project_id;
    int tags_count;
    String create_time;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public int getTags_count() {
        return tags_count;
    }

    public void setTags_count(int tags_count) {
        this.tags_count = tags_count;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
}
