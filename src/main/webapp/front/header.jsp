<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<a href="/frontindex">
			<img src="img/logo.png" style="height:60px"/>
		</a>
	</div>
	<div class="col-md-3" style="padding-top:20px;margin-left:860px;margin-top:-50px;margin-bottom:15px;width:600px">
		<ol class="list-inline">


			<c:if test="${empty user }">
				<li><a href="login.jsp">登录</a></li>
				<li><a href="register.jsp">注册</a></li>
			</c:if>
			<c:if test="${!empty user }">
				<li style="color:red">欢迎您，${user.username }</li>
				<li><a href="/UserLogoutServlet">退出</a></li>
			</c:if>
			
			<li><a href="cart.jsp">购物车</a></li>
			<li><a href="/ProductMyOrders">我的订单</a></li>
			
			<li><a href="/FVoteListIndexServlet?curPage=1">畅享投票</a></li>
			<li><a href="/MyMarkServlet?curPage=1">我的评论</a></li>
			<li><a href="/MyLoveListServlet?curPage=1">我的收藏</a></li>
		</ol>
		
		
	</div>
</div>


<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">--%>
					<%--<span class="sr-only">Toggle navigation</span>--%>
					<%--<span class="icon-bar"></span>--%>
					<%--<span class="icon-bar"></span>--%>
					<%--<span class="icon-bar"></span>--%>
				<%--</button>--%>
				<a class="navbar-brand" href="/frontindex">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="categoryUl">
				
					 <%--<c:forEach items="${categoryList }" var="category">--%>
						<%--<li><a href="#">${category.cname }</a></li>--%>
					<%--</c:forEach> --%>
					
				</ul>
				<form class="navbar-form navbar-right" role="search"  action="/SerachTicketResultServlet" method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="搜索票务" onkeyup="searchWord(this)" name="searchinput" id="searchinput" onblur="closeshowdiv(this)">
						<div id="showdiv" style="display:none; position:absolute;z-index:1000;background:#fff; width:179px;border:1px solid #ccc;">
							
						</div>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
		
		<script type="text/javascript">
		
		
			//header.jsp加载完毕后 去服务器端获得所有的category数据
			$(function(){
				var content = "";
				$.post(
					"${pageContext.request.contextPath}/GetInitIndexSuperType",
					function(data){
						
						//[{"cid":"xxx","cname":"xxxx"},{},{}]
						//动态创建<li><a href="#">${category.cname }</a></li>
						for(var i=0;i<data.length;i++){
							content+="<li><a href='${pageContext.request.contextPath}/ProductListServlet?cid="+data[i].ID+"+&currentPage=1'>"+data[i].tname+"</a></li>";
						}
						
						//将拼接好的li放置到ul中
						$("#categoryUl").html(content);
					},
					"json"
				);
			});
			
			
			
			
			
		</script>
	
<script type="text/javascript">

	function closeshowdiv(obj)
	{
		$("#showdiv").css("display","none");
	}
	function overFn(obj)
	{
		$("#searchinput").val($(obj).html());
		$(obj).css("background","#d6d6d6");
	}
	
	function outFn(obj)
	{
		$(obj).css("background","#FFF")
	}
	
	function clickFn(obj)
	{
		
		$("#searchinput").val($(obj).html());
		$("#showdiv").css("display","none");
	}
	function searchWord(obj)
	{
		/* 1.获得输入框的输入内容 */
		
		var word=$(obj).val();
		/* 2.根据输入框的内容去数据库中模糊查询 */
		var content="";
		$.post(
			"/SearchTicketInfoServlet",
			{"word":word},
			function(data){
				/* 3.将返回的数据显示在框中 */
				
				if(data.length>0){
				for(var i=0;i<data.length;i++)
					{
						content+="<div style='padding:5px;cursor:pointer' onmouseover='overFn(this)' onmouseout='outFn(this)' onclick='clickFn(this)'>"+data[i]+"</div>";
					}
				$("#showdiv").html(content);
				$("#showdiv").css("display","block");
				}
			},
			"json"
		);
	
		
	}
	
</script>	
	</nav>
</div>