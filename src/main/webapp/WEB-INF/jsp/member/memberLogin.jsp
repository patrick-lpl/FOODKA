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
    <title>火锅店会员管理系统——会员</title>

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
    .box {
      width: 370px;
      height: 130px;
      margin: 10px auto;

    }

    .box #myCanvas {
      margin-top: 10px;
      cursor: pointer;
      height: 70px;

    }

    .btn {
      margin: 10px auto;
    }

    /* 	.block_box{
            width: 90px;
            height: 10px;
            float: left;
            border: 1px #67B168;

        } */

    .container{
      background-color: #FFFFFF;
      width: 450px;
      border-radius: 25px;

    }
  </style>
  <body>

  <h1 class="form-signin-heading text-center"style="font-weight: bolder; font-family:YouYuan"><font color="#0b0b0b" size="7">火锅店管理系统</font><span style="font-size: 16px;" style="font-weight: bolder; font-family:YouYuan">| 会员登录</span></h1>
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

        <input type="text" id="input" placeholder="请输入验证码 " style="margin-top: 30px;" class="form-control" required>


        <!-- <div class="block_box">
        </div> -->

        <canvas id="myCanvas" width="100" height="40" title="看不清，更换验证码" ></canvas>

        <!-- <br /> -->
<%--        <button  class="btn  btn-primary " style="float: right; margin-top: 30px; margin-right: 30px;" type="submit" >我不是机器人</button>--%>


        <button id="loginBtn" class="btn btn-lg btn-primary btn-block" style="margin-top: 50px;" type="submit">登录</button>
      </div>



<%--      <button id="loginBtn" class="btn btn-lg btn-primary btn-block" style="margin-top: 50px;" type="submit">登录</button>--%>

    </form>

  </div>
  </body>

<script>
  var a ;
  class Verification {
    constructor() {
      // 获取需要的dom元素
      this.input = document.querySelector('#input')
      this.btn = document.querySelector('.btn')
      this.canvas = document.getElementById('myCanvas')
      this.ctx = this.canvas.getContext('2d')
      // 获取画布的宽高
      this.width = this.canvas.width
      this.height = this.canvas.height

      // 存验证码
      this.code = ''
      // 将0-9 a-Z放进数组
      this.charArr = this.getCharArr()  // 0-9 a-Z
      // 绑定对应的事件
      this.canvas.addEventListener('click', () => this.init())
      this.btn.addEventListener('click', () => this.check())
      this.input.addEventListener('keydown', (e) => {
        // enter键的键号是13，监听enter，用来提交验证码
        if (e.keyCode === 13) {
          this.check()
        }
      })
      this.init()
    }
    // 初始化验证码功能
    init() {
      this.clear() // 清除画布
      this.drawText() // 画验证码
      this.drawLine() // 画干扰线
      this.drawDot() // 画干扰点
    }
    // 检测验证码是否符合
    check() {
      if (this.code === this.input.value.trim().toLowerCase()) {
        alert('提交成功！')
        a='T'
      } else {
        alert('没长眼睛？')
        this.input.value = ''
        this.init()
        a= 'F'
      }
    }
    // 获取0-9和a-Z所有的字符
    getCharArr() {
      let charArr = []
      for (let i = 0; i < 10; i++) {
        charArr.push(i)
      }
      for (let i = 65; i < 123; i++) {
        // ascall码91到96是其他符号，去掉
        if (i < 91 || i > 96) {
          charArr.push(String.fromCharCode(i))
        }
      }
      return charArr
    }
    // 清空画布
    clear() {
      this.ctx.clearRect(0, 0, this.width, this.height)
    }
    // 画验证码
    drawText() {
      const length = this.charArr.length
      this.ctx.font = 'bold 25px 宋体'
      this.code = ''
      for (let i = 0; i < 4; i++) {  // 4个字符的验证码
        this.ctx.beginPath()
        let index = Math.floor(Math.random() * length)  // 随机下标
        this.code += this.charArr[index].toString().toLowerCase() // 以小写的形式存储起来
        let x = i * 20 + 15  // 设置x的坐标
        let y = 24 + Math.random() * 5  // 设置y的坐标
        let angle = Math.random() * - 0.5  // 设置旋转的角度，pi是3.14。这里取-0.5到0.5
        this.ctx.translate(x, y)  // 更换中心，即旋转的中心，也是画布的原点
        this.ctx.rotate(angle) // 旋转画布
        this.ctx.fillStyle = this.getRandomColor()
        this.ctx.fillText(this.charArr[index], 0, 0) //
        this.ctx.rotate(-angle) // 把画布旋转回去
        this.ctx.translate(-x, -y) // 把原点移回去
      }
    }
    // 画干扰线
    drawLine() {
      for (let i = 0; i < 4; i++) {
        this.ctx.beginPath()
        this.ctx.moveTo(Math.random() * this.width, Math.random() * this.height)
        this.ctx.lineTo(Math.random() * this.width, Math.random() * this.height)
        this.ctx.strokeStyle = this.getRandomColor()
        this.ctx.stroke()
      }
    }
    // 画干扰点
    drawDot() {
      for (let i = 0; i < 20; i++) {
        this.ctx.beginPath()
        this.ctx.arc(Math.random() * this.width, Math.random() * this.height, 1, 0, 2 * Math.PI)
        this.ctx.fillStyle = this.getRandomColor()
        this.ctx.fill()
      }
    }
    // 获取随机颜色
    getRandomColor() {
      let r = Math.floor(Math.random() * 256)
      let g = Math.floor(Math.random() * 256)
      let b = Math.floor(Math.random() * 256)
      return `rgb(${r},${g},${b})`
    }
  }
  // 实例化验证码功能
 new Verification()


  $("#toRegister").click(function (){
    location.href = "${pageContext.request.contextPath}/member/toMemberRegister?t="+new Date().getTime();
  })

  $("#loginBtn").click(function (){
    let data = {
      username:$("#username").val(),
      password:$("#password").val()
    }
    $.ajax({
      type: "POST",
      url: "${pageContext.request.contextPath}/member/memberLogin",
      data: data,
      dataType: "json",
      success: function(data){
        if (data.code == '500'||a=='F') {
          // alert(data.msg)
        }else {
          location.href = "${pageContext.request.contextPath}/toMain"
        }
      }
    });
    return false;
  })


</script>
</html>
