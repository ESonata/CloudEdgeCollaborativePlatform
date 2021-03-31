package com.fuful.dao.admin;

import com.fuful.domain.*;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.TIMEOUT;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/17.
 */
@Repository
public interface ATicketDao {
    public List<Ticket> findAllTicket();
    public List<Ticket> findSearchAllTicket(@Param("keyword") String keyword);
    public List<Ticket> findSearchAllTicketByBID(@Param("keyword") String keyword);
    public int UpdateTicketInfo(@Param("Ticket") Ticket p);
    public int AddTicketPrice(@Param("tid") String tid,@Param("price") Double price);
    public int AddPlaceTime(@Param("city") String cityid,@Param("round") String  round,@Param("tid") String tid,@Param("amount") int amount,@Param("row") int row,@Param("col")int col);
    public int AddTicketPlace(@Param("tid") String tid,@Param("city") String place,@Param("location") String location,@Param("town") String town);
    public boolean DeleteTicketInfo(@Param("id") int  id);
    public boolean DeleteTicketPrice(@Param("tid") int  id,@Param("price") Double price);
    public boolean DeleteTicketPlace(@Param("tid") String  id,@Param("place") String place);
    public int addTicketDao(@Param("Ticket") Ticket ticket);
    public Ticket getTicketInfoById(@Param("id") int id);
    public List<Price> findAllPriceByTid(@Param("tid") String id);
    public List<City> findAllPlaceByTid(@Param("tid") String id);
    public List<Round> findAllRoundByTid(@Param("tid") String id);
    public boolean DeleteRound(@Param("id") int id);
}
