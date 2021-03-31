package com.fuful.dao.admin;

import com.fuful.domain.Order;
import com.fuful.domain.OrderProductDetail;
import com.fuful.domain.Round;
import com.fuful.domain.SeatLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/17.
 */
@Repository
public interface  AOrderDao {

    public List<Order> findAllOrder();
    public List<OrderProductDetail> findOrderInfoByOid(@Param("oid") String oid);
    public boolean DeleteOrder(@Param("oid") String oid);
    public List<Order> findAllSearchOrder(@Param("keyword") String name);
    public List<SeatLog> findSeatLogByItemid(@Param("itemid") String itemid);
    public Round findRoundInfoByRid(@Param("rid") int rid);
    public int UpdateOrderSend(@Param("oid") String oid);
    public int AddTransInfo(@Param("oid") String oid,@Param("transport") String t,@Param("transportNum") String num);
    public int UpdateConfirmCancel(@Param("oid") String oid);
    public int UpdateRefuseOrder(@Param("oid") String oid);
}
