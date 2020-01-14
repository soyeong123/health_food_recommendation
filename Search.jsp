<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>BizPage Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>
<%
   request.setCharacterEncoding("UTF-8");

   Connection conn = null;
   Statement stmt=null;
   
   String name=request.getParameter("name");

    try {
       Class.forName("com.mysql.jdbc.Driver");

       String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
       conn = DriverManager.getConnection(jdbcUrl, "jspuser", "jsppass");

       if(conn==null)
          throw new Exception("데이터베이스 연결 실패");
       
       stmt=conn.createStatement();
       
       ResultSet rs=stmt
             .executeQuery("select * from pill where name='"+name+"'"); 
       
       if(!rs.next()){
          out.println("해당하는 정보가 없습니다.");
       }else{
          rs.previous();
       }
       
 
       while (rs.next()) {
          String foodname = rs.getString("name");
          String info = rs.getString("information");
          out.println("<br>"); 
 %>         
    <section id="about">
      <div class="container">

        <header class="section-header">
          <h3>검색결과</h3>
          <h5><strong><p>제품명"<%=foodname%>"의 검색결과입니다.</p></strong></h5>
        </header>

        <div class="row about-cols">

         
            <div class="about-col">
              <div class="img">
               
                <div class="icon"><i class="ion-ios-home-outline" onclick="javascript:location.replace('main.jsp')"></i></div>
              </div>
              <h2 class="title"><a href="#"><%=foodname %></a></h2>
              <p>
               제품기능: <%=info %>
              </p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- #about -->
    <%
     }
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       stmt.close();
       conn.close();
    }
    %>


  

</body>
</html>
