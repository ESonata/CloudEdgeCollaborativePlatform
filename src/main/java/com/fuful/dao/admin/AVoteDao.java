package com.fuful.dao.admin;

import com.fuful.domain.Vote;
import com.fuful.domain.VoteCount;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/18.
 */
@Repository
public interface AVoteDao {
    public List<Vote> findAllVote();
    public List<Vote> findSearchAllVote(@Param("word") String word);
    public int addVote(@Param("vote") Vote vote);
    public int InsertVoteCount(@Param("v")VoteCount voteCount);
    public boolean deleteVoteByVid(@Param("vid") String vid);
    public int updateVote(@Param("v") Vote vote);
}
