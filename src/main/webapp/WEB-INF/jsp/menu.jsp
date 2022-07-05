<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-3 col-md-2 sidebar">
    <style>
        #MenuPage{
            font-family: YouYuan;
            font-size: large;
        }
    </style>
    <ul id="MenuPage" class="nav nav-sidebar">

<%--只有前两行和最后一行是正确跳转链接的--%>
        <c:if test="${loginUser.userType == 'admin'}">
            <li <c:if test="${page == 'homePage'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">我的主页</a></li>
            <li <c:if test="${page == 'statistics'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">数据统计</a></li>
            <li <c:if test="${page == 'admin'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/user/toList">用户管理</a></li>
            <li <c:if test="${page == 'info'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/adminInfo/toList">管理员信息</a></li>
            <li <c:if test="${page == 'toRepwd'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toRepwd">修改密码</a></li>
        </c:if>
        <c:if test="${loginUser.userType == 'user'}">
            <li <c:if test="${page == 'homePage'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">我的主页</a></li>
            <li <c:if test="${page == 'myInfo'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/user/toMyInfo">我的会员信息</a></li>
            <li <c:if test="${page == 'myRePassword'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/user/toMyRePassword">修改密码</a></li>
        </c:if>
    </ul>
</div>