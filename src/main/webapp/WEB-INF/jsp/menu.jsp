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
            <li <c:if test="${page == 'member'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/member/toList">会员管理</a></li>
            <li <c:if test="${page == 'memberCard'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">会员卡管理</a></li>
            <li <c:if test="${page == 'cardLog'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">卡日志查询</a></li>
            <li <c:if test="${page == 'order'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">订单管理</a></li>
            <li <c:if test="${page == 'pointExchangeDef'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">积分兑换配置</a></li>
            <li <c:if test="${page == 'pointExchange'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">积分兑换记录</a></li>
            <li <c:if test="${page == 'pointDef'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">积分配置</a></li>
            <li <c:if test="${page == 'pointLog'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">积分日志查询</a></li>
            <li <c:if test="${page == 'statistics'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">数据统计</a></li>
            <li <c:if test="${page == 'user'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/user/toList">用户管理</a></li>
            <li <c:if test="${page == 'info'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/admin/toList">个人信息</a></li>
            <li <c:if test="${page == 'toRepwd'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toRepwd">修改密码</a></li>
        </c:if>
        <c:if test="${loginUser.userType == 'user'}">
            <li <c:if test="${page == 'homePage'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">我的主页</a></li>
            <li <c:if test="${page == 'myMemberCard'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/member/toMyMemberCard">我的会员卡</a></li>
            <li <c:if test="${page == 'myPointExchangeDef'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">积分兑换</a></li>
            <li <c:if test="${page == 'myPointExchange'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">我的积分兑换</a></li>
            <li <c:if test="${page == 'myOrder'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">我的消费订单</a></li>
            <li <c:if test="${page == 'myCardLog'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">我的会员卡日志</a></li>
            <li <c:if test="${page == 'myPointLog'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/toHomePage">我的积分变动</a></li>
            <li <c:if test="${page == 'myInfo'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/member/toMyInfo">我的会员信息</a></li>
            <li <c:if test="${page == 'myRePassword'}"> class="active" </c:if> ><a href="${pageContext.request.contextPath}/member/toMyRePassword">修改密码</a></li>
        </c:if>
    </ul>
</div>