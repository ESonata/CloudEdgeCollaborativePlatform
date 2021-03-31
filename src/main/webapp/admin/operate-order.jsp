<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>订单管理- 大麦网后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<script src="js/jquery-2.1.4.min.js"></script>
<!--[if gte IE 9]>
  <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="js/html5shiv.min.js" type="text/javascript"></script>
  <script src="js/respond.min.js" type="text/javascript"></script>
  <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
<style type="text/css">
		body{
			 font-family:"Hanzipen SC";
		}

</style>
</head>

<script>




</script>
<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/admin/LoginAdmin.jsp">大麦CMS</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">

            <li class="dropdown"> <c:if test="${not empty manageuser }">
            
            
           			 <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
           				 ${manageuser.name }
            			 <span class="caret">
            			 </span>
            		</a>
          		  			</c:if>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
              </ul>
            </li>
            <li><a href="/ManageUserLogout" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
          </ul>
          <form action="" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <%--<input type="text" class="form-control" autocomplete="off" placeholder="键入商品名称搜索" maxlength="15">--%>
              <%--<span class="input-group-btn">--%>
                <%--<button class="btn btn-default" type="submit"><a href="/"> 搜索</a></button>--%>
              <%--</span> --%>
            </div>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li><a href="index.jsp">报告</a></li>
      </ul>
       <ul class="nav nav-sidebar">
          <c:if test="${manageuser.book==1}">
      	 <li><a href="/AdminGetInitBookInfoServlet?curPage=1">票务</a></li>
      </c:if>
       <c:if test="${manageuser.order==1}">
      	  <li class="active"><a href="/FindAllordersServlet?curPage=1">订单</a></li>
      </c:if>
      <c:if test="${manageuser.mark==1}">
      	<li><a href="/MarkListServlet?curPage=1">评论</a></li>
      </c:if>
      <c:if test="${manageuser.vote==1}">
      	  <li><a href="/InitVoteListServlet?curPage=1">投票</a></li>
      </c:if>
      </ul>
      <ul class="nav nav-sidebar">
       <c:if test="${manageuser.mark==1}">
      	 <li><a href="/getCategoryType.do?curPage=1">栏目</a></li>
      </c:if>
        <%--<li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>--%>
          <%--<ul class="dropdown-menu" aria-labelledby="otherMenu">--%>
            <%--<li><a href="flink.html">友情链接</a></li>--%>
            <%--<li><a href="loginlog.html">访问记录</a></li>--%>
          <%--</ul>--%>
        <%--</li>--%>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
          <ul class="dropdown-menu" aria-labelledby="userMenu">
            <li><a href="/ManageUserListServlet?curPage=1">管理管理员</a></li>
            <li><a href="/UserListServlet?curPage=1">管理用户</a></li>
            <li role="separator" class="divider"></li>
            <%--<li><a href="loginlog.html">管理登录日志</a></li>--%>
          </ul>
        </li>
        <%--<li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>--%>
          <%--<ul class="dropdown-menu" aria-labelledby="settingMenu">--%>
            <%--<li><a href="setting.html">基本设置</a></li>--%>
            <%--<li><a href="readset.html">用户设置</a></li>--%>
            <%--<li role="separator" class="divider"></li>--%>
            <%--<li><a href="#">安全配置</a></li>--%>
            <%--<li role="separator" class="divider"></li>--%>
            <%--<li class="disabled"><a>扩展菜单</a></li>--%>
          <%--</ul>--%>
        <%--</li>--%>
      </ul>
    </aside>
<script>
  document.getElementsByName()
</script>
    <!--搜索种类类型选择开始-->


    <!--搜索种类类型选择结束-->
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">

        <ol class="page-header">
          &nbsp;


        </ol>

        <h1 class="page-header">管理订单 <span class="badge" >${totalCount }</span></h1>

<!--搜索框开始-->
        <div class="book-search" style="margin-top: -50px" >


          <input type="text" maxlength="50"  style="width: 200px"  autocomplete="off" placeholder="根据收货人和订单号查询订单" name="OrderSearchByKeyword" id="OrderSearchByKeyword">

            <button  style="margin-left: -20px" class="book-search-1" onclick="searchorder(1)">

                  查询

            </button>
        </div>

