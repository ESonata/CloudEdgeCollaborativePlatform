<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<base href="http://localhost:8080/front/">
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="img/logo2.png">
    <meta charset="utf-8">
    <title>我的评论</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<br>



<h2 class="page-header" style="margin-left: 150px">查看我的评论 <span class="badge"  >${totolCount }</span></h2>
<div class="table-responsive"style="margin-top: 50px;margin-left: 150px;margin-right: 150px">
    <table class="table table-striped table-hover">
        <thead>
        <tr>

            <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">序号</span></th>
            <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">评论商品名</span></th>
            <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">评论时间</span></th>
            <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">评论内容</span></th>

            <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${spliteMyMarklist }" var="p" varStatus="status">
            <tr>

                <td class="article-title">${status.count }</td>
                <td><a href="/ProductInfoServlet?pid=${p.ticketInfo.ID}&cid=${p.ticketInfo.typeBID}&currentPage=1&typeID=null">${p.bname }</a></td>
                <td class="hidden-sm"><input  class="form-control" readonly type="date" name="marktime"  value="${p.marktime }"/> </td>
                <td class="hidden-sm">
                                 <textarea class="form-control" readonly>${p.comment }
                                 </textarea>

                </td>

                <td> <a rel="${p.mid }">删除</a></td>


            </tr>
        </c:forEach>






        </tbody>
    </table>
</div>








<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
    <ul class="pagination" style="text-align: center; margin-top: 10px;">

        <!-- 上一页 -->
        <c:if test="${curPage==1 }">
            <li class="disabled">
                <a href="javascript:void(0);" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:if test="${curPage!=1 }">
            <li>
                <a href="${pageContext.request.contextPath}/MyMarkServlet?curPage=${curPage-1 }" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>


        <!-- 显示每一页 -->
        <c:forEach begin="1" end="${totalPage }" var="page">
            <!-- 判断是否是当前页 -->
            <c:if test="${page==curPage}">
                <li class="active"><a href="javascript:void(0);">${page }</a></li>
            </c:if>
            <c:if test="${page!=curPage }">
                <li><a href="${pageContext.request.contextPath}/MyMarkServlet?curPage=${page }">${page }</a></li>
            </c:if>
        </c:forEach>


        <!-- 下一页 -->
        <c:if test="${curPage==totalPage }">
            <li class="disabled">
                <a href="javascript:void(0);" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
        <c:if test="${curPage!=totalPage }">
            <li>
                <a href="${pageContext.request.contextPath}/MyMarkServlet?curPage=${curPage+1 }" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>

    </ul>
</div>
<!-- 分页结束 -->








<script type="text/javascript">

    function fn1()
    {
        var itemname=$("input[name='check']:checked").val();
        if(itemname==null)
        {
            alert("请选择后进行投票!");
            return ;
        }
        $.post(
            "/Semester_Demo/AddClickVote",
            {"itemname":itemname,"vid":"${spliteVoteplist.vid }"},
            function(data)
            {

                if(data=="您已经投过票了!请勿重复投票!")
                {
                    alert(data);
                    location.reload();
                }
                else
                {
                    alert(data);
                    location.reload();
                }

            },
            "json"



        );
    }

</script>

<script>
    $(function() {
        $(".btn").click(function(){
            $(this).button('loading').delay(1000).queue(function() {
                $(this).button('reset');
                $(this).dequeue();
            });
        });
    });
</script>

<script>
    //是否确认删除
    $(function(){
        $("table tbody tr td a").click(function(){
            var name = $(this);
            var id = name.attr("rel"); //对应id
            if (event.srcElement.outerText == "删除")
            {
                if(window.confirm("此操作不可逆，是否确认？"))
                {
                    $.ajax({
                        type: "POST",
                        url: "/DeleteMark",
                        data: "mid=" + id,
                        cache: false, //不缓存此页面
                        success: function (data) {
                            alert(data);
                            window.location.href="/MyMarkServlet?curPage="+${curPage};
                        }
                    });
                };
            };
        });
    });
</script>
</body>
</html>