<%@page import="com.pcwk.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.pcwk.cmn.SearchVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/com/common.jsp" %>

<%
    // param
    SearchVO param = (SearchVO)request.getAttribute("param");
    out.println("param : " + param);
    
    // list
    List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
    if(list != null && list.size() > 0){
    	for(BoardVO vo : list){
//     		out.println(vo + "<br>");
    	}
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="<%=contPath %>/imgs/favicon.ico">

<!--reset 스타일 시트 -->
<!-- link rel="stylesheet" type="text/css" href="<%=contPath %>/asset/css/reset.css" -->
<link rel="stylesheet"  type="text/css" href="<%=contPath %>/asset/css/jquery-ui.css">

<!--스타일 시트 -->
<style type="text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-1.12.4.js"></script>
<!-- jQuery UI -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-ui.js"></script>
<style type="text/css">
	*{
	  margin: 0px;
	  padding: 0px;
	}
	table{
	  width: 600px;
	  border-collapse: collapse;
	}
	td,th{
	  border-bottom: 1px solid gray;
	  padding: 5px;
	}
	th{
	  background: gray;
	  color: white;
	}
	.txt_left{
	  text-align: left;
	}
	.txt_center{
	  text-align: center;
	}
	.txt_right{
	  text-align: right;
	}
</style>
<title>게시 목록</title>
</head>
<body>
	<h2>게시 목록</h2>
	<hr/>
	<div>
	   <div>
	     <input type="button" value="조회" onclick="doRetrieve();">
	     <input type="button" value="등록" id="moveToReg">
	   </div>
	   <form action="<%=contPath %>/board/board.do" name="boardListFrm" id="boardListFrm" method="get">
	     <input type="hidden" name="work_div" id="work_div">
	     <div>
	       <label>구분</label>
	       <select name="searchDiv" id="searchDiv">
	         <option value="">전체</option>
	         <option value="10" <% if(param != null && param.getSearchDiv().equals("10")){out.print("selected");} %>>순번</option>
	         <option value="20" <% if(param != null && param.getSearchDiv().equals("20")){out.print("selected");} %>>제목</option>
	         <option value="30" <% if(param != null && param.getSearchDiv().equals("30")){out.print("selected");} %>>내용</option>
	         <option value="40" <% if(param != null && param.getSearchDiv().equals("40")){out.print("selected");} %>>제목+내용</option>
	       </select>
	       <input type="text" name="searchWord" id="searchWord" size="15" value="<% if(param != null){out.print(param.getSearchWord());} %>">
	       <select name="pageSize" id="pageSize">
	         <option value="10" <% if(param != null && param.getPageSize() == 10){out.print("selected");} %>>10</option>
	         <option value="20" <% if(param != null && param.getPageSize() == 20){out.print("selected");} %>>20</option>
	         <option value="50" <% if(param != null && param.getPageSize() == 50){out.print("selected");} %>>50</option>
	         <option value="100"<% if(param != null && param.getPageSize() == 100){out.print("selected");} %>>100</option>
	       </select>
	     </div>	   
	   </form>
	</div>
	
  <table>
    <thead>
      <tr>
      <th width="80">No.</th>
      <th width="200">제목</th>
      <th width="80">조회수</th>
      <th width="100">등록자</th>
      <th width="80">등록일</th>
      <th width="80" style="display: none;">SEQ</th>
      </tr>
    </thead>
    <tbody>
    <%
    if(list != null && list.size() > 0){
        for(BoardVO vo : list){
    %>
      <tr>
        <td class="txt_center"><%=vo.getNo() %></td>
        <td><%=vo.getTitle() %></td>
        <td class="txt_right"><%=vo.getReadCnt() %></td>
        <td><%=vo.getModId() %></td>
        <td class="txt_center"><%=vo.getModDt() %></td>
        <td style="display: none;"><%=vo.getSeq() %></td>
      </tr>
    <%
      } // for
    }else{
    %>
      <tr>
        <td colspan="99">No data found</td>
      </tr>
    <%
    }
    %>
    </tbody>
  </table>
<script type="text/javascript">
    function doRetrieve(){
    	// alert("doRetrieve()");
    	// javascript form submit()
    	// document.boardListFrm
    	let frm = document.getElementById('boardListFrm');
    	frm.work_div.value = 'doRetrieve';
    	console.log("frm.work_div.value : " + frm.work_div.value);
    	console.log("frm.searchDiv.value : " + frm.searchDiv.value);
    	console.log("frm.pageSize.value : " + frm.pageSize.value);
    	
    	// form submit()
    	frm.submit();
    }
    
    $('#moveToReg').on('click', function(){
    	console.log("moveToReg");
    	let frm = document.boardListFrm;
    	frm.work_div.value = 'moveToReg';
    	console.log("frm.work_div.value : " + frm.work_div.value);
    	frm.submit();
    });

</script>
</body>
</html>