<!--搜索框结束-->
 	<script>
       		 function searchorder(curPage)
      				{
      					
          				/* System.out.println(name+" "+alias+" "+fid+" "+keywords+" "+describe); */
          				/* 输入的搜索关键字 */
          				var orderkeyword=$("#OrderSearchByKeyword").val();
          				var curPage=curPage;
          				/* alert("要转向的结果分页页面:"+curPage); */
          				$.post(
          					"/QueryOrder",
          					{"orderkeyword":orderkeyword,"curPage":curPage},
          					function(data)
          					{
          				
          						location.reload();
          				
          					},
          					"json"
          			  );	
      				}
        
        </script>
        
        
        
        
        
        
        
        

        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">序号</span></th>
                <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">订单编号</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">订单金额</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">收货人</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">付款状态</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">订单详情</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">发货状态</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">订单状态</span></th>


                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${spliteOrderInfoplist }" var="order" varStatus="vs">
              <tr>
                <td><input type="checkbox" class="input-control" name="checkbox[]" value="" /></td>
                <td class="article-title">${vs.count }</td>
                <td>${order.oid }</td>
                <td class="hidden-sm">${order.total }</td>
                <td class="hidden-sm">${order.name }</td>
                <td>
                    ${order.state==0?"等待买家付款":"买家已付款" }
                </td>
               <td>
                 <div class="btn-group">
                   <button type="button" class="btn btn-default" onclick="findOrderInfoByOid('${order.oid}')">
                     
                     <!-- data-toggle="modal" data-target="#seeorder" -->
                       查看详情

                   </button>
                 </div>
                 
               </td>
                  <td style="text-align: center">

                      <c:if test="${order.confirmCancel==1}">
                          订单关闭
                      </c:if>



                      <c:if test="${order.confirmCancel==0}">

                          <c:if test="${order.state==0}">
                              未付款不可操作
                          </c:if>

                          <c:if test="${order.state==1}">


                              <c:if test="${order.send==0}">
                                  <button type="submit" class="btn btn-default" style="display: inline">

                                      <a onclick="send('${order.oid}')">点击发货</a>

                                  </button>

                                  <script type="text/javascript">
                                      function send(oid) {
                                          $("#orderID").val(oid);
                                          $("#sendProduct").modal("show");

                                      }
                                  </script>
                              </c:if>

                              <c:if test="${order.send==1}">
                                  <p style="text-align: center">
                                      已经发货
                                  </p>

                                  <p style="text-align: center">
                                      <button class="btn btn-default" onclick="showTransport('${order.oid}')">
                                          查看物流
                                      </button>
                                  </p>

                                  <script type="text/javascript">
                                      function showTransport(oid) {
                                          $("#order_id").val(oid);

                                          $.post(
                                              "/showTransport",
                                              {"oid":oid},
                                              function(data)
                                              {
                                                  console.log(data);
                                                  $("#transportName").val(data.transport);
                                                  $("#transportNum").val(data.transportNum);
                                                  $("#showTrans").modal("show");

                                              },
                                              "json"
                                          )

                                      }
                                  </script>
                              </c:if>
                          </c:if>

                      </c:if>





                  </td>

                  <td style="text-align: center">

                      <%--取消订单了--%>
                      <c:if test="${order.confirmCancel==1}">

                          订单已关闭
                      </c:if>

                      <%--未取消订单--%>
                      <c:if test="${order.confirmCancel==0}">

                          <%-- 收货了--%>
                          <c:if test="${order.confirmOrder==1}">
                              <p>
                                  用户已确认收货
                              </p>
                          </c:if>

                          <%--未收货--%>
                          <c:if test="${order.confirmOrder==0}">
                              <c:if test="${order.cancel==0}">
                                  <button class="btn btn-default" type="button"> 待用户更新操作</button>

                              </c:if>

                              <c:if test="${order.cancel==1}">
                                  <c:if test="${order.refuse==0}">
                                      <button type="submit" class="btn btn-default" style="display: inline">
                                              <%--<li><a  data-toggle="modal" data-target="#dealCancel">处理用户请求</a></li>--%>
                                          <a onclick="cancelOrder('${order.oid}')">用户请求退单</a>
                                      </button>
                                  </c:if>

                                  <c:if test="${order.refuse==1}">
                                      <p >
                                          已拒绝退单
                                      </p>
                                  </c:if>

                              </c:if>

                          </c:if>


                          <%--<c:if test="${order.cancel==3}">--%>
                              <%--<button class="btn btn-default" type="button">--%>
                                  <%--<p style="text-align: center">--%>
                                      <%--用户确认收货完成--%>
                                  <%--</p>--%>
                                  <%--<p style="text-align: center">--%>
                                      <%--<button class="btn btn-default">--%>
                                          <%--查看详情--%>
                                      <%--</button>--%>
                                  <%--</p>--%>

                              <%--</button>--%>
                          <%--</c:if>--%>
                      </c:if>

                          <script type="text/javascript">
                              function cancelOrder(oid) {
                                  var res=confirm("确认取消订单嘛?");
                                  if(res==true){

                                      $.post(
                                          "/CancelOrder",
                                          {"oid":oid},
                                          function(data)
                                          {

                                              window.location.href="/FindAllordersServlet?curPage="+${curPage};

                                          },
                                          "json"
                                      );
                                  }
                                  else{
                                      $.post(
                                          "/RefuseCancel",
                                          {"oid":oid},
                                          function(data)
                                          {

                                              window.location.href="/FindAllordersServlet?curPage="+${curPage};

                                          },
                                          "json"
                                      );
                                  }
                              }
                          </script>

                  </td>



                <td style="text-align: center">
                 <c:if test="${manageuser.change==1 }">
                     <a rel="${order.oid }">删除</a>
                </c:if>
                </td>


              </tr>
              </c:forEach>
           
           
           
           <script type="text/javascript">

               function dealcancel() {

               }

       		function findOrderInfoByOid(oid){
					
					//ajax异步访问数据
					$("#showorderinfo").html("");
					$('#seeorder').modal('hide');
					$("#shodDivOid").html("");
					$.post(
                    "/FindOrderInfoByOidServlet",
                    {"oid":oid},
                    function(data){

                        var content = "";
                        for(var i=0;i<data.length;i++){
                            content+="<tr style='text-align: center;height: 120px'>"+
                                "<td>"+
                                "<img src='"+data[i].picture+"' width='100' height='80'>"+
                                "</td>"+
                                "<td><a target='_blank'>"+data[i].bookName+"</a></td>"+
                                "<td>￥"+data[i].price+"</td>"+
                                "<td>"+data[i].count+"</td>"+
                                "<td>"+data[i].round+"</td>"+
                                "<td>"+data[i].location+"</td>"+
                                "<td><span class='subtotal'>￥"+data[i].subtotal+"</span></td>"+
                                "</tr>";


                            for(var j=0;j<data[i].seatLogList.length;j++){
//						    console.log(data[i].seatLogList[j].row+" "+data[i].seatLogList[j].col)
                                content+="<tr style='text-align: center;height: 50px'>"+
                                    "<td>"+
                                    "选择的座位号"+
                                    "</td>"+
                                    "<td>row:</td>"+
                                    "<td></td>"+
                                    "<td>"+data[i].seatLogList[j].row+"排</td>"+
                                    "<td>col:</td>"+
                                    "<td></td>"+
                                    "<td>"+data[i].seatLogList[j].col+"座</td>"+
                                    "</tr>";
                            }

                        }

                        $("#showorderinfo").html(content);

                        //订单编号
                        $("#shodDivOid").html(oid);
                        $('#seeorder').modal('show');

                    },
                    "json"
                );
		}
           
           
           </script>



            </tbody>
          </table>
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a> </div>
              <div class="btn-group" role="group">
               <c:if test="${manageuser.change==1 }">
                <button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbo
                x_delete">删除</button>
             	 </c:if>
             	  <select id="paytype" style="margin-top: 1px;margin-left: 10px;height: 32px" onchange="fn1()">

                                    <option value="1">
                                        按照已付款筛选
                                    </option>
                                    <option  value="0">
                                        按照未付款筛选
                                    </option>
                                    <option value="2" selected>
                                    	无
                                    </option>

                  </select>
                                
                                
              </div>
              
              
                                <script type="text/javascript">

                                    function fn1() {
                                       /*  $("#paystate").modal('show'); */
                                       /*  获取select的值 */
                                       var type=$("#paytype").val();
                                     	if(type=="2")
                                     		{
                                     				return;
                                     		}
                                       
                                       var content = "";
                                       $.post(
                                    		   "/Semester_Demo/OrderPayState",
                                    		   {"paytype":type},
                                    		   function(data)
                                    		   {
                                    			 
                                    			 
                               						for(var i=0;i<data.length;i++){
                               						
                               						 content+="<tr style='text-align: center;height: 120px'>"+
                               						"<td>"+
                               							(i+1)+
                               						"</td>"+
                               						"<td><a target='_blank'>"+data[i].oid+"</a></td>"+
                               						"<td>￥"+data[i].total+"</td>"+
                               						"<td>"+data[i].name+"</td>"+
                               						"<td><span class='subtotal'>"+data[i].telephone+"</span></td>"+
                               						"<td><input type='text' disabled  value='"+data[i].ordertime+"'/>"+"</td>"+
                               						"</tr>"; 
                               					
                               					}
                        
                               					
                               					
                               					
                               					
                               					$("#paystatelist").html(content);
                               					$("#showcountoid").html(data.length);
                               					//订单编号
                               					
                               					$('#paystate').modal('show');
                                    		   },
                                    		   "json"
                                       )
                                       

                                    }
                                </script>
              
              
              
              
              
            </div>
            <div class="pagination pagenav">
            	<c:if test="${empty ordersearchflag }">
          					<c:if test="${curPage!=1}">
          							<a href="/FindAllordersServlet?curPage=${curPage-1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">上一页</a>
          					
          					</c:if>
							<c:if test="${curPage<totalPage }">
									<a href="/FindAllordersServlet?curPage=${curPage+1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">下一页</a>
          					</c:if>
		
									<span style="font-size:15px">当前第${curPage}页</span>/
									<span style="font-size:15px" >共${totalPage}页</span>/
									<span style="font-size:15px">共有${totalCount}条记录</span>
          		</c:if>
          		
          			<c:if test="${!empty ordersearchflag }">
          					<c:if test="${curPage!=1}">
          							<a onclick="searchorder(${curPage-1})"  style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">上一页</a>
          					
          					</c:if>
							<c:if test="${curPage<totalPage }">
									<a onclick="searchorder(${curPage+1})" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">下一页</a>
          					</c:if>
		
									<span style="font-size:15px">当前第${curPage}页</span>/
									<span style="font-size:15px" >共${totalPage}页</span>/
									<span style="font-size:15px">共有${totalCount}条记录</span>
          		</c:if>
            </div>
          </nav>
        </footer>
    </div>
  </div>
