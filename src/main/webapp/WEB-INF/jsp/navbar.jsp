<%@ page contentType="text/html; charset=utf-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">火锅店会员管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:void(0)">${loginUser.username},欢迎您</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
            </ul>
        </div>
        <div>

        </div>
    </div>
</nav>