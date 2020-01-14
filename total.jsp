<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>검색결과</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

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
		<h3>전체 제품 보기</h3>

		<a class="cta-btn" href="main.jsp">home으로 돌아가기</a>
	</div>
</section>

 
<%
 	Connection conn = null;

 	PreparedStatement pstmt = null;
 	ResultSet rs = null;

 	try {

 		Class.forName("com.mysql.jdbc.Driver");

 		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
 		conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");

 		String Query = "SELECT name, information from pill";
 		pstmt = conn.prepareStatement(Query);
 		rs = pstmt.executeQuery();

 		while (rs.next()) {
 			String name = rs.getString(1); 
 			String info = rs.getString(2);

 			out.println("제품명:");
			out.println(name);
			
			out.println("<BR>");
			out.println("제품 기능:");
			out.println(info);
			out.println("<HR>");
 		}
 	} catch (SQLException e) {
 		e.printStackTrace();
 	} finally {
 		rs.close();
 		pstmt.close();
 		conn.close();
 	}
 %>
		</body>

	</html>