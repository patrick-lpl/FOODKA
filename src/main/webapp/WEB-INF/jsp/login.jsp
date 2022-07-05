<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%
      pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>>
    <title>FOODKA会员管理系统</title>

    <link href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/signin.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.6.0.js"></script>
  </head>

<%--管理员登录--%>

  <style>
    html {
      width: 100%;
      height: 100%;
    }
    body {
      width: 100%;
      background: #fff url("../../static/img/login_bg.webp") no-repeat;
      background-size: 100% 100%;
    }
    .box {
      width: 370px;
      height: 130px;
      margin: 10px auto;

    }
    .btn {
      margin: 10px auto;
    }
    .container{
      background-color: #FFFFFF;
      width: 450px;
      border-radius: 25px;

    }
  </style>
  <body>

  <h1 class="form-signin-heading text-center"style="font-weight: bolder; font-family:YouYuan"><font color="#0b0b0b" size="7">FOODKA管理系统</font><span style="font-size: 16px;" style="font-weight: bolder; font-family:YouYuan">| 管理员登录</span></h1>
  <div class="container">

    <form class="form-signin" style="max-width: 400px;margin:0 auto">

      <!-- <h2 class="form-signin-heading text-center"style="font-family:YouYuan"><font color="#0b0b0b" size="7">火锅店管理系统</font></h2> -->

      <br>

      <label for="username" class="sr-only">用户名</label>
      <input type="text" id="username" class="form-control"  style="margin-top: 50px;" placeholder="用户名" required autofocus>

      <br>

      <label for="password" class="sr-only">密码</label>
      <input type="password" id="password" class="form-control"  style="margin-top: 50px;" placeholder="密码" required>

      <br>

      <div class="box">
        <!-- <br /> -->
        <%--        <button  class="btn  btn-primary " style="float: right; margin-top: 30px; margin-right: 30px;" type="submit" >我不是机器人</button>--%>
        <button id="loginBtn" class="btn btn-lg btn-primary btn-block" style="margin-top: 50px;" type="submit">登录</button>
      </div>



      <%--      <button id="loginBtn" class="btn btn-lg btn-primary btn-block" style="margin-top: 50px;" type="submit">登录</button>--%>

    </form>

  </div>
  </body>

<script>

  $("#loginBtn").click(function (){
    let data = {
      username:$("#username").val(),
      password:$("#password").val()
    }
    $.ajax({
      type: "POST",
      url: "${pageContext.request.contextPath}/adminLogin",
      data: data,
      dataType: "json",
      success: function(data){
        if (data.code == '500') {
          alert(data.msg)
        }else {
          location.href = "${pageContext.request.contextPath}/toMain"
        }
      }
    });
    return false;
  })

</script>
</html>
