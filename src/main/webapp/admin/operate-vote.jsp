<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="zh-CN">
<base href="http://localhost:8080/admin/">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>投票管理- 大麦网后台管理系统</title>
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
                    <a class="navbar-brand" href="/">大麦CMS</a> </div>
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
                            <input type="text" class="form-control" autocomplete="off" placeholder="键入商品名称搜索" maxlength="15">
                            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><a href="/"> 搜索</a></button>
              </span> </div>
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
      	  <li><a href="/FindAllordersServlet?curPage=1">订单</a></li>
      </c:if>
      <c:if test="${manageuser.mark==1}">
      	<li><a href="/MarkListServlet?curPage=1">评论</a></li>
      </c:if>
      <c:if test="${manageuser.vote==1}">
      	  <li class="active"><a href="/InitVoteListServlet?curPage=1">投票</a></li>
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

        <!--搜索种类类型选择开始-->


        <!--搜索种类类型选择结束-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <form action="/Article/checkAll" method="post" >
                <h1 class="page-header">操作</h1>
                <ol class="breadcrumb">
                 <c:if test="${manageuser.change==1 }">
                    <li><a  data-toggle="modal" data-target="#addvote">新增投票</a></li>
                  </c:if>
                </ol>
                <h1 class="page-header">管理投票 <span class="badge"  >${totalCount }</span></h1>


		
<!--搜索框开始-->

      <div class="book-search">

		
          <input type="text" placeholder="输入相应关键字查询" name="VoteSearchByKeyword" id="VoteSearchByKeyword" />
            	<div class="book-search-1" onclick="searchvote(1)"  >
              
                 		查询
              	
      			 </div>
            
        
        </div>
        
        <script>
       		 function searchvote(curPage)
      				{
      					
          				/* System.out.println(name+" "+alias+" "+fid+" "+keywords+" "+describe); */
          				/* 输入的搜索关键字 */
          				var votekeyword=$("#VoteSearchByKeyword").val();
          				var curPage=curPage;
          				/* alert("要转向的结果分页页面:"+curPage); */
          				$.post(
          					"/QueryVote",
          					{"votekeyword":votekeyword,"curPage":curPage},
          					function(data)
          					{
          				
          						location.reload();
          				
          					},
          					"json"
          			  );	
      				}
        
        </script>
        
        
        
        
        

