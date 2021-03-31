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
    <title>IKube云边协同管理平台-Deployment详情</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="images/icon/damaiz_icon.png">
    <link rel="shortcut icon" href="images/icon/damaiz_icon.png">
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
                    <a class="navbar-brand" href="index.jsp">IKube云边协同管理平台</a> </div>
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
                            <ul class="dropdown-menu dropdown-menu-left" style="z-index:1000000000">
                                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo" style="z-index:1000000000">个人信息</a></li>
                                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog" styyle="z-index:1000000000">登录记录</a></li>
                            </ul>
                        </li>
                        <li><a href="/ManageUserLogout" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
                        <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
                    </ul>
                    <form action="" method="post" class="navbar-form navbar-right" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
                            <span class="input-group-btn">

              </span> </div>
                    </form>
                </div>
            </div>
        </nav>
    </header>
    <div class="row">
        <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
            <ul class="nav nav-sidebar">
                <li ><a href="index.jsp">报告</a></li>
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
            <%--<ul class="nav nav-sidebar">--%>
            <%--<li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>--%>
            <%--<ul class="dropdown-menu" aria-labelledby="userMenu">--%>
            <%--<li><a href="/ManageUserListServlet?curPage=1">管理管理员</a></li>--%>
            <%--<li><a href="/UserListServlet?curPage=1">管理用户</a></li>--%>
            <%--<li role="separator" class="divider"></li>--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--&lt;%&ndash;<li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<ul class="dropdown-menu" aria-labelledby="settingMenu">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li><a href="setting.html">基本设置</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li><a href="readset.html">阅读设置</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li role="separator" class="divider"></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li><a data-toggle="modal" data-target="#areDeveloping">安全配置</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li role="separator" class="divider"></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="disabled"><a>扩展菜单</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
            <%--</ul>--%>
        </aside>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="mai你">



            <div style="width: 50%;display: inline;">
               <table class="table table-striped  table-hover ">

                   <tr>
                       <td style="width: 10%">
                           <h4>基本信息</h4>
                       </td>
                       <td>

                       </td>
                   </tr>

                   <tr>
                       <td>负载名称</td>
                       <td>
                            ${deployment_detail.name}
                       </td>
                   </tr>

                   <tr>
                       <td>
                           负载类型
                       </td>
                       <td>
                           <%--${deployment_detail.kind}--%>
                           Deployment
                       </td>
                   </tr>

                   <tr>
                       <td>副本数量</td>
                       <td>
                           ${deployment_detail.replicas}
                       </td>
                   </tr>

                   <tr>
                       <td>注解</td>


                       <td>

                           <c:forEach items="${deployment_detail.annotations}" var="entry">

                               <h4>${entry.key}:${entry.value}</h4>

                           </c:forEach>
                       </td>

                   </tr>

                   <tr>
                       <td>标签</td>
                       <td>

                       <c:forEach items="${deployment_detail.labels}" var="entry">

                                <h4>${entry.key}:${entry.value}</h4>

                       </c:forEach>
                       </td>
                   </tr>


               </table>

            </div>


            <div style="width: 45%;display: inline;right: 1%">
                <table class="table table-striped  table-hover ">

                    <tr>
                        <td>
                            <h4>运行时信息</h4>
                        </td>
                        <td>

                        </td>
                        <td>

                        </td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>
                            Type
                        </td>
                        <td>
                            Status
                        </td>
                        <td>
                            message
                        </td>
                        <td>
                            reason
                        </td>
                        <td>
                            lastUpdateTime
                        </td>
                    </tr>

                    <c:forEach items="${deployment_detail.condition}" var="p">

                        <tr>

                            <td>
                                ${p.type}
                            </td>
                            <td>
                                    ${p.status}
                            </td>
                            <td>
                                    ${p.message}
                            </td>
                            <td>
                                    ${p.reason}
                            </td>
                            <td>
                                    ${p.lastUpdateTime}
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>

            


            <div style="width: 45%;margin-right: 3%;float: left">


                <table class="table table-striped  table-hover ">

                    <tr>
                        <td>
                           <h4>部署策略</h4>
                        </td>
                        <td>

                        </td>
                    </tr>

                    <tr>
                        <td>类型</td>
                        <td>
                            ${deployment_detail.strategy.type}
                        </td>
                    </tr>



                    <tr>
                        <td>滚动更新</td>


                        <td>

                            <c:forEach items="${deployment_detail.strategy.rollingUpdate}" var="entry">

                                <h4>*${entry.key}:  ${entry.value}</h4>

                            </c:forEach>
                        </td>

                    </tr>




                </table>
            </div>


            <div style="width: 43%;float: left;">
                <table class="table table-striped  table-hover ">
                    <tr>
                        <td>
                            <h4>常用操作</h4>
                        </td>
                        <td>

                        </td>
                    </tr>


                    <tr>

                        <td>
                            伸缩
                        </td>

                        <td>
                            <form action="/deployment_scale" method="POST">


                                <input type="text" class="form-control" name="scale_name" autocomplete="off" placeholder="名称" maxlength="15"  value="${deployment_detail.name}"  readonly>
                                <input type="text" class="form-control" name="scale_number"  autocomplete="off" placeholder="输入伸缩数量" maxlength="15">
                                <button class="btn btn-default" id="button_scaler" type="submit">

                                    <%--<a href="/deployment_scale?name=${deployment_detail.name}">伸缩</a>--%>

                                        伸缩
                                </button>
                            </form>
                        </td>
                    </tr>



                </table>



            </div>




            <div style="clear: left"></div>



            <div style="width: 100%;text-align: center">
             <h3 style="text-align: center">该负载所管理的Pods</h3>
            </div>
            <br>


            <c:forEach items="${deployment_pods}" var="p">
                <div style="border-radius: 30px;border-color: black;border-style: solid;border-width: 2px;margin-top:2%;">
                    <div style="width:100%;border-radius: 30px;margin-left: 2%;margin-top: 2%">


                            <div style="width: 45%;margin-right: 1%;float:left;">


                                <table class="table table-striped  table-hover">

                                    <tr>
                                        <td colspan="2">
                                            <h4>Pods:${p.name}</h4>
                                        </td>
                                        <td>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>名称空间</td>
                                        <td>
                                                ${p.namespace_name}
                                        </td>
                                    </tr>



                                    <tr>
                                        <td>名称</td>


                                        <td>

                                           ${p.name}
                                        </td>

                                    </tr>

                                    <tr>
                                        <td>创建时间</td>


                                        <td>

                                                ${p.creationTimestamp}
                                        </td>

                                    </tr>

                                    <tr>
                                        <td>所在节点</td>


                                        <td>

                                                ${p.nodeName}
                                        </td>

                                    </tr>


                                    <tr>
                                        <td>主机IP</td>


                                        <td>

                                                ${p.hostIP}
                                        </td>

                                    </tr>


                                    <tr>
                                        <td>容器组IP</td>


                                        <td>

                                                ${p.podIP}
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>状态</td>


                                        <td>

                                                ${p.phase}
                                        </td>

                                    </tr>






                                </table>
                            </div>


                            <div style="width: 40%;float: left">
                                <table class="table table-striped  table-hover ">

                                    <tr>
                                        <td>
                                            <h4>Pods运行时信息</h4>
                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>

                                    </tr>

                                    <tr>
                                        <td>
                                            Type
                                        </td>
                                        <td>
                                            Status
                                        </td>
                                        <td>
                                            lastTransitionTime
                                        </td>

                                    </tr>

                                    <c:forEach items="${p.conditions}" var="c">

                                        <tr>

                                            <td>
                                                    ${c.type}
                                            </td>
                                            <td>
                                                    ${c.status}
                                            </td>
                                            <td>
                                                    ${c.lastTransitionTime}
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </table>



                            </div>

                        <div style="clear:left;"></div>



                    </div>
                    <div style="width:100%">



                        <div style="width: 50%;float: left;margin-left: 2%">
                            <table class="table table-striped  table-hover ">

                                <tr>
                                    <td colspan="5">
                                        <h4>容器信息</h4>
                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        Name
                                    </td>
                                    <td>
                                        Image
                                    </td>
                                    <td>
                                        Ready
                                    </td>
                                    <td>
                                        restartCount
                                    </td>
                                    <td>
                                        imagePullPolicy
                                    </td>

                                </tr>

                                <c:forEach items="${p.containerList}" var="c">

                                    <tr>

                                        <td>
                                                ${c.name}
                                        </td>
                                        <td>
                                                ${c.image}
                                        </td>
                                        <td>
                                                ${c.ready}
                                        </td>
                                        <td>
                                                ${c.restartCount}
                                        </td>
                                        <td>
                                                ${c.imagePullPolicy}
                                        </td>

                                    </tr>
                                </c:forEach>
                            </table>



                        </div>




                        <div style="clear: left"></div>

                    </div>
                </div>

            </c:forEach>




        </div>


    </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document">
        <form action="/Semester_Demo/UpdateManagerUserInfo" method="post">
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
                            <td width="80%"><input type="text" value="${manageuser.name }" class="form-control" name="name" maxlength="10" autocomplete="off" /></td>
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
                        <tr>
                            <td>
                                <input type="hidden" name="manageuserid" value="${manageuser.ID }">
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
