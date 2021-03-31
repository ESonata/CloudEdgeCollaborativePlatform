<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 101 Template</title>
      <link rel="icon" href="img/logo2.png">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<!-- 引入表单校验jquery插件 -->
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- 引入自定义css文件 style.css -->
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/admin/func/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>

        .d-main {
            margin-top: 10px;
            width:200px;
            height: 800px;
           
             padding: 20px;
        }
        
    </style>
<script type="text/javascript">
	

	$(function(){
		$("#myform").validate({
			rules:{
				"vname":{
					"required":true,
					"rangelength":[3,20]
				},
		
			},
			messages:{
				"username":{
					"required":"用户名不能为空",
					"rangelength":"密码长度3-20位"
				}

			}
		});
	});
	</script>
  </head>
  <body>
        <div class="container ">
                <div class="d-main center-block">
                    <form id="myform" action="${pageContext.request.contextPath}/admin/manage/addvote" method="post">
                             <div class="form-group">
                              <label >新增投票项目名称/label>
                              <input type="text" id="vname" class="form-control" required="required" name="vname" required="true" />
                          </div>
                           <div class="form-group">
                           <label >投票持续时间</label>
                           <input  class="form-control" type="number"  size="11" name="duration" required="true" /> 
                           <select name="timetype" class="form-control">
                                <option value="1">分钟</option>
                                <option value="2">小时</option>
                                <option value="3">天</option>
                           </select>
                              </div>
                           <div class="form-group">   
                            <label >投票选项的数目</label>           
                          <select name="items" id="items" onchange="change()" class="form-control">
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                          </select>
                          <div id="content">
                              <label >选项1</label><input name='vitem1' class='vitem form-control' required="true" type='text' >
                              <label >选项2</label><input name='vitem2' class='vitem form-control' required="true" type='text'>
                          </div>
                          </div>
                           
                        <div class="form-group">
                            <input type="submit" class="btn btn-success"  value="增加" />
                        </div>
                    </form>
                </div>
        </div>

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
     <script>
                var  obj=document.getElementById( 'items' );
                var content = document.getElementById("content");
                function change() {
                   var  index=obj.selectedIndex;
                   var value = obj.options[index].value;
                   console.log(value);
                   var text = "";
                   for(var i = value; i>0; i--) {

                        text=  "<label >选项"+i+"</label><input name='vitem"+i+"' type='text'required='true' class='vitem form-control'>" + text;
                   }
                   console.log(text);
                   content.innerHTML = text;
                }
            </script>
  </body>
</html>