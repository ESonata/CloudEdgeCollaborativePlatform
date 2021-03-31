<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新建StatefulSet - IKube云边协同管理平台</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="images/icon/damaiz_icon.png">
    <link rel="shortcut icon" href="images/icon/damaiz_icon.png">
    <script src="js/jquery-2.1.4.min.js"></script>
    <!--[if gte IE 9]>
    <script src="js/jquery-1.11.1.mi n.js" type="text/javascript"></script>
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
                    <a class="navbar-brand" href="/">IKube云边协同管理平台</a> </div>
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
                <li><a href="/GetDeploymentsServicesPods?namespace_name=default">应用管理</a></li>


                <li><a href="/ListImages?curPage=1">镜像管理</a></li>


                <%--<li><a href="/MarkListServlet?curPage=1">监控管理</a></li>--%>


                <li><a href="/ListNamespace?curPage=1">空间管理</a></li>



                <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">监控管理</a>
                    <ul class="dropdown-menu" aria-labelledby="userMenu">
                        <li><a href="monitor-cluster.jsp">集群概览</a></li>
                        <li><a href="monitor-normal.jsp">普通节点监控</a></li>
                        <li><a href="monitor-edge.jsp">边缘节点监控</a></li>
                        <li role="separator" class="divider"></li>
                        <%--<li><a href="loginlog.html">管理登录日志</a></li>--%>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">


            </ul>
            <ul class="nav nav-sidebar">

            </ul>
        </aside>

        <form action="/CreateStatafulSet" method="post" enctype="multipart/form-data">
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
                <div class="row">

                    <div class="col-md-9">

                        <h1 class="page-header">新增StatefulSet</h1>
                        <%--<div class="form-group">--%>

                        <!--新增图书名称-->
                        <%--<input type="file" name="image" id="image" class="form-control" placeholder="上传镜像文件(格式要求.tar)" autocomplete="off" />--%>
                        <%--<input type="text" id="bookName" name="bookName" class="form-control" placeholder="在此处输入票务名称" required autofocus autocomplete="off">--%>
                        <%--</div>--%>
                        <!--<div class="form-group">-->
                        <!--<label for="article-content" class="sr-only">内容</label>-->
                        <!--<script id="article-content" name="content" type="text/plain"></script>-->
                        <!--</div>-->


                        <br>
                        <div class="add-article-box" style="width:49%;display: inline-block;">
                            <h2 class="add-article-box-title"><span>StatefulSet名称</span></h2>
                            <div class="add-article-box-content">
                                <!--新增图书大类-->
                                <%--<select id="typeBID" class="form-control" name="typeBID" onchange="getSub(this)">--%>

                                <%--<c:forEach items="${categoryplist }" var="p">--%>
                                <%--<option value="${p.ID}" >${p.tname }</option>--%>
                                <%--</c:forEach>--%>
                                <%--</select>--%>
                                <input type="text" name="deployment_name" placeholder="请输入StatefulSet工作负载名称" class="form-control" id="deployment_name" autocomplete="off">
                                <span class="prompt-text">*负载名称</span>
                            </div>
                        </div>


                        <script type="text/javascript">

                            $(function(){
                                $.post(
                                    "${pageContext.request.contextPath}/GetInitIndexSuperType",
                                    function (data)
                                    {
                                        var content="<option value='0' selected>无</option>";

                                        for(var i=0;i<data.length;i++)
                                        {
                                            content+="<option value='"+data[i].ID+"'>"+data[i].tname+"</option>";
                                        }

                                        $("#typeBID").html(content);
                                    },
                                    "json"
                                )


                            });


                            function getSub(obj)
                            {
                                $.post(
                                    "${pageContext.request.contextPath}/SubTypeGetByBID",
                                    {"typeBID":obj.value},
                                    function (data)
                                    {
                                        var content="";

                                        for(var i=0;i<data.length;i++)
                                        {
                                            content+="<option value='"+data[i].ID+"'>"+data[i].tname+"</option>";
                                        }

                                        $("#typeID").html(content);
                                    },
                                    "json"
                                )

                            }


                        </script>




                        <div class="add-article-box" style="width:50%;display: inline-block;right: 1%;">
                            <h2 class="add-article-box-title"><span>StatefulSet标签键</span></h2>
                            <div class="add-article-box-content">

                                <input type="text" name="label_key"  class="form-control" id="label_key" autocomplete="off" placeholder="请输入StatefulSet标签键">
                                <span class="prompt-text">StatefulSet标签键</span>
                            </div>
                        </div>

                        <br>

                        <div class="add-article-box" style="width:49%;display: inline-block;">
                            <h2 class="add-article-box-title"><span>StatefulSet标签值</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" name="label_value"  class="form-control" autocomplete="off"  placeholder="请输入StatefulSet标签值">
                                <%--<input type="text" class="form-control" placeholder="输入现价" name="nowPrice" autocomplete="off" id="nowPrice">--%>
                                <span class="prompt-text">*StatefulSet标签值</span>

                            </div>
                        </div>



                        <div class="add-article-box" style="width:50%;display: inline-block;right: 1%;">

                            <h2 class="add-article-box-title"><span>名称空间</span></h2>
                            <div class="add-article-box-content">

                                <input type="text" name="namespace_name"  class="form-control" id="namespace_name" autocomplete="off" placeholder="请输入StatefulSet名称空间">
                                <span class="prompt-text">*名称空间</span>
                            </div>
                        </div>


                        <div class="add-article-box" style="width:49%;display: inline-block;">
                            <h2 class="add-article-box-title"><span>Pod副本数量</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" name="replicas"  class="form-control" autocomplete="off"  placeholder="请输入Pod副本数量">
                                <%--<input type="text" class="form-control" placeholder="输入现价" name="nowPrice" autocomplete="off" id="nowPrice">--%>
                                <span class="prompt-text">*Pod副本数量</span>

                            </div>
                        </div>



                        <div class="add-article-box" style="width:50%;display: inline-block;right: 1%;">

                            <h2 class="add-article-box-title"><span>容器名称</span></h2>
                            <div class="add-article-box-content">

                                <input type="text" name="container_name"  class="form-control" id="container_name" autocomplete="off" placeholder="请输入容器名称">
                                <span class="prompt-text">*容器名称</span>
                            </div>
                        </div>
                        <div class="add-article-box" style="width:49%;display: inline-block;">
                            <h2 class="add-article-box-title"><span>镜像版本</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" name="container_image"  class="form-control" autocomplete="off"  placeholder="请输入镜像版本">
                                <%--<input type="text" class="form-control" placeholder="输入现价" name="nowPrice" autocomplete="off" id="nowPrice">--%>
                                <span class="prompt-text">*Pod副本数量</span>

                            </div>
                        </div>



                        <div class="add-article-box" style="width:50%;display: inline-block;right: 1%;">

                            <h2 class="add-article-box-title"><span>容器端口</span></h2>
                            <div class="add-article-box-content">

                                <input type="text" name="container_port"  class="form-control" id="container_port" autocomplete="off" placeholder="请输入容器端口">
                                <span class="prompt-text">*容器名称</span>
                            </div>
                        </div>

                        <br>
                        <br>

                        <%--<div class="form-group"  >--%>
                        <%--<h2 class="add-article-box-title" style="background: #fff"><span>票务简介</span></h2>--%>
                        <%--<label for="article-content" class="sr-only">内容</label>--%>
                        <%--<!--新增图书简介-->--%>
                        <%--<script id="article-content" name="content" type="text/plain"></script>--%>
                        <%--</div>--%>

                        <div class="add-article-box" style="width:49%;display: inline-block;">
                            <h2 class="add-article-box-title"><span>节点选择</span></h2>
                            <div class="add-article-box-content">
                                <label><input type="radio"  class="form-control" name="node_select" value="1">调度到边缘节点</label>
                                <label><input type="radio" class="form-control" name="node_select" value="0">调度到普通节点</label>

                                <span class="prompt-text">*节点选择</span>

                            </div>
                        </div>









                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>保存信息</span></h2>

                            <div class="add-article-box-footer">
                                <button class="btn btn-primary btn-size" type="submit" name="submit">
                                    <!--用于保存的servlet 使用ajax返回保存成功或者失败-->
                                    保存
                                </button>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </form>




        <!--右侧栏目-->

        <%--<div class="col-md-3">--%>
        <%--<h1 class="page-header">&nbsp;</h1>--%>


        <%--<div class="add-article-box">--%>
        <%--<h2 class="add-article-box-title"><span>主办方</span></h2>--%>
        <%--<div class="add-article-box-content">--%>
        <%--<!--新增作者姓名-->--%>
        <%--<input type="text" class="form-control" placeholder="输入作者姓名" name="author" autocomplete="off" id="author">--%>
        <%--<span class="prompt-text">*主办方的的名称</span>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--&lt;%&ndash;<div class="add-article-box">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<h2 class="add-article-box-title"><span>出版社</span></h2>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="add-article-box-content">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!--新增出版社名称-->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<input type="text" class="form-control" placeholder="输入出版社名称" name="publish" autocomplete="off" id="publish">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<span class="prompt-text">*出版社名称</span>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--<div class="add-article-box">--%>
        <%--<h2 class="add-article-box-title"><span>是否新票</span></h2>--%>
        <%--<div class="add-article-box-content">--%>
        <%--<!--新增是否新品-->--%>
        <%--<select id="newBook" class="form-control" name="newBook">--%>
        <%--<option value="0" selected>否</option>--%>
        <%--<option value="1">是</option>--%>

        <%--</select>--%>
        <%--<span class="prompt-text">*该票务是否新票</span>--%>
        <%--</div>--%>
        <%--</div>--%>


        <%--<div class="add-article-box">--%>
        <%--<h2 class="add-article-box-title"><span>是否特价</span></h2>--%>
        <%--<div class="add-article-box-content">--%>
        <%--<!--新增图书特价-->--%>
        <%--<select id="sale" class="form-control" name="sale">--%>
        <%--<option value="0" selected>否</option>--%>
        <%--<option value="1">是</option>--%>
        <%--</select>--%>
        <%--<span class="prompt-text">*该票务是否特价</span>--%>
        <%--</div>--%>
        <%--</div>--%>




        <%--<div class="add-article-box">--%>
        <%--<h2 class="add-article-box-title"><span>票务主题图</span></h2>--%>
        <%--<div class="add-article-box-content">--%>
        <%--<!--新增图片地址-->--%>
        <%--<input type="text" class="form-control" placeholder="点击按钮选择图片" id="pictureUpload" name="picture" autocomplete="off">--%>
        <%--</div>--%>
        <%--<div class="add-article-box-footer">--%>
        <%--<button class="btn btn-default" type="button" ID="upImage">选择</button>--%>

        <%--</div>--%>


        <%--</div>--%>
        <%--<c:if test="${manageuser.change==0 }">--%>
        <%--<div class="add-article-box">--%>
        <%--<h2 class="add-article-box-title"><span>没有保存权限</span></h2>--%>
        <%--</div>--%>
        <%--</c:if>--%>
        <%----%>
        <%----%>
        <%--<c:if test="${manageuser.change==1 }">--%>
        <%--<div class="add-article-box">--%>
        <%--<h2 class="add-article-box-title"><span>保存票务信息</span></h2>--%>
        <%--<div class="add-article-box-content">--%>

        <%--<p>--%>
        <%--<label>保存时间：</label>--%>
        <%--&nbsp;&nbsp;--%>
        <%--<span class="article-time-display">--%>
        <%--<input style="border: none;"  name="INTime" type="datetime-local" value="2015-09-24T13:59:59" id="INTime"/>--%>
        <%--</span>--%>
        <%--</p>--%>
        <%--</div>--%>
        <%--<div class="add-article-box-footer">--%>
        <%--<button class="btn btn-primary btn-size" type="submit" name="submit" onclick="fn1()">--%>
        <%--<!--用于保存的servlet 使用ajax返回保存成功或者失败-->--%>
        <%--保存--%>
        <%--</button>--%>
        <%--</div>--%>
        <%--</c:if>--%>
        <%--</div>--%>
        <%--</div>--%>









        <!-- 使用ajax异步获得操作信息 -->
        <script type="text/javascript">
            function fn1()
            {
                /* System.out.println(name+" "+alias+" "+fid+" "+keywords+" "+describe); */

                var bookName=$("#bookName").val();

                if(bookName.length==0)
                {
                    alert("票务名称不能为空!");
                    return ;
                }
                var typeBID=$("#typeBID").val();
                var amount=$("#amount").val();
                var price=$("#price").val();
                var nowPrice=$("#nowPrice").val();
                var introduce=UE.getEditor('article-content').getContent();
                var author=$("#author").val();
                var newBook=$("#newBook").val();
                var sale=$("#sale").val();
                var picture=$("#pictureUpload").val();
                var INTime=$("#INTime").val();

                $.post(
                    "/AdminAddBookInfoServlet",
                    {"bookName":bookName,"typeBID":typeBID,"amount":amount,"price":price,"nowPrice":nowPrice,"introduce":introduce,
                        "author":author,"newBook":newBook,"sale":sale,"picture":picture,"INTime":INTime},
                    function(data)
                    {
                        alert(data);
                        location.reload();
                    },
                    "json"
                );
            }

        </script>












    </div>
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
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"> </script>
<script src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script id="uploadEditor" type="text/plain" style="display:none;"></script>

