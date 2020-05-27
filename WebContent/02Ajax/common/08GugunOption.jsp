<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--08GugunOption.jsp --%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");//한글처리

String sido = request.getParameter("sido");//입력한 sido를 파라미터로 받음
ZipcodeDAO dao = new ZipcodeDAO();

ArrayList<String> gugunList = dao.getGugun(sido);//sido를 파라미터로 전달

JSONArray jsonArr = new JSONArray();//DAO에서 반환된 결과를 JSON 배열로 만들기 위한 객체생성
for(String gu : gugunList){
	jsonArr.add(gu);
}

out.println(jsonArr.toString());//JSON배열을 화면상에 출력
%>