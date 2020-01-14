<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>health functional food recommend</title>


<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">

</head>

<body>


	<header id="header">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">하루한알</a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="#intro">Home</a></li>
					<li><a href="#home">나에게 맞는 제품 찾기</a></li>
					<li><a href="#Search">검색하기</a></li>
		
					<li><a href="#contact">문의사항</a></li>
				</ul>
			</nav>
		</div>
	</header>


	<section id="intro">
		<div class="intro-container">
			<div id="introCarousel" class="carousel  slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<div class="carousel-item active">
						<div class="carousel-background">
							<img src="img/intro-carousel/1000.JPG" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>health functional food recommend</h2>
								<p>건강기능식품 추천 사이트</p>
								<a href="#home" class="btn-get-started scrollto">Start</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


<p></p>
<p></p>
	
<main id="main"> <!-- home -->

<section id="home"></section>
	<div class="container">



	<header class="section-header">
		<h3>나에게 맞는 제품 찾기</h3>
	
	<div class="container">
		<div class="row">
			<div class="col">
				<p>
					<strong>기능별 모아보기</strong>
				</p>
	<form action="oneselect.jsp" method="post">
		<div class="cta-2-form text-center">
			<tr>
				<th rowspan="3"><p>
						<strong>필요한 기능을 선택하세요.</strong>
					</p>
				<td colspan="4">												
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
			int sum=-1;
			
			while (rs.next()) {
				String category = rs.getString(1);
				sum=sum+1;
						if(sum%5==0)
							out.print("<BR>");
		%>
		<label class="btn btn-primary"><input type="radio" name="food" value=<%=category %>><%=category%></label>
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
					
					<input type="submit" class="btn btn-outline-success" value="선택하기">
					<input type="button" class="btn btn-success" onclick="javascript:location.replace('total.jsp')" value="전체보기">
					<p></p>										
			</tr>
			</div>
		</form>
		</div>
		</div>
		</div>
	</body>	
</header>

<!-- 검색하기 -->
	<section id="Search">
		<div class="container">
			<div class="section-header wow fadeInUp">
				<h3>검색하기</h3>
				<p>필요한 정보의 제품명을 입력하세요</p>
			</div>
					
					
    <br/>
    <form method="post" action="Search.jsp">
  
	<div class="row justify-content-center">
             <div class="col-12 col-md-10 col-lg-8">
                     <div class="card-body row no-gutters align-items-center">
                         <div class="col-auto">
                             <i class="fas fa-search h4 text-body"></i>
                         </div>                                   
                         <div class="col">
                       		 <input class="form-control form-control-lg form-control-borderless" type="text" placeholder="제품명" name="name">                                 
                         </div>                                  
                         <div class="col-auto">
                             <button class="btn btn-lg btn-success" type="submit">Search</button>
                         </div>                                    
                     </div>
                
             </div>                        
    </div>
    </form>
			</div>
	
	</section>
	
<br>
<br>
																									
<!-- 문의사항 -->			
		<section id="contact" class="section-bg wow fadeInUp">

			<div class="container">
				<div class="section-header">
					<h3>문의사항</h3>
					<p>등록되지 않거나, 수정할 제품을 보내주세요.</p>
				</div>

				<div class="form">
					<form method="post" action="qaProc.jsp">
						<div class="form-row">
							<div class="form-group">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="상품명" data-rule="minlen:4"
									data-msg="Please enter at least  8 chars of subject" />
								<div class="validation"></div>
							</div>

						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="brand" id="brand"
								placeholder="브랜드명" data-rule="minlen:4"
								data-msg="Please enter at least 8 chars of subject" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="message" rows="5"
								data-rule="required" data-msg="Please write something for us"
								placeholder="Message"></textarea>
							<div class="validation"></div>
						</div>
						<div class="text-center">
							<button type="submit">Send Message</button>
						</div>
					</form>
				</div>

			</div>
		</section>
		<!-- #contact -->
</main>
	<!--==========================   Footer ============================--> 
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-info">
						<h3>하루 한알</h3>
						<p>health functional food recommend(건강 기능 식품 추천 사이트)
						사용자가 필요한 기능(정보)을 입력하여 본인에게 가장 적절한 제품을 제공합니다.</p>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Product recommendation</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Search</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">inquiry</a></li>
							
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							A108 Adam Street <br> New York, NY 535022<br> United
							States <br> <strong>Phone:</strong> +82 010 1234 5678<br>
							<strong>Email:</strong> info@example.com<br>
						</p>

						<div class="social-links">
							<a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="instagram"><i class="fa fa-instagram"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
						</div>

					</div>

					<div class="col-lg-3 col-md-6 footer-newsletter">
						<h4>One day One pill</h4>
						<p>Choose the features you need to provide the product that you need most.</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>
					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				<strong>하루한알</strong>
			</div>
			<div class="credits">
				<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer> <!-- #footer --> <a href="#" class="back-to-top"><i
		class="fa fa-chevron-up"></i></a> <!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> --> <!-- JavaScript Libraries --> <script
		src="lib/jquery/jquery.min.js"></script> <script
		src="lib/jquery/jquery-migrate.min.js"></script> <script
		src="lib/bootstrap/js/bootstrap.bundle.min.js"></script> <script
		src="lib/easing/easing.min.js"></script> <script
		src="lib/superfish/hoverIntent.js"></script> <script
		src="lib/superfish/superfish.min.js"></script> <script
		src="lib/wow/wow.min.js"></script> <script
		src="lib/waypoints/waypoints.min.js"></script> <script
		src="lib/counterup/counterup.min.js"></script> <script
		src="lib/owlcarousel/owl.carousel.min.js"></script> <script
		src="lib/isotope/isotope.pkgd.min.js"></script> <script
		src="lib/lightbox/js/lightbox.min.js"></script> <script
		src="lib/touchSwipe/jquery.touchSwipe.min.js"></script> <!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script> <!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
</body>
</html>
