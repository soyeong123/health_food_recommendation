<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


<!-- #call-to-action -->
   <section id="testimonials" class="section-bg wow fadeInUp">
      <div class="container">

        <header class="section-header">
          <h3>검색결과</h3>
        </header>

        <div class="owl-carousel testimonials-carousel">

          <div class="testimonial-item">
            <img src="img/gg.JPG" class="testimonial-img" alt="">
            <br>
            <h3>필요한 추가 기능이 있다면, 선택하세요.</h3>
          </div>
          <div class="testimonial-item">
            <img src="img/one.png" class="testimonial-img" alt="">
            <br>
            <h3>필요한 추가 기능이 있다면, 선택하세요.</h3>
          </div>

        </div>

      </div>
    </section><!-- #testimonials -->


<body>
<form action="threeselect.jsp" method="post">
<div class="container">
<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;

		PreparedStatement pstmt = null; 
		ResultSet rs = null; 

		try {

			Class.forName("com.mysql.jdbc.Driver");

			String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
			conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");

			String qu = "select menuname from menu order by 1";

			pstmt = conn.prepareStatement(qu);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String category = rs.getString(1);
	%>
	<label class="btn btn-dark"><input type="radio" name="food3" value=<%=category %>><%=category%></label>
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
<br>
	
	<div class="container text-center">	
	<input type="submit" class="btn btn-outline-success" value="추가하기" />
	<input type="button" class="btn btn-success" onclick="javascript:location.replace('main.jsp')" value="HOME" /></div>
<br><br>
</div>
</form>
<div class="container">
<!-- 정보제공 -->
<%
	request.setCharacterEncoding("UTF-8");
	String food=(String)session.getAttribute("food");

 	try {
 		Class.forName("com.mysql.jdbc.Driver");

 		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
 		conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");
 		
 		String food2=request.getParameter("food2");
 		session.setAttribute("food2", food2);
 		
 		%><h5><strong>
 		<%
 		out.println("검색 결과:");
 		out.print(food);
 		out.println("+");
 		out.println(food2);
 		out.println("<br>");%></strong></h5>
 		<%
 		String Query = "SELECT name,information FROM pill where information like ? and information like ?";
 		
 		pstmt =conn.prepareStatement(Query);
 		pstmt.setString(1,"%"+food+"%");
 		pstmt.setString(2,"%"+food2+"%");
 	
 		rs = pstmt.executeQuery();
 

 		while (rs.next()) {
 			String name = rs.getString(1);
 			String info = rs.getString(2);
		%>
		<section id="services">
            <div class="icon"><i class="ion-ios-paper-outline"></i></div>
            <h4 class="title"><a href=""><%=name %></a></h4>
					<%
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
 	</div>
 	<!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
 
  
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/waypoints/waypoints.min.js"></script>
  <script src="lib/counterup/counterup.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/isotope/isotope.pkgd.min.js"></script>
  <script src="lib/lightbox/js/lightbox.min.js"></script>
  <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
</body>
</html>