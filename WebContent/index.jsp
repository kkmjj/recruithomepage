<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="user.userDTO" %>
<%@page import="user.userDAO" %>

<%@page import="month.MonthDTO" %>
<%@page import="month.MonthDAO" %>

<%@page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>

<!-- 달력 사용  -->
<%@page import="java.util.Calendar" %>



<!doctype html>
<html lang="en">

<style>



#calendar {
    width: 60%; 
    height:60%;   
}

#calendar a {
    color: #8e352e;
    text-decoration: none;
}

#calendar ul {
    list-style: none;
    padding: 0;
    margin: 0;
    width: 100%;
}

#calendar li {
    display: block;
    float: left;
    width:14.342%;
 
    padding: 5px;
    box-sizing:border-box;
    border: 1px solid #ccc;
    margin-right: -1px;
    margin-bottom: 2px;
}

#calendar ul.weekdays {
    height: 40px;
    background: #8e352e;
}

#calendar ul.weekdays li {
    text-align: center;
    text-transform: uppercase;
    line-height: 20px;
    border: none !important;
    padding: 10px 6px;
    color: #fff;
    font-size: 13px;
    height: 80%;
}

#calendar .days{
	width:1200px;
}


#calendar .days li {
    height: 950px;
}

#calendar .days li:hover {
    background: #d3d3d3;
}

#calendar .date {
    text-align: center;
    margin-bottom: 5px;
    padding: 4px;
    
    color: #000;
    width: 20px;
    border-radius: 50%;
    float: right;
}


</style>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- 자바스크립트  -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


    <title>채용홈페이지</title>
  </head>
  
 
  
  
  
  

  <body>
  
<%

		// 달력 
		Calendar cal = Calendar.getInstance();
		int mon = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);
	
		int Max_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 해달의 총 날짜 
		
		 cal.set(Calendar.DATE, 1);
		
		int week = cal.get(Calendar.DAY_OF_WEEK); //그 주의 요일 반환 (일:1 ~ 토:7)
		
		// 함수 이용 
			
			
			//cal.set(cal.YEAR, year);
			//cal.set(cal.MONTH, month-1); //1월이 0부터 시작하므로 월에서 -1

			
		

		
		
		
	// 아이디 관련 	
	request.setCharacterEncoding("UTF-8");	
	String userID=null;
	
	if(session.getAttribute("userID")!=null)
	{	
		System.out.print("로그인됨");
		userID=(String)session.getAttribute("userID");
	}
	
  %>
	
    <nav class="navbar navbar-white bg-dark nav justify-content-end  " >
  	
    <%
    if(userID==null)
	{
		
	
	%>
	  	<form action="loginAction.jsp" >
	  		<input  id="id" name="id" type="text" style="width:150px;"> </input> 
	  		<input id="password"  name="password" type="password" style="width:150px"> </input>
	  		<button type="submit" id="login_btn" class="btn btn-dark my-2 my-sm-0"  >로그인</button>
	
	  	</form>
	  	
	<%
				}
	%>  
  	
	</nav>
	
					
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">채용사이트</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
 
 
 
 <div id="calendar-wrap">
            <header>
                <h1><%=mon+1  %></h1>
            </header>
            <div id="calendar">
                <ul class="weekdays">
                    <li>Sunday</li>
                    <li>Monday</li>
                    <li>Tuesday</li>
                    <li>Wednesday</li>
                    <li>Thursday</li>
                    <li>Friday</li>
                    <li>Saturday</li>
                </ul>
			<%
			
			ArrayList<String> result =new ArrayList<String>();
			
			int count=1; // 날짜
			 System.out.println(week);
				
			for(int j=0;j<Max_day/7+1;j++){
			%>
 			   <ul class="days">
 			   <% for(int i=1; i<8;i++){ 
 				  
 				   if(i+(j*7)!=week || i+(j*7) > Max_day){
 					 
 			   %>
                    <li class="day other-month">
                        <div class="date" id="one" >
                       
                        	
                   
                        </div>                      
                    </li>
                    
                    <%
                   	continue;
                    } 
 				   else if(i+(j*7)==week) // 1일 전에 요일은 생략 
                    {
 					   
 						result = new MonthDAO().show(i+(j*7));
                    %>
                     <li class="day other-month">
                        <div class="date" id="one" >
                    	<%=count %>
                        </div>
                        <%
                        count++;
                        for(int k=0;k<result.size();k++){  
                        	
                        %>
                       		
                        <div class="information">
                        <%=result.get(k) %>
                        </div>  
                       
                       <%} %>  
                                       
                    </li>
                     <%
                     week++; 
                    } %>
                     
                      <%} %>
                   </ul>
                   
            <%} %>
       </div><!-- /. calendar -->
        </div><!-- /. wrap -->
 
  </body> 
</html>