</section>








<div class="modal fade" id="paystate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="width: 1200px">
    <div class="modal-dialog" role="document">
       <div class="modal-content" style="width: 900px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <!--<h4 class="modal-title" >订单变哈皮</h4>-->
                <h2 style="color:#3399CC;">订单筛选：<span class="badge" id="showcountoid" >7</span></h2>
            </div>
            <div class="modal-body">
                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr style="height: 120px">
                        <th>序号</th>
                        <th>订单编号</th>
                        <th>金额</th>
                        <th>收货人</th>
                        <th>联系电话</th>
                        <th>下单时间</th>
                    </tr>
                    </thead>
                    <tbody  id="paystatelist">
                    <tr style="height: 120px">
                        <td>

                            <img src="images/1.png" style="width: 100px;height: 80px">
                        </td>
                        <td>2016-01-08 15:50:28</td>
                        <td>成功</td>
                        <td>成功</td>
                        <td>成功</td>
                    </tr>
                    <tr style="height: 120px">
                        <td> <img src="images/1.png" style="width: 100px;height: 80px"></td>
                        <td>2016-01-08 10:27:44</td>
                        <td>成功</td>
                        <td>成功</td>
                        <td>成功</td>
                    </tr>
                    <tr style="height: 120px">
                        <td> <img src="images/1.png" style="width: 100px;height: 80px"></td>
                        <td>2016-01-08 10:19:25</td>
                        <td>成功</td>
                        <td>成功</td>
                        <td>成功</td>
                    </tr>
                    <tr style="height: 120px">
                        <td><img src="images/1.png" style="width: 100px;height: 80px"></td>
                        <td>2016-01-06 10:35:12</td>
                        <td>成功</td>
                        <td>成功</td>
                        <td>成功</td>
                    </tr>
                    <tr style="height: 120px">
                        <td><img src="images/1.png" style="width: 100px;height: 80px"></td>
                        <td>2016-01-06 10:35:12</td>
                        <td>成功</td>
                        <td>成功</td>
                        <td>成功</td>
                    </tr>
                    <tr style="height: 120px">
                        <td><img src="images/1.png" style="width: 100px;height: 80px"></td>
                        <td>2016-01-06 10:35:12</td>
                        <td>成功</td>
                        <td>成功</td>
                        <td>成功</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>





