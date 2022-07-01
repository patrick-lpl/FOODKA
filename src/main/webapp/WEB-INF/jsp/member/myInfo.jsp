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

    <jsp:include page="../navbar.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <jsp:include page="../menu.jsp"></jsp:include>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <form class="form-inline" role="form" style="margin-bottom: 10px;padding: 10px 5px;">
            <div class="form-group">
              <input type="text" class="form-control" id="msNameQuery" placeholder="请输入会员名">
            </div>
            <button type="submit" id="queryBtn" class="btn btn-default">查询</button>
          </form>
          <table id="table"></table>
        </div>

      </div>
    </div>

  </body>
  <script>

    $("#queryBtn").click(function (){
      $('#table').bootstrapTable('refresh');
      return false;
    })

    // 导航操作
    $(".nav-to-list").click(function (){
      let to = $(this).attr("to");
      location.href = to;
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
      },{
        field: 'point',
        title: '积分'
      },{
        field: 'cardFlag',
        title: '是否开卡',
        formatter:function (cardFlag){
          return cardFlag == 'Y'? '是':'否'
        }
      },  {
        field: 'createTime',
        title: '注册时间'
      }],
      data: []
    })


  </script>
</html>
