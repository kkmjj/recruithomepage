<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@page import="user.userDTO" %>
<%@page import="user.userDAO" %>

<%@page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	if(request.getParameter("id")!=null)
	{
		userID=request.getParameter("id");
	}
	if(request.getParameter("password")!=null)
	{
		userPassword=request.getParameter("password");
	}
	if(userID==""|| userPassword==""){
	
		PrintWriter script = response.getWriter();
		System.out.println(userID);
		script.println("<script>");
		script.println("alert('입력이 안됐습니다dfdfd');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		
	}
	
	userDAO userDAO = new userDAO();
	
	
	int result = userDAO.login(userID,userPassword);
	
	if(result==-1)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안됐습니다'); ");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result==0)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비번이 틀렸습니다'); ");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result==1)
	{
		session.setAttribute("userID", userID);	//session 값  넣기 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인중'); ");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	
	

		
%>