<!--查看订单项  -->

<div class="modal fade" id="seeorder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <!--<h4 class="modal-title" >订单变哈皮</h4>-->
        <h2 style="color:#3399CC;">订单编号：<span id="shodDivOid" style="font-size: 13px;color: #999">123456789</span></h2>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
          <tr style="height: 120px">
            <th>图片</th>
            <th>商品</th>
            <th>价格</th>
            <th>数量</th>
              <th>场馆</th>
              <th>场次</th>
            <th>小记</th>
          </tr>
          </thead>
          <tbody  id="showorderinfo">


          </tbody>

        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>





<%--点击发货--%>
<div class="modal fade" id="sendProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 80px"  >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >发送货物</h4>
            </div>
            <div class="modal-body" style="margin-top: 10px">

                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr>
                        <td wdith="20%">订单编号:</td>
                        <td width="80%">
                            <input type="text" value="" readonly  id="orderID" class="form-control" name="orderID" maxlength="10" autocomplete="off" />
                        </td>
                    </tr>


                    </thead>
                    <tbody >

                    <tr>
                        <td wdith="20%">选择物流</td>

                        <td width="80%">
                            <select id="transport" class="form-control" name="transport" >

                              <option value="顺丰快递">顺丰快运</option>
                              <option value="圆通速递">圆通速递</option>
                              <option value="圆通速递">韵达快递</option>
                            </select>
                        </td>
                    </tr>
                    <tr>

                        <td wdith="20%">物流单号:</td>
                        <td width="80%">
                            <input class="form-control"  name="transportNumber" type="text" placeholder="输入物流单号" id="transportNumber"/>
                        </td>
                    </tr>



                    </tbody>
                    <tfoot>
                    <tr></tr>
                    </tfoot>
                </table>



            </div>
            <div class="modal-footer">
                <button  onclick="sendTransport()" type="button" class="btn btn-default">发货</button>
            </div>



            <script type="text/javascript">

                function sendTransport() {
                    var oid=$("#orderID").val();
                    var transport=$("#transport").val();
                    var transportNumber=$("#transportNumber").val();

                    $.ajax({
                        type: "POST",
                        url: "/sendProduct",
                        data: {"oid":oid,"transport":transport,"transportNumber":transportNumber},
                        cache: false, //不缓存此页面
                        success: function (data) {

                            window.location.href="/FindAllordersServlet?curPage="+${curPage};


                        }
                    });
                }

            </script>

        </div>

    </div>
