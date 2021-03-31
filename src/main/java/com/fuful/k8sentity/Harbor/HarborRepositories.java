package com.fuful.k8sentity;

/**
 * Created by SunRuiBin on 2020/3/13.
 */
public class HarborRepositories {

    String id;
    String name;
    int project_id;
    String description;
    int pull_count;
    int tags_count;
    String creation_time;
    String update_time;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPull_count() {
        return pull_count;
    }

    public void setPull_count(int pull_count) {
        this.pull_count = pull_count;
    }

    public int getTags_count() {
        return tags_count;
    }

    public void setTags_count(int tags_count) {
        this.tags_count = tags_count;
    }

    public String getCreation_time() {
        return creation_time;
    }

    public void setCreation_time(String creation_time) {
        this.creation_time = creation_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
