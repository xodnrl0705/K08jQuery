<%@page import="org.json.simple.JSONObject"%>
<%@page import="controller.OracleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%-- 03PostLoginOracle.jsp --%>
<%
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

OracleDAO dao = new OracleDAO();
boolean isMember = dao.isMember(id,pw);
JSONObject json = new JSONObject();

if(isMember == true){
	json.put("result", 1);
	json.put("message", "로그인 성공입니다^^*");
	
	String html = "";
	html += "<table class='table table-bordered' style='width:300px;'>";
	html += "	<tr>";
	html += "		<td>회원님, 반갑습니다^^*</td>";
	html += "	</tr>";
	html += "</table>";
	
	json.put("html",html);
}
else{
	json.put("result",0);
	json.put("message", "로그인 실패입니다. ㅜㅜ;");
}
dao.close();
String jsonStr = json.toJSONString();
out.print(jsonStr);
%>