<!--搜索框结束-->



                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                          <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th> 
                            
                            <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">投票名称</span></th>
                            <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">开始时间</span></th>
                            <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">结束时间</span></th>
                            <!-- <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg ">结束时间</span></th> -->
                           <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">参与人数</span></th>
                            <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">投票状态</span></th>
                            <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">查看统计</span></th>
                            
                            
                            <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                        </tr>
                        </thead>
                        <tbody>
                <c:forEach items="${splitevotelist}" var="p">
                        <tr>
                            <td><input type="checkbox" class="input-control" name="checkbox[]" value="" /></td> 
                      <%--       <td class="article-title">${p.vid }</td> --%>
                            <td>${p.vname }</td>
                            <td class="hidden-sm">
                            		<input type="datetime-local" value="${p.stime }" readonly class="form-control" name="stime" maxlength="10" autocomplete="off" style=""/>
                            
                            </td>
                            <td class="hidden-sm">
                            			<input type="datetime-local" value="${p.etime }" readonly class="form-control" name="stime" maxlength="10" autocomplete="off" />
                            
                            </td>
                            <td>${p.usercount }</td>
                            <td>
                            
                            <c:if test="${p.state==0 }">未结束</c:if>
                            <c:if test="${p.state==1 }">已结束</c:if>
                           	
                           	</td>
                            <td>


                                <div class="btn-group">
                                  <button type="button" class="btn btn-default">
                                    <a href="/chart?vid=${p.vid}&vname=${p.vname }&curPage=${curPage}">
                                    		查看统计
                                    </a>
                                  </button>
                                    
                                    
                                    
                                </div>
                            </td>
                           
                            <!--data-toggle="modal" data-target="#updateVote"  -->
                            <td>
                             <c:if test="${manageuser.change==1 }">
                            <a title="修改投票项"  onclick="initupdate('${p.vid }','${p.vname }')">修改</a> <a rel="${p.vid }">删除</a>
                            </c:if>
                            </td>

							<script type="text/javascript">
							
									function initupdate(vid,vname)
									{
										
										
										$.post(
											"/InitUpdateServlet",
											{"vid":vid,"vname":vname},
											function(data)
											{
												
												$('#updateVote').modal('hide');
												location.reload();
											},
											"json"
										)
									}
							
							</script>
							
							<!-- 用于为了修改 -->
							<c:if test="${!empty updateflag}">
							
								<script type="text/javascript">
								
									$(function(){
										
										$("#updateVote").modal('show');
									})
									
									
								
								
								
								</script>
							</c:if>
                        </tr>
                        
                 </c:forEach>
                   
                        </tbody>
                    </table>
                </div>
                <footer class="message_footer">
                    <nav>
                        <div class="btn-toolbar operation" role="toolbar">
                            <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a> </div>
                            <div class="btn-group" role="group">
                             <c:if test="${manageuser.change==1 }">
                                <button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
                                </c:if>
                        		<select id="voteState" style="margin-top: 1px;margin-left: 10px;height: 32px" onchange="fn1()">

                                    <option value="1">
                                        按照投票已结束筛选
                                    </option>
                                    <option  value="0">
                                        按照投票未结束筛选
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
                                       var type=$("#voteState").val();
                                       if(type=="2")
                                		{
                                				return;
                                		}
                                       var content = "";
                                       $.post(
                                    		   "/Semester_Demo/VoteState",
                                    		   {"votetype":type},
                                    		   function(data)
                                    		   {
                                    			 
                                    			  
                                    				for(var i=0;i<data.length;i++){
                               						
                               						 content+="<tr style='text-align: center;height: 120px'>"+
                               						"<td>"+
                               							(i+1)+
                               						"</td>"+
                               						"<td><a target='_blank'>"+data[i].vid+"</a></td>"+
                               						"<td>"+data[i].vname+"</td>"+
                               						"<td>"+data[i].usercount+"</td>"+
                               						"<td><input type='datetime-local' disabled  value='"+data[i].stime+"'/>"+"</td>"+
                               						"<td><input type='datetime-local' disabled  value='"+data[i].etime+"'/>"+"</td>"+
                               						"</tr>"; 
                               					
                               					}
                        
                               					
                               					
                               					
                               					
                               					$("#votestatelist").html(content);
                               					$("#showcountvote").html(data.length);
                               					//订单编号
                               					
                               					$('#votestate').modal('show');
                                    		   },
                                    		   "json"
                                       )
                                       

                                    }
                                </script>
              
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        </div>
                       <div class="pagination pagenav">
             
             	<c:if test="${empty votesearchflag }">
          					<c:if test="${curPage!=1}">
          							<a href="/InitVoteListServlet?curPage=${curPage-1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">上一页</a>
          					
          					</c:if>
							<c:if test="${curPage<totalPage }">
									<a href="/InitVoteListServlet?curPage=${curPage+1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">下一页</a>
          					</c:if>
		
									<span style="font-size:15px">当前第${curPage}页</span>/
									<span style="font-size:15px" >共${totalPage}页</span>/
									<span style="font-size:15px">共有${totalCount}条记录</span>
          		</c:if>
          		
          			<c:if test="${!empty votesearchflag }">
          					<c:if test="${curPage!=1}">
          							<a onclick="searchvote(${curPage-1})"  style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">上一页</a>
          				
          					</c:if>
							<c:if test="${curPage<totalPage }">
									<a onclick="searchvote(${curPage+1})" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">下一页</a>
          					</c:if>
		
									<span style="font-size:15px">当前第${curPage}页</span>/
									<span style="font-size:15px" >共${totalPage}页</span>/
									<span style="font-size:15px">共有${totalCount}条记录</span>
          		</c:if>
          		
          		
          			  </div>
        
                    </nav>
                </footer>
            </form>
        </div>
    </div>
</section>

<!-- 判断更新是不是成功 -->
  <c:if test="${!empty updateIsSuccessFlag }">
                
                	<script type="text/javascript">
                	
                			$(function(){
                				
                			})
                	</script>
   </c:if>



