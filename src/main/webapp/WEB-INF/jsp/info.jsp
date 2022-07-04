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
    <title>FOODKA管理系统</title>

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
            <table id="table"></table>
        </div>
      </div>
    </div>


    <div class="modal fade" id="empModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" style="width: 600px;">
        <div class="modal-content" style="margin-top: 200px;width: 100%;text-align: left;">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
              &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
            </h4>
          </div>
          <div class="modal-body">
            <form role="form">
              <div class="form-group">
                <label for="name">真实姓名</label>
                <input type="text" class="form-control" id="name" placeholder="请输入真实姓名">
                <input type="hidden" class="form-control" id="id">
              </div>
              <div class="form-group">
                <label for="username">用户名</label>
                <input type="text" class="form-control" id="username" placeholder="请输入用户名">
              </div>
              <div class="form-group">
                <label for="phone">手机号码</label>
                <input type="text" class="form-control" id="phone" placeholder="请输入手机号码">
              </div>

              <div class="form-group">
                <label for="email">邮箱</label>
                <input type="text" class="form-control" id="email" placeholder="请输入邮箱">
              </div>

              <div class="form-group">
                <label for="img">头像</label>
                <img style="height: 80px;width: 80px;" id="img" src="" class="img-circle">
                <input class="replyFileid" type="file" id="abc">

              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
            </button>
            <button id="saveBtn" type="button" class="btn btn-primary">
              保存
            </button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal -->
    </div>

  </body>
  <script>


    $("#abc").change(function(e) {
      var imgBox = e.target;
      uploadImg($('#img'), imgBox)
    });

    function uploadImg(element, tag) {
      var file = tag.files[0];
      var imgSrc;
      if (!/image\/\w+/.test(file.type)) {
        alert("看清楚，这个需要图片！");
        return false;
      }
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        console.log(this.result);
        imgSrc = this.result;
        $("#img").attr("src", imgSrc);
      };
    }
    // 表格行内操作按钮
    function addOperateBtnList() {
      return [
        '<button id="edit" type="button" class="btn btn-default">编辑</button>',
      ].join('');
    }

    // 表格行内事件处理
    window.operateEvents = {
      'click #edit': function (e, value, row) {
        $("#myModalLabel").html("修改信息");
        $("#username").val(row.username);
        $("#email").val(row.email);
        $("#name").val(row.name);
        $("#phone").val(row.phone);
        $("#img").attr('src',row.img);
        $("#id").val(row.id);
        $("#empModal").modal('show')
      }
    };

    // 导航操作
    $(".nav-to-list").click(function (){
      let to = $(this).attr("to");
      location.href = to;
    })



    // 提交保存
    $("#saveBtn").click(function (){
      let data = {
        id:$("#id").val(),
        username:$("#username").val(),
        email:$("#email").val(),
        name:$("#name").val(),
        phone:$("#phone").val(),
        img:  $("#img").attr('src')
      }
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/admin/save",
        data: data,
        dataType: "json",
        success: function(data){
          if (data.code == '500') {
            alert(data.msg)
          }else {
            $("#empModal").modal('hide')
            alert("操作成功!")
            setTimeout(function () {
              $('#table').bootstrapTable('refresh');
            },200)
          }
        }
      });
    })

    // 表格渲染
    $('#table').bootstrapTable({
      url: '${pageContext.request.contextPath}/admin/list',
      pagination: true,
      sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
      pageNumber: 1,                       //初始化加载第一页，默认第一页
      pageSize: 10,                       //每页的记录行数（*）
      pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
      columns: [{
        field: 'SerialNumber',
        title: '序号',
        formatter: function (value, row, index) {
          return index+1;
        }
      },{
        field: 'photo',
        title: '头像',
        formatter:function(value, item, index){
          if(item.img && item.img != '') {
            return '<img  style="width: 80px;width: 80px"  src="'+item.img+'">'
          }
          return ''
        }
      },{
        field: 'username',
        title: '用户名'
      }, {
        field: 'adminName',
        title: '真实姓名'
      },  {
        field: 'adminPhone',
        title: '手机号码'
      },  {
        field: 'adminEmail',
        title: '邮箱'
      },{
        field: 'operate',
        title: '操作',
        events: operateEvents,//给按钮注册事件
        formatter: addOperateBtnList//表格中增加按钮
      }],
      data: []
    })
  </script>
</html>
