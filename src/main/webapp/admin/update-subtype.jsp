<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改子栏目 - iBook后台管理系统</title>
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
                    <a class="navbar-brand" href="index.jsp">iBookCMS</a> </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">

                        <li class="dropdown"><c:if test="${not empty manageuser }">
            
            
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
                        <li><a href="/Semester_Demo/ManageUserLogout" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
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
      	 <li><a href="/Semester_Demo/AdminGetInitBookInfoServlet?curPage=1">图书</a></li>
      </c:if>
       <c:if test="${manageuser.order==1}">
      	  <li><a href="/Semester_Demo/FindAllordersServlet?curPage=1">订单</a></li>
      </c:if>
      <c:if test="${manageuser.mark==1}">
      	<li><a href="/Semester_Demo/MarkListServlet?curPage=1">评论</a></li>
      </c:if>
      <c:if test="${manageuser.vote==1}">
      	  <li><a href="/Semester_Demo/InitVoteListServlet?curPage=1">投票</a></li>
      </c:if>
      </ul>
      <ul class="nav nav-sidebar">
       <c:if test="${manageuser.mark==1}">
      	 <li><a href="/Semester_Demo/getCategoryType.do?curPage=1">栏目</a></li>
      </c:if>
                <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
                    <ul class="dropdown-menu" aria-labelledby="otherMenu">
                        <li><a href="flink.html">友情链接</a></li>
                        <li><a href="loginlog.html">访问记录</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
                    <ul class="dropdown-menu" aria-labelledby="userMenu">
                      <li><a href="/Semester_Demo/ManageUserListServlet?curPage=1">管理管理员</a></li>
                       <li><a href="/Semester_Demo/UserListServlet?curPage=1">管理用户</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="loginlog.html">管理登录日志</a></li>
                    </ul>
                </li>
                <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
                    <ul class="dropdown-menu" aria-labelledby="settingMenu">
                        <li><a href="setting.html">基本设置</a></li>
                        <li><a href="readset.html">用户设置</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">安全配置</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="disabled"><a>扩展菜单</a></li>
                    </ul>
                </li>
            </ul>
        </aside>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <h1 class="page-header">修改子栏目</h1>
            
                <div class="form-group">
                    <label for="category-name">栏目名称</label>
                    <input type="text" id="category-name" name="name" value="${updateSubtypedetail.tname }" class="form-control" placeholder="在此处输入栏目名称" required autocomplete="off">
                    <span class="prompt-text">这将是它在站点上显示的名字。</span> </div>
                <div class="form-group">
                    <label for="category-alias">栏目别名</label>
                    <input type="text" id="category-alias" name="alias" value=" ${updateSubtypedetail.otherName }" class="form-control" placeholder="在此处输入栏目别名" required autocomplete="off">
                    <span class="prompt-text">“别名”是在URL中使用的别称，它可以令URL更美观。通常使用小写，只能包含字母，数字和连字符（-）。</span> </div>
                <div class="form-group">
                    <label for="category-fname">父节点</label>
                    <select id="category-fname" class="form-control" name="fid">
                    	<option value="${updateSubtypedetail.superType }">${updateSuperTypeName}</option>
                    
                    	<c:forEach items="${categoryplist}" var="cat" >
                    		 <c:if test="${cat.tname!=updateSuperTypeName}">
                    			 <option value="${cat.ID }" >${cat.tname} </option>
                    		 </c:if>
							
						</c:forEach>
                    	
                        
                    </select>
                    <span class="prompt-text">栏目是有层级关系的，您可以有一个“音乐”分类目录，在这个目录下可以有叫做“流行”和“古典”的子目录。</span> </div>
                <div class="form-group">
                    <label for="category-keywords">关键字</label>
                    <input type="text" id="category-keywords" name="category-keywords" value="${updateSubtypedetail.keyword }" class="form-control" placeholder="在此处输入栏目关键字" autocomplete="off">
                    <span class="prompt-text">关键字会出现在网页的keywords属性中。</span> </div>
                <div class="form-group">
                    <label for="category-describe">描述</label>
                    <textarea class="form-control" id="category-describe" name="describe" rows="4" autocomplete="off">${updateSubtypedetail.subdesc }</textarea>
                    <span class="prompt-text">描述会出现在网页的description属性中。</span> </div>
                     <c:if test="${manageuser.change==1 }">
                <button class="btn btn-primary" type="submit" name="submit" onclick="fn1()">更新</button>
                	</c:if>
           
            
            
            
              <!-- 使用ajax异步获得操作信息 -->
          <script type="text/javascript">
          			function fn1()
          			{
          				/* System.out.println(name+" "+alias+" "+fid+" "+keywords+" "+describe); */
          				
          				var name=$("#category-name").val();
          				var alias=$("#category-alias").val();
          				var fid=$("#category-fname").val();
          				var keywords=$("#category-keywords").val();
          				var describe=$("#category-describe").val();
          				
          			  	$.post(
          					"/Semester_Demo/UpdateSubTypeDetailServlet",
          					{"name":name,"alias":alias,"fid":fid,"keywords":keywords,"describe":describe,"ID":${updateSubTypeById } },
          					function(data)
          					{
          						alert(data);
          						window.location.href="/Semester_Demo/showsubtypedetail.do?ID="+${updateSubTypeById };
          					},
          					"json"
          			  );	
          			}
          	
          </script>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        </div>
    </div>
</section>
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
</body>
</html>