<script type="text/javascript">
                            function change()
                            {
                               var len= $("#items").val();
                               console.log(len);
                               var content="";
                               for(var i=1;i<=len;i++)
                               {
                                   content+="<tr><td width='20%'>投票项"+i+"</td><td width='80%'><input class='form-control' name='item"+i+"' maxlength='18' autocomplete='off'/></td>"

                               }
                               

                               $("#showitems").html(content);
                            }



                        </script>





<div class="modal fade" id="votestate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="width: 1200px">
    <div class="modal-dialog" role="document">
       <div class="modal-content" style="width: 900px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <!--<h4 class="modal-title" >订单变哈皮</h4>-->
                <h2 style="color:#3399CC;">投票筛选：<span class="badge" id="showcountvote"></span></h2>
            </div>
            <div class="modal-body">
                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr style="height: 120px">
                        <th>序号</th>
                        <th>投票编号</th>
                        <th>投票名称</th>
                        <th>参与人数</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                    </tr>
                    </thead>
                    <tbody  id="votestatelist">
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
























<!--新增投票魔法框-->
<div class="modal fade" id="addvote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 80px" onsubmit="return confirmAdd()" >
    <div class="modal-dialog" role="document">
        <form action="/AddVoteServlet" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >新增投票</h4>
                </div>
                <div class="modal-body" style="margin-top: 10px">

                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr>
                            <td wdith="20%">投票名称:</td>
                            <td width="80%"><input type="text" value=""  class="form-control" name="votename" maxlength="500" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">开始时间:</td>
                            <td width="80%"><input type="datetime-local" id="addvoteitemstime" value="" class="form-control" name="stime" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">结束时间:</td>
                            <td width="80%"><input type="datetime-local" value=""  id="addvoteitemetime" class="form-control" name="etime" maxlength="13" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">投票项个数:</td>
                            <td width="80%">

                                <select name="items" id="items" onchange="change()" class="form-control"  data-style="btn-info">
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>

                                </select>
                            </td>
                        </tr>
                        </thead>
                        <tbody id="showitems">





                        <tr>
                            <td wdith="20%">投票项1:</td>
                            <td width="80%"><input type="text" class="form-control" name="item1" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">投票项2:</td>
                            <td width="80%"><input type="text" class="form-control" name="item2" maxlength="18" autocomplete="off" /></td>
                        </tr>








                        </tbody>
                        <tfoot>
                        <tr></tr>
                        </tfoot>
                    </table>


                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">增加</button>
                </div>



                  <script type="text/javascript">
              		function confirmAdd()
              		{
              			var stime=$("#addvoteitemstime").val();

              			var etime=$("#addvoteitemetime").val();



              			//2把字符串格式转换为日期类
              			var startTime = new Date(stime);
						var endTime = new Date(etime);

              			//3进行比较
              			if(endTime<startTime)
              			{
              					alert("结束时间不能早于开始时间");
              					return false;
              			}
              			else
              				{
              					return true;
              				}

              		}


              </script>

            </div>
        </form>
    </div>
</div>



<!-- 修改投票项 -->


<script type=></script>


