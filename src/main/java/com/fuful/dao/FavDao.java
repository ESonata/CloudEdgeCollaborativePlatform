package com.fuful.dao;

import com.fuful.domain.BookLove;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/16.
 */
@Repository
public interface FavDao {
    public List<BookLove> findMyLoveList(@Param("uid") String uid);
    public BookLove getBookLove(@Param("uid") String uid, @Param("pid") int pid);
    public boolean UpdateFavState(@Param("uid") String uid,@Param("pid") int pid,@Param("state") int state );
    public int addNewFav(@Param("uid") String uid,@Param("pid") int pid);
}

