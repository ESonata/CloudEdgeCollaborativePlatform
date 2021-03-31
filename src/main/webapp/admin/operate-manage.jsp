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
    <title>管理管理员 - 大麦网后台管理系统</title>
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

                        <li class="dropdown"> 
                         <c:if test="${not empty manageuser }">
            
            
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
                            <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
                            <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
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
                <li class="active"><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
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
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <h1 class="page-header">操作</h1>
            <ol class="breadcrumb">
             <c:if test="${manageuser.change==1 }">
                <li><a data-toggle="modal" data-target="#addUser">增加管理员</a></li>
              </c:if>
            </ol>
            <h1 class="page-header">管理 <span class="badge">${totalCount }</span></h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">ID</span></th>
                        <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户名</span></th>


                        <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg"> 查看权限</span></th>
                        <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${ManageUserplist}" var="p">
                    <tr>
                        <td>${p.ID }</td>

                        <td>${p.name }</td>
                        <td><button onclick="fn1('${p.ID}')" class="btn btn-default">查看权限</button></td>
                        <td>
                         <c:if test="${manageuser.change==1 }">
                        	<a rel="${p.ID }" name="see" onclick="fn2('${p.ID}')">修改</a> <a rel="${p.ID }" name="delete">删除</a>
                        </c:if> 
                        	<!-- <a href="/User/checked/id/1/action/n">禁用</a> -->
                        	
                        	</td>
                    </tr>
                    </c:forEach>
                 	
                    </tbody>
                </table>
             <!-- 使用ajax处理权限 -->   
                <script type="text/javascript">
                
                			function fn1(obj)
                			{
                				$.post(
                					"/ShowPrivilage",
             						{"ID":obj},
  									function(data){
             					
             							
             						  	$('#mname').val(data.name);
             	                        $('#mpassword').val(data.password);
             	           				if(data.category=="1")
             	           					{
             	           				  	 $('#mcategory').val("有");
             	           					}
             	           				else
             	           					{
             	           					 $('#mcategory').val("无");
             	           					}
             	           				if(data.book=="1")
     	           							{
     	           				 			  $('#mbook').val("有");
     	           							}
     	           						else
     	           							{
     	           							 $('#mbook').val("无");
     	           							}
             	                       
             	                       	if(data.mark=="1")
             	                       		{
             	                       			$('#mmark').val("有");
             	                       		}
             	                       	else
             	                       		
             	                 			{
             	                     	  	$('#mmark').val("无");
             	                       		}
             	                   	if(data.vote=="1")
     	                       		{
     	                       			$('#mvote').val("有");
     	                       		}
     	                       	else
     	                       		
     	                 			{
     	                     	  	$('#mvote').val("无");
     	                       		}
             	               	if(data.order=="1")
 	                       			{
 	                       				$('#morder').val("有");
 	                       		}
 	                       	else
 	                       		
 	                 			{
 	                     	  	$('#morder').val("无");
 	                       		}
             	           	if(data.change=="1")
	                       		{
	                       			$('#mchange').val("有");
	                       		}
	                       	else
	                       		
	                 			{
	                     	  	$('#mchange').val("无");
	                       		}
             	                        
             	                    
             	                       
             	                        $('#seeManage').modal('show');
             						
             						
             						},
             						"json"
                				)
                			}
                			
                			
                			
                			
                			function fn2(obj)
                			{
                				$.post(
                					"/ShowPrivilage",
             						{"ID":obj},
  									function(data){
             					
             							
             						  	$('#muname').val(data.name);
             	                        $('#mupassword').val(data.password);
             	           				if(data.category=="1")
             	           					{
             	           				  	 $('#mucategory').val("有");
             	           					}
             	           				else
             	           					{
             	           					 $('#mucategory').val("无");
             	           					}
             	           				if(data.book=="1")
     	           							{
     	           				 			  $('#mubook').val("有");
     	           							}
     	           						else
     	           							{
     	           							 $('#mubook').val("无");
     	           							}
             	                       
             	                       	if(data.mark=="1")
             	                       		{
             	                       			$('#mumark').val("有");
             	                       		}
             	                       	else
             	                       		
             	                 			{
             	                     	  	$('#mumark').val("无");
             	                       		}
             	                   	if(data.vote=="1")
     	                       		{
     	                       			$('#muvote').val("有");
     	                       		}
     	                       	else
     	                       		
     	                 			{
     	                     	  	$('#muvote').val("无");
     	                       		}
             	               	if(data.order=="1")
 	                       			{
 	                       				$('#muorder').val("有");
 	                       		}
 	                       	else
 	                       		
 	                 			{
 	                     	  	$('#muorder').val("无");
 	                       		}
             	           	if(data.change=="1")
	                       		{
	                       			$('#muchange').val("有");
	                       		}
	                       	else
	                       		
	                 			{
	                     	  	        $('#muchange').val("无");
	                       		}
             	                        $('#muid').val(obj);
             	                    
             	                       
             	                        $('#seechange').modal('show');
             						
             						
             						},
             						"json"
                				)
                			}
                
                </script>
                
                
                
            </div>
            
            <div style="margin-left:850px;height:60x;width:400px">
         					<c:if test="${curPage!=1}">
          							<a href="/ManageUserListServlet?curPage=${curPage-1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">上一页</a>
          					
          					</c:if>
							<c:if test="${curPage<totalPage }">
									<a href="/ManageUserListServlet?curPage=${curPage+1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">下一页</a>
          					</c:if>
		
									<span style="font-size:15px">当前第${curPage}页</span>/
									<span style="font-size:15px" >共${totalPage}页</span>/
									<span style="font-size:15px">共有${totalCount}条记录</span>
            </div>
            
            
        </div>
    </div>
