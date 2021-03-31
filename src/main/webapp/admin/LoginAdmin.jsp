<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ikube云边协同管理平台</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
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
<div class="container">
    <div class="siteIcon"><img src="images/icon/damaiz_icon.png" alt="" data-toggle="tooltip" data-placement="top" title="欢迎使用大麦网票务管理系统" draggable="false" /></div>
    <form action="/admin/login" method="POST" >
        <div autocomplete="off" class="form-signin">
            <h2 class="form-signin-heading">管理员登录</h2>
            <label for="userName" class="sr-only">用户名</label>
            <input type="text" id="userName" name="uname" class="form-control" placeholder="请输入用户名" required autofocus autocomplete="off" maxlength="10">
            <label for="userPwd" class="sr-only">密码</label>
            <input type="password" id="userPwd" name="password" class="form-control" placeholder="请输入密码" required autocomplete="off" maxlength="18">
            <button type="submit" class="btn btn-lg btn-primary btn-block" id="signinSubmit">登录</button>

        </div>
    </form>



    <script type="text/javascript">



        function fn1()
        {
//   					var userName=$("#userName").val();
//   					var userPwd=$("#userPwd").val();

//   					$.post(
//          					"/Semester_Demo/LoginCheckServlet",
//          					{"userName":userName,"userPwd":userPwd},
//          					function(data)
//          					{
//          						if(data=="登录成功!")
//          							{
//          								window.location.href="/Semester_Demo/admin/index.jsp";
//          							}
//          						else
//          							{
//          								alert(data);
//              							window.location.reload();
//          							}
//
//
//          					},
//          					"json"
//          			  );
            var userName=$("#userName").val();
            var userPwd=$("#userPwd").val();
            $.ajax({
                async:false,
                url:"/admin/login",
                type:"get",
                data: {"uname":userName,"password":userPwd},
                datatype: 'json',
                success: function (data) {
                    alert(data);
                }
            });
        }

    </script>
</div>
<div class="footer">
    <div></div>

    <%--<p><a href="/frontindex" data-toggle="tooltip" datas-placement="left" title="不知道自己在哪?">回到前台 →</a></p>--%>
</div>
</div>
<script src="js/bootstrap.min.js"></script>
<script>
    $('[data-toggle="tooltip"]').tooltip();
    window.oncontextmenu = function(){
        //return false;
    };
    $('.siteIcon img').click(function(){
        window.location.reload();
    });
    $('#signinSubmit').click(function(){
        if($('#userName').val() === ''){
            $(this).text('用户名不能为空');
        }else if($('#userPwd').val() === ''){
            $(this).text('密码不能为空');
        }else{
            $(this).text('请稍后...');
        }
    });
</script>
</body>
</html>
