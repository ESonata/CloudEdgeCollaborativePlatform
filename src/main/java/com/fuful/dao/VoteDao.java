package com.fuful.dao;

import com.fuful.domain.Vote;
import com.fuful.domain.VoteCount;
import com.fuful.domain.VoteUserlog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/16.
 */
@Repository
public interface VoteDao {

    public List<Vote> findVoteList();
    public Vote findVoteByVid(@Param("vid") String vid);
    public VoteUserlog findUserVoteLog(@Param("username") String uname,@Param("vid") String vid);
    public VoteCount findVoteCount(@Param("vid") String vid);
    public boolean updateVoteCount1(@Param("newcount") int newcount,@Param("vid") String vid,@Param("item") String item);
    public boolean updateVoteCount2(@Param("newcount") int newcount,@Param("vid") String vid,@Param("item") String item);
    public boolean updateVoteCount3(@Param("newcount") int newcount,@Param("vid") String vid,@Param("item") String item);
    public boolean updateVoteCount4(@Param("newcount") int newcount,@Param("vid") String vid,@Param("item") String item);
    public boolean updateVoteCount5(@Param("newcount") int newcount,@Param("vid") String vid,@Param("item") String item);
    public boolean updateVoteCount6(@Param("newcount") int newcount,@Param("vid") String vid,@Param("item") String item);
    public boolean updateVoteCount7(@Param("newcount") int newcount,@Param("vid") String vid,@Param("item") String item);
    public int UpdateVoteUserCount(@Param("newcount") int newcount,@Param("vid") String vid);
    public int AddUserHasVote(@Param("username") String username,@Param("vid") String vid);
}