<script type="text/javascript">


var editor = UE.getEditor('article-content',{

    initialFrameWidth :'100%',//设置编辑器宽度
    initialFrameHeight:'110px',//设置编辑器高度
    scaleEnabled:true//设置不自动调整高度
    //scaleEnabled {Boolean} [默认值：false]//是否可以拉伸长高，(设置true开启时，自动长高失效)

});

window.onresize=function(){
    window.location.reload();
}
var _uploadEditor;
$(function () {
    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    _uploadEditor = UE.getEditor('uploadEditor');
    _uploadEditor.ready(function () {
        //设置编辑器不可用
        //_uploadEditor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _uploadEditor.hide();
        //侦听图片上传
        _uploadEditor.addListener('beforeInsertImage', function (t, arg) {
            //将地址赋值给相应的input,只去第一张图片的路径
            $("#pictureUpload").attr("value", arg[0].src);
            //图片预览
            //$("#imgPreview").attr("src", arg[0].src);
        })
        //侦听文件上传，取上传文件列表中第一个上传的文件的路径
        _uploadEditor.addListener('afterUpfile', function (t, arg) {
            $("#fileUpload").attr("value", _uploadEditor.options.filePath + arg[0].url);
        })
    });
});
//弹出图片上传的对话框
$('#upImage').click(function () {
    var myImage = _uploadEditor.getDialog("insertimage");
    myImage.open();
});
//弹出文件上传的对话框
function upFiles() {
    var myFiles = _uploadEditor.getDialog("attachment");
    myFiles.open();
}
</script>
</body>
</html>
