<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<base href="http://localhost:8080/front/">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>大麦网-全球演出赛事官方购票平台</title>
		<link rel="icon" href="img/logo2.png">
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="container-fluid">

			<!-- 引入header.jsp -->
			<jsp:include page="header.jsp"></jsp:include>

			<!-- 轮播图 -->
			<div class="container-fluid">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- 轮播图的中的小点 -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- 轮播图的轮播图片 -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="img/adv_1.jpg" style="width:1600px">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
						<div class="item">
							<img src="img/adv_2.jpg" style="width:1600px">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
						<div class="item">
							<img src="img/adv_1.jpg" style="width:1600px">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
					</div>

					<!-- 上一张 下一张按钮 -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			
			<!-- 热门商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>热门票务&nbsp;&nbsp;<img src="img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="products/hao/4.png" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
						<%--<a href="product_info.htm">--%>
							<img src="products/hao/3.png" width="516px" height="200px" style="display: inline-block;">
						<%--</a>--%>
					</div>
					
					<c:forEach items="${hotbooklist }" var="hotPro">

						<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
							<%--<a href="product_info.htm">--%>
								<img src="${hotPro.picture }" width="130" height="130" style="display: inline-block;">
							<%--</a>--%>
							<p style="text-overflow:ellipsis;
									white-space:nowrap;
									overflow:hidden;">${hotPro.bookName }</p>
							<p><font color="#E4393C" style="font-size:16px">&yen;${hotPro.price }起</font></p>
						</div>

					</c:forEach>
				
					
	
					
				</div>
			</div>
			
			<!-- 广告条 -->
            <div class="container-fluid" style="margin-top: 20px">
				<img src="products/hao/ad.jpg" width="100%"/>
			</div>
			
			<!-- 最新商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>最新票务&nbsp;&nbsp;<img src="img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="products/hao/5.png" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
						<%--<a href="product_info.htm">--%>
							<img src="products/hao/1.png" width="516px" height="200px" style="display: inline-block;">
						<%--</a>--%>
					</div>
				
					<c:forEach items="${newbooklist }" var="newPro">

						<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
							<%--<a href="product_info.htm">--%>
								<img src="${newPro.picture }" width="130" height="130" style="display: inline-block;">
							<%--</a>--%>
							<p>${newPro.bookName }</p>
							<p><font color="#E4393C" style="font-size:16px">&yen;${newPro.price }起</font></p>
						</div>

					</c:forEach>
					
				</div>
			</div>			
			
			
			
			<!-- 打折商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>打折票务&nbsp;&nbsp;<img src="img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="products/hao/6.png" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
						<%--<a href="product_info.htm">--%>
							<img src="products/hao/2.png" width="516px" height="200px" style="display: inline-block;">
						<%--</a>--%>
					</div>
				
					<c:forEach items="${salebooklist }" var="Pro">

						<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
							<%--<a href="product_info.htm">--%>
								<img src="${Pro.picture }" width="130" height="130" style="display: inline-block;">
							<%--</a>--%>
							<p>${Pro.bookName }</p>
							<p><font color="#E4393C" style="font-size:16px;text-decoration:line-through;" >&yen;${Pro.nowPrice }起</font></p>
							<p><font color="#E4393C" style="font-size:16px">&yen;${Pro.price }起</font></p>
						</div>

					</c:forEach>
					
				</div>
			</div>			
			<!-- 引入footer.jsp -->
			<jsp:include page="footer.jsp"></jsp:include>
			
		</div>
	</body>

</html>