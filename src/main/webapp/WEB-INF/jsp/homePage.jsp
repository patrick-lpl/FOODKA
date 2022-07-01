<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="author" content="">
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>>
    <title>火锅店会员管理系统</title>

    <link href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.css">
    <!-- Custom styles for this template -->
    <link href="${APP_PATH }/static/css/dashboard.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.6.0.js"></script>
    <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.js"></script>

</head>

<body>

<jsp:include page="navbar.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <h2 style="text-align: center">
                火锅店会员管理系统,欢迎您
            </h2>

        </div>
    </div>
</div>



</body>

</html>