<div class="modal fade" id="updateVote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 80px">
    <div class="modal-dialog" role="document">
        <form action="/UpdateVoteServlet" method="post" onsubmit="return confirmUpdate()">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >修改投票 </h4>
                </div>
                <div class="modal-body" style="margin-top: 10px">
                    
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                         <tr>
                            <td wdith="20%">投票编号:</td>
                            <td width="80%"><input type="text"  readonly value="${voteitemvid }" class="form-control" name="vid" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">投票名称:</td>
                            <td width="80%"><input type="text" value="${voteitemvname }" class="form-control" name="votename" maxlength="500" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">开始时间:</td>
                            <td width="80%"><input type="datetime-local" value="${voteitemstime }" class="form-control" name="stime" maxlength="10" autocomplete="off"  id="voteitemstime"/></td>
                        </tr>
                        <tr>
                            <td wdith="20%">结束时间:</td>
                            <td width="80%"><input type="datetime-local" value="${voteitemetime }" class="form-control" name="etime" maxlength="13" autocomplete="off" id="voteitemetime"/></td>
                        </tr>
                        <tr>
                            <td wdith="20%">投票项个数:</td>
                            <td width="80%">
								<input type="hidden"  name="votelen" id="votelen" value="${voteitemlen }">
							<%-- 	<input type="hidden"  name="votestime" value="${voteitemstime}">
								<input type="hidden"  name="voteetime" value="${voteitemetime}"> --%>
                                <select name="voteitems" id="updateitems" onchange="change2()" class="form-control"  data-style="btn-info" >
                                    <option value="${voteitemlen }">${voteitemlen }</option>
                                    <c:if test="${voteitemlen!=2 }"> 
                                    	  <option value="2">2</option>
                                   	</c:if>
                                   <c:if test="${voteitemlen!=3 }"> 
                                    	  <option value="3">3</option>
                                   	</c:if>
                                    <c:if test="${voteitemlen!=4 }"> 
                                    	  <option value="4">4</option>
                                   	</c:if>
                                    <c:if test="${voteitemlen!=5 }"> 
                                    	  <option value="5">5</option>
                                   	</c:if>
                                   <c:if test="${voteitemlen!=6 }"> 
                                    	  <option value="6">6</option>
                                   	</c:if>
                                    <c:if test="${voteitemlen!=7 }"> 
                                    	  <option value="7">7</option>
                                   	</c:if>
                                    <c:if test="${voteitemlen!=8 }"> 
                                    	  <option value="8">8</option>
                                   	</c:if>
                                    

                                </select>
                            </td>
                        </tr>
                      	  <tr>
                          	  <td wdith="20%">设置结束:</td>
                          	  	
                            	<td width="80%">
                            		 <select name="state"   class="form-control"  data-style="btn-info" >
                          	   					<option value="${voteitemestate }" selected>
                          	   						<c:if test="${voteitemestate==0 }">
                          	   									未结束
                          	   						
                          	   						</c:if>
                          	   						<c:if test="${voteitemestate==1 }">
                          	   									已结束
                          	   						
                        							</c:if>
                          	   					 </option>
                          	   					 
                          	   					<c:if test="${voteitemestate==0 }">
                          	   									<option value="1">已结束</option>
                          	   						
                        						</c:if>
                        						<c:if test="${voteitemestate==1 }">
                          	   									<option value="0">未结束</option>
                          	   						
                        						</c:if>
                          	  		 </select>
                            	
                            	
                            	</td>
                       		 </tr>
                        </thead>
                        <tbody id="updateitemsdiv">

						 	<c:forEach items="${voteitemdetail}" var="item"  varStatus="status" >
                        			<tr>
                          	  			<td wdith="20%">投票项${status.count }:</td>
                           	  			<td width="80%"><input type="text" class="form-control" value="${item }" name="item${status.count }" maxlength="18" autocomplete="off" /></td>
                        			</tr>
                      		 </c:forEach>
                       </tbody>
                       
				<script type="text/javascript">
                            function change2()
                            {
                               var len= $("#updateitems").val();
                               $("#updateitemsdiv").html($("#updateitems").val());
                               $("#updateitemsdiv").html("");
                               console.log(len);
                               var content="";
                               
                               for(var i=1;i<=len;i++)
                               {
                                   content+="<tr><td width='20%'>投票项"+i+"</td><td width='80%'><input type='text' class='form-control' name='item"+i+"' maxlength='18' autocomplete='off'/></td>"

                               }
                               $("#votelen").val(len);

                               $("#updateitemsdiv").html(content);
                            }



                </script> 
                        
                        <tfoot>
                        <tr></tr>
                        </tfoot>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button  class="btn btn-primary">
                    		
                   			修改
                   			
                   	</button>
                </div>
              
           <script type="text/javascript">
              		function confirmUpdate()
              		{
              			var stime=$("#voteitemstime").val();
              			
              			var etime=$("#voteitemetime").val();
              			
              			
              			
              			//2把字符串格式转换为日期类
              			var startTime = new Date(stime);
						var endTime = new Date(etime);
              		
              			//3进行比较
              			if(endTime<startTime)
              			{
              					alert("结束时间不能早于开始时间");
              					return false;
              			}
              			else
              				{
              					return true;
              				}
              			
              		}
              
              
              </script> 
              
                
            </div>
        </form>
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
                        url: "/DeleVoteServlet",
                        data: "vid=" + id,
                        cache: false, //不缓存此页面
                        success: function (data) {
                        	alert(data);
                        	window.location.href="/InitVoteListServlet?curPage=1";
                        }
                    });
                };
            };
        });
    });
</script>
</body>
</html>
