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
    %>
    <title>火锅店会员管理系统</title>

    <link href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.css">
    <!-- Custom styles for this template -->
    <link href="${APP_PATH }/static/css/dashboard.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.6.0.js"></script>
    <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
  </head>



  <style>
    .replyFileid{
      max-width:300px;
      overflow: hidden;
      filter:alpha(opacity=0);
      -moz-opacity:0;
      -khtml-opacity: 0;
      cursor: pointer;
    }
  </style>
  <body>

    <jsp:include page="navbar.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <jsp:include page="menu.jsp"></jsp:include>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<%--          <div class="text-right clearfix" style="margin-top: 10px;">--%>
<%--<c:if test="${loginUser.userType == 'admin'}">--%>
<%--            <button type="button" id="addBtn" class="btn btn-primary">新增</button>--%>
<%--            <button type="button" id="delBtn" class="btn btn-primary">删除</button>--%>
<%--</c:if>--%>
<%--          </div>--%>


          <form class="form-inline" role="form" style="margin-bottom: 10px;padding: 10px 5px;">
            <div class="form-group">
              <input type="text" class="form-control" id="msNameQuery" placeholder="请输入会员名">
            </div>
            <button type="submit" id="queryBtn" class="btn btn-default">查询</button>
            <c:if test="${loginUser.userType == 'admin'}">
              <button type="button" id="addBtn" class="btn btn-primary">新增</button>
              <button type="button" id="delBtn" class="btn btn-primary">删除</button>
            </c:if>
          </form>
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
                <label for="msName">会员名</label>
                <input type="text" class="form-control" id="msName" placeholder="请输入会员名">
                <input type="hidden" class="form-control" id="id">
              </div>
              <div class="form-group">
                <label for="sex">性别</label>
                <select name="carlist" id="sex"  class="form-control" required>
                  <option value="">请选择性别</option>
                  <option value="男">男</option>
                  <option value="女">女</option>
                </select>
              </div>
              <div class="form-group">
                <label for="age">年龄</label>
                <input type="text" class="form-control" id="age" placeholder="请输入年龄">
              </div>
              <div class="form-group">
                <label for="phone">联系方式</label>
                <input type="text" class="form-control" id="phone" placeholder="请输入联系方式">
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
    // 删除逻辑
    function deleteEmp(id) {
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/member/delete",
        data: {ids:id},
        dataType: "json",
        success: function(data){
          if (data.code == '500') {
            alert(data.msg)
          }else {
            alert("删除成功!")
            setTimeout(function () {
              $('#table').bootstrapTable('refresh');
            },200)
          }
        }
      });
    }

    // 表格行内操作按钮
    function addOperateBtnList(value,row) {
      console.log(value);
      console.log(row);
      let  oper = [
        '<button id="view" type="button" class="btn btn-default">查看</button>',
        <c:if test="${loginUser.userType == 'admin'}">
        '<button id="edit" type="button" class="btn btn-default">编辑</button>',
        '<button id="delete" type="button" class="btn btn-default">删除</button>',
        </c:if>
      ]
      <c:if test="${loginUser.userType == 'admin'}">
            if(row.cardFlag == 'N') {
              oper.push('<button id="opencard" type="button" class="btn btn-default">开卡</button>')
            }
      </c:if>
      return oper.join('');
    }

    $("#queryBtn").click(function (){
      $('#table').bootstrapTable('refresh');
      return false;
    })

    // 表格行内事件处理
    window.operateEvents = {
      'click #view': function (e, value, row) {
        $("#myModalLabel").html("查看会员信息");
        $("#id").val(row.id);
        $("#msName").val(row.msName);
        $("#sex").val(row.sex);
        $("#age").val(row.age);
        $("#phone").val(row.phone);
        $('.modal-body input[type="text"]').attr("readonly","readonly")
        $("select").attr("readonly","readonly")
        $(".modal-footer").hide()
        $("#empModal").modal('show')
      },
      'click #edit': function (e, value, row) {
        $("#myModalLabel").html("编辑会员信息");
        $("#id").val(row.id);
        $("#msName").val(row.msName);
        $("#sex").val(row.sex);
        $("#age").val(row.age);
        $("#phone").val(row.phone);
        $('input[type="text"]').removeAttr("readonly")
        $("select").removeAttr("readonly")
        $(".modal-footer").show()
        $("#empModal").modal('show')
      },
      'click #opencard': function (e, value, row) {
        $.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath}/memberCard/save",
          data: {
            msId:row.id
          },
          dataType: "json",
          success: function(data){
            if (data.code == '500') {
              alert(data.msg)
            }else {
              $("#empModal").modal('hide')
              alert("开卡成功！ 请在会员卡管理进行充值")
              setTimeout(function () {
                $('#table').bootstrapTable('refresh');
              },200)
            }
          }
        });
      },
      'click #delete': function (e, value, row) {
        deleteEmp(row.id)
      }
    };

    // 添加按钮操作
    $("#addBtn").click(function (){
      $("#myModalLabel").html("新增会员信息");
      $("#id").val('');
      $("#msName").val('');
      $("#sex").val('');
      $("#age").val('');
      $("#phone").val('');
      $('input[type="text"]').removeAttr("readonly")
      $("select").removeAttr("readonly")
      $(".modal-footer").show()
      $("#empModal").modal('show')
    })

    // 导航操作
    $(".nav-to-list").click(function (){
      let to = $(this).attr("to");
      location.href = to;
    })

    // 批量删除
    $("#delBtn").click(function (){
      let selectArr = $('#table').bootstrapTable('getSelections');
      if (!selectArr || selectArr.length == 0) {
        alert("请选择需要删除的数据");
        return ;
      }
      let empIdArr = [];
      for (let i = 0; i < selectArr.length; i ++ ){
        empIdArr.push(selectArr[i].id)
      }
      deleteEmp(empIdArr.join(","))
    })

    // 提交保存
    $("#saveBtn").click(function (){
      let data = {
        id:$("#id").val(),
        msName:$("#msName").val(),
        sex:$("#sex").val(),
        age:$("#age").val(),
        phone:$("#phone").val()
      }
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/member/save",
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
      url: '${pageContext.request.contextPath}/member/list',
      pagination: true,
      sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
      pageNumber: 1,                       //初始化加载第一页，默认第一页
      pageSize: 10,                       //每页的记录行数（*）
      pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
      //得到查询的参数
      queryParams: function (params) {
        let msNameQuery= $("#msNameQuery").val();
        msNameQuery = !msNameQuery? '':msNameQuery;
        params.msName = msNameQuery;
        return params;
      },
      columns: [{
        field : 'checked',
        checkbox: true,
        align: 'center',
        valign: 'middle',
      },{
        field: 'SerialNumber',
        title: '序号',
        formatter: function (value, row, index) {
          return index+1;
        }
      }, {
        field: 'msName',
        title: '会员名称'
      },  {
        field: 'age',
        title: '年龄'
      },  {
        field: 'sex',
        title: '性别'
      },  {
        field: 'phone',
        title: '联系方式'
      }, {
        field: 'createTime',
        title: '注册时间'
      }, {
        field: 'operate',
        title: '操作',
        events: operateEvents,//给按钮注册事件
        formatter: addOperateBtnList//表格中增加按钮
      }],
      data: []
    })


  </script>
</html>