</div>








<%--查看物流--%>
<div class="modal fade" id="showTrans" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 80px"  >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >查看物流信息</h4>
            </div>
            <div class="modal-body" style="margin-top: 10px">

                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr>
                        <td wdith="20%">订单编号:</td>
                        <td width="80%">
                            <input type="text" value="" readonly  id="order_id" class="form-control" name="votename" maxlength="10" autocomplete="off" />
                        </td>
                    </tr>


                    </thead>
                    <tbody >

                    <tr>
                        <td wdith="20%">物流名称:</td>
                        <td width="80%"><input type="text" value="${transport.transport}" readonly id="transportName"  class="form-control" name="transport" maxlength="10" autocomplete="off" /></td>
                    </tr>
                    <tr>
                        <td width="20%">物流单号:</td>
                        <td width="80%"><input type="text"  readonly value="${transport.transportNum}" id="transportNum"  class="form-control" name="transportNum" maxlength="10" autocomplete="off" /></td>

                    </tr>

                    </tbody>
                    <tfoot>
                    <tr></tr>
                    </tfoot>
                </table>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>



        </div>

    </div>
</div>










<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
            <tr>
              <th>登录IP</th>
              <th>登录时间</th>
              <th>状态</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>::1:55570</td>
              <td>2016-01-08 15:50:28</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64377</td>
              <td>2016-01-08 10:27:44</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64027</td>
              <td>2016-01-08 10:19:25</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩博客</li>
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="js/bootstrap.min.js"></script>
<script src="js/admin-scripts.js"></script>
<script>
//是否确认删除
$(function(){
	$("#main table tbody tr td a").click(function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id
		if (event.srcElement.outerText == "删除")
		{
			if(window.confirm("此操作不可逆，是否确认？"))
			{
				$.ajax({
					type: "POST",
					url: "/DeleteOrderInfoServlet",
					data: "oid=" + id,
					cache: false, //不缓存此页面
					success: function (data) {
						alert(data);
						window.location.href="/FindAllordersServlet?curPage="+1;
					}
				});
			};
		};
	});
});
</script>
</body>
</html>
