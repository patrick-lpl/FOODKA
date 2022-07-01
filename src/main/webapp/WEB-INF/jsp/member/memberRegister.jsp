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
    <title>火锅店会员管理系统</title>

    <link href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/signin.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.6.0.js"></script>
  </head>

  <style>
    html {
      width: 100%;
      height: 100%;
    }
    body {
      width: 100%;
      background: #fff url("../../../static/img/login_bg.webp") no-repeat;
      background-size: 100% 100%;
    }
    .container{
      background-color: #FFFFFF;
      width: 450px;
      border-radius: 25px;
      padding: 10px;
    }
  </style>
  <body>

    <div class="container">

      <h2 class="form-signin-heading text-center">火锅店会员管理系统 <span style="font-size: 16px;">| 会员注册</span></h2>
      <form class="form-signin" style="max-width: 360px;margin:0 auto">

        <label for="phone" class="sr-only">手机号码</label>
        <input type="text" id="phone" class="form-control" placeholder="手机号码" required autofocus>
        <br>
        <label for="phone" class="sr-only">会员名称</label>
        <input type="text" id="msName" class="form-control" placeholder="会员名称" required autofocus>
        <br>
        <label for="password" class="sr-only">密码</label>
        <input type="password" id="password" class="form-control" placeholder="密码" required>
        <br>
        <label for="age" class="sr-only">年龄</label>
        <input type="number" id="age" class="form-control" placeholder="年龄" required>
        <br>
        <label for="age" class="sr-only">性别</label>
        <label for="sex"></label><select name="carlist" id="sex" class="form-control" required>
          <option value="">请选择性别</option>
          <option value="男">男</option>
          <option value="女">女</option>
        </select>
        <br>
        <button id="registerBtn" class="btn btn-lg btn-primary btn-block" style="margin-top: 15px;" type="submit">注册</button>
        <a id="toLogin" href="javascript:void(0)" class="btn btn-lg btn-default btn-block" style="margin-top: 15px;">返回登录</a>
      </form>
    </div>
  </body>

<script>

  $("#toLogin").click(function (){
    location.href = "${pageContext.request.contextPath}/member/toMemberLogin?t="+new Date().getTime();
  })

  $("#registerBtn").click(function (){
    if ($("#msName").val() == '会员名称不能为空') {
      alert("")
    }
    if ($("#phone").val() == '手机号码不能为空') {
      alert("")
    }
    if ($("#password").val() == '密码不能为空') {
      alert("")
    }
    let data = {
      msName:$("#msName").val(),
      phone:$("#phone").val(),
      age:$("#age").val(),
      password:$("#password").val(),
      sex:$("#sex").val(),
    }
    $.ajax({
      type: "POST",
      url: "${pageContext.request.contextPath}/member/memberRegister",
      data: data,
      dataType: "json",
      success: function(data){
        if (data.code == '500') {
          alert(data.msg)
        }else {
          alert("注册成功！！！！")
          setTimeout(function (){
            location.href = "${pageContext.request.contextPath}/member/toMemberLogin?t="+new Date().getTime();
          },300)
        }
      }
    });
    return false;
  })

</script>
</html>