</section>
<!--增加用户模态框-->
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel">
    <div class="modal-dialog" role="document" style="max-width:450px;">
        <form action="/AddManage" method="post" autocomplete="off" draggable="false">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >增加管理员</h4>
                </div>
                <div class="modal-body">
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr> </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td wdith="20%">姓名:</td>
                            <td width="80%"><input type="text"   class="form-control" name="name" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">密码:</td>
                            <td width="80%"><input type="password"  class="form-control" name="password" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">栏目管理权限:</td>
                            <td width="80%">
                                <select class="form-control"  name="category">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">票务管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="book">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">评论管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="mark">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">投票管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="vote">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">订单管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="order">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">修改和删除管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="change">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                        		
                        </tr>
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







<!--修改权限莫泰框  -->
<div class="modal fade" id="seechange" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel">
    <div class="modal-dialog" role="document" style="max-width:450px;">
        <form action="/UpdateManageUserServlet" method="post" autocomplete="off" draggable="false">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >修改管理员权限</h4>
                </div>
                <div class="modal-body">
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr> </tr>
                        </thead>
                        <tbody>
                       <tr>
                            <td wdith="20%">姓名:</td>
                            <td width="80%"><input type="text" value=""  readonly class="form-control" name="name" maxlength="10" autocomplete="off" id="muname" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">密码:</td>
                            <td width="80%"><input type="password" value="" class="form-control" name="password" maxlength="10" autocomplete="off" id="mupassword"/></td>
                        </tr>
                        <tr>
                            <td wdith="20%">栏目管理权限:</td>
                            <td width="80%">
                                <select class="form-control"  name="category" id="mucategory">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">票务管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="book"  id="mubook">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">评论管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="mark"  id="mumark">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">投票管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="vote"  id="muvote">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">订单管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="order"  id="muorder">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">修改和删除管理权限:</td>
                            <td width="80%">
                                <select class="form-control" name="change" id="muchange">
                                    <option value="1">有</option>
                                    <option value="0">无</option>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                        	<td>
                        				<input type="hidden" name="muid" id="muid"/>
                        		</td>
                        </tr>
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









<!--查看权限  -->
<div class="modal fade" id="seeManage" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel">
    <div class="modal-dialog" role="document" style="max-width:450px;">
       
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >查看管理员</h4>
                </div>
                <div class="modal-body">
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr> </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td wdith="20%">姓名:</td>
                            <td width="80%">
                     <input type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off"  id="mname" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">密码:</td>
                            <td width="80%"><input type="password" value="" class="form-control" name="password" maxlength="10" autocomplete="off" readonly  id="mpassword" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">栏目管理权限:</td>
                            <td width="80%">
                                <input type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off" readonly id="mcategory" />
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">票务管理权限:</td>
                            <td width="80%">
                                <input type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off" readonly id="mbook" />
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">评论管理权限:</td>
                            <td width="80%">
                              <input type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off" readonly id="mmark" />
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">投票管理权限:</td>
                            <td width="80%">
                                 <input type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off" readonly id="mvote" />
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">订单管理权限:</td>
                            <td width="80%">
                                <input type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off" readonly id="morder" />
                            </td>
                        </tr>
                        <tr>
                            <td wdith="20%">修改和删除管理权限:</td>
                            <td width="80%">
                                 <input type="text" value="" class="form-control" name="name" maxlength="10" autocomplete="off" readonly id="mchange" />
                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr></tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
                 
                </div>
            </div>
       
    </div>
</div>



































<!--用户信息模态框-->
<div class="modal fade" id="seeUser" tabindex="-1" role="dialog" aria-labelledby="seeUserModalLabel">
    <div class="modal-dialog" role="document" style="max-width:450px;">
        <form action="/User/update" method="post" autocomplete="off" draggable="false">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改用户</h4>
                </div>
                <div class="modal-body">
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr> </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td wdith="20%">姓名:</td>
                            <td width="80%"><input type="text" value="" class="form-control" id="truename" name="truename" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">用户名:</td>
                            <td width="80%"><input type="text" value="" class="form-control" id="username" name="username" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">电话:</td>
                            <td width="80%"><input type="text" value="" class="form-control" id="usertel" name="usertel" maxlength="13" autocomplete="off" /></td>
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
                    <input type="hidden" name="userid" value="" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form action="" method="post" autocomplete="off" draggable="false">
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
    $(function () {
        $("#main table tbody tr td a").click(function () {
            var name = $(this);
            var id = name.attr("rel"); //对应id
           	
           if (name.attr("name") === "delete") {
                if (window.confirm("此操作不可逆，是否确认？")) {
                    $.ajax({
                        type: "POST",
                        url: "/deleteManageUser",
                        data: "id=" + id,
                        cache: false, //不缓存此页面
                        success: function (data) {
                        		if(data=="no")
                        		{
                        				alert("你不是超级管理员,没有删除权限");
                        		}
                        		else
                        		{
                        			alert(data);
                        			window.location.href="/ManageUserListServlet?curPage=1";
                        		}
                        	
                        	
                        },
                        dataType:"json"
                    });
                };
            };
        });
    });
</script>
</body>
</html>
