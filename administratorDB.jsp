<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
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
		<h3>제품 추가 완료.</h3>

		<a class="cta-btn" href="administrator.jsp">HOME</a>
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
String info =request.getParameter("information");

String Query="INSERT INTO pill VALUES(?,?)";
pstmt=conn.prepareStatement(Query);

pstmt.setString(1,name);
pstmt.setString(2,info);

pstmt.executeUpdate();

}catch (SQLException e){
	out.print(e);
	
}finally{
	pstmt.close();
	conn.close();
}
%>