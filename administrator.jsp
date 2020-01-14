<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>administrator page</title>


<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">


<section id="call-to-action" class="wow fadeIn">
	<div class="container text-center">
		<h3>하루한알</h3>
		<p>관리자 페이지</p>

		<a class="cta-btn" href="administrator.jsp">HOME</a>
	</div>
</section>
<!-- #call-to-action -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<title>health functional food recommend</title>
	<section id="home">
		<div class="container">
               <div class="section-header">
               <br>
                  <h3>카테고리 관리</h3>
               </div>
               
               <div class="form">
                  <div id="errormessage"></div>

                  <form method="post"  action="categoryDB.jsp">
                     <div class="form-group">
                        <div class="form-group">
                        
                           <input type="text" name="menuname" class="form-control" id="menuname"
                              placeholder="카테고리명" data-rule="minlen:4"
                              data-msg="Please enter at least  8 chars of subject" />
                           <div class="validation"></div>
                        </div>

                     </div>
                     
                     <div class="text-center">
                        <button class="btn btn-success" type="submit" >추가</button>
                     </div>
      
                     
                  </form>
               </div>
               <Br>
                <div class="form">
                  <div id="errormessage"></div>

                  <form method="post" action="deleteDB.jsp">
                        <div class="form-group">
                        
                           <input type="text"  name="menuname" class="form-control" id="menuname"
                              placeholder="카테고리명" data-rule="minlen:4"
                              data-msg="Please enter at least  8 chars of subject" />
                           <div class="validation"></div>
                        </div>

                     </div>
                     
                     <div class="text-center">
                        <button class="btn btn-success" type="submit" >삭제</button>
                     </div>
                     
                  </form>
               </div>
               
               
                <div class="section-header">
                  <h3>현재 카테고리 목록</h3>
               </div>
               
<div class="container">
<table class="table table-bordered">


<tr>
	<td>#카테고리명</td>
</tr>

<% 
request.setCharacterEncoding("UTF-8");

Connection conn = null;

PreparedStatement pstmt = null; 
ResultSet rs = null; 


try{
	
	Class.forName("com.mysql.jdbc.Driver");

	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");
	
	String qu="select menuname from menu";
	
	pstmt=conn.prepareStatement(qu);
	rs = pstmt.executeQuery();
	out.println("<BR>");
	while(rs.next()){
%>

		<tr>
		<td><%= rs.getString("menuname") %></td>
		</tr>
<%
	}
} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
</table>
</div>


<div class="container">
<div class="section-header">
                  <h3>사용자 문의사항</h3>
               </div>

<table class="table table-striped">
<tr>
	<td>#제품명</td>
	<td>#브랜드명</td>
	<td>#제품정보</td>
</tr>
<% 
request.setCharacterEncoding("UTF-8");


try{
	
	Class.forName("com.mysql.jdbc.Driver");

	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");
	
	String qu="select * from QA";
	
	pstmt=conn.prepareStatement(qu);
	rs = pstmt.executeQuery();
	out.println("<BR>");
	while(rs.next()){
%>
		<tr>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("brand") %></td>
		<td><%= rs.getString("message") %></td>
		</tr>
<%
	}
} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
</table>
</div>

<div class="container">
               <div class="section-header">
                  <h3>제품등록</h3>
               </div>
               <div class="form">
                  <div id="errormessage"></div>

                  <form method="post" action="administratorDB.jsp">
                     <div class="form-row">
                        <div class="form-group">
               
                           <input type="text" name="name" class="form-control" id="name"
                              placeholder="제품명" data-rule="minlen:4"
                              data-msg="Please enter at least  8 chars of subject" />
                           <div class="validation"></div>
                        </div>

                     </div>
                  
                     <div class="form-group">
                        <input type="text" name="info" class="form-control" id="info"
                           placeholder="제품 정보" data-rule="minlen:4"
                           data-msg="Please enter at least 8 chars of subject" />
                        <div class="validation"></div>
                     </div> 
                     
                     <div class="text-center">
                        <button class="btn btn-success" type="submit">추가</button>
                     </div>
                  </form>
               </div>

            </div>
         
         <br>
 <div class="container">
 <div class="section-header">
          <h3>제품 목록</h3>
       </div>

<table class="table table-bordered">
<tr>
	<td>제품명</td>
	<td>제품 정보</td>
</tr>
<% 
request.setCharacterEncoding("UTF-8");


try{
	
	Class.forName("com.mysql.jdbc.Driver");

	String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
	conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");
	
	String qu="select * from pill";
	
	pstmt=conn.prepareStatement(qu);
	rs = pstmt.executeQuery();
	out.println("<BR>");
	while(rs.next()){
%>
		<tr>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("information") %></td>
		</tr>
<%
	}
} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
</table>
         
            
</div>
</body>
</html>