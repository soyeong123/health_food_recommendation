<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의사항</title>


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
		<h3>전송되었습니다.감사합니다.</h3>

		<a class="cta-btn" href="main.jsp">home으로 돌아가기</a>
	</div>
</section>
<!-- #call-to-action -->
<%
Connection conn=null;
PreparedStatement pstmt=null;


try{
String jdbcUrl="jdbc:mysql://localhost:3306/jspdb";
String jdbcId="jspuser";
String jdbcPw="jsppass";

Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);

String name =request.getParameter("name");
String brand =request.getParameter("brand");
String message =request.getParameter("message");

String Query="INSERT INTO QA VALUES(?,?,?)";
pstmt=conn.prepareStatement(Query);

pstmt.setString(1,name);
pstmt.setString(2,brand);
pstmt.setString(3,message);

pstmt.executeUpdate();

}catch (SQLException e){
	out.print(e);
	
}finally{
	pstmt.close();
	conn.close();
}
%>