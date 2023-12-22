<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
Connection con = new DBConnection().getConnection();
%>
<!DOCTYPE html>
<html>

<head>
<title>Home Page</title>
<jsp:include page="_header.jsp" />
</head>

<body>
	<jsp:include page="_navigation.jsp" />
	<div class="container mt-5 pt-5">
		<div class="row">
			<div class="col-12">
				<div class="text1">NEON BUS</div>
				<div class="text2">Your Journey, Your Way</div>
				<div class="text3">Welcome to the Neon Bus Ticket Reservation
					System, your trusted online platform for booking bus tickets with
					ease. We are committed to providing you with a seamless and
					convenient way to plan your bus journeys.</div>
			</div>
		</div>
		<div class="row imgset1 mt-5 mb-5">
			<div class="col-3">
				<img src="./mini_bus1.jpg" alt="">
			</div>
			<div class="col-3">
				<img src="./mini_bus2.jpg" alt="">
			</div>
			<div class="col-3">
				<img src="./mini_bus3.jpg" alt="">
			</div>
			<div class="col-3">
				<img src="./mini_bus4.jpg" alt="">
			</div>
		</div>
		<div class="row imgset2 mt-5 pt-5 align-items-center">
			<div class="col-8">
				<div class="text4 text-uppercase">About Us</div>
				<div class="text5">Welcome to the Neon Bus Ticket Reservation
					System, your trusted online platform for booking bus tickets with
					ease. We are committed to providing you with a seamless and
					convenient way to plan your bus journeys.</div>
			</div>
			<div class="col-4">
				<img src="./mini_bus5.jpg" alt="">
			</div>
		</div>
		<div class="row mt-5 mb-5">
		<div class="col-12">
		<div class="text8 text-center text-uppercase">What Our Users Say</div>
		</div>
		
			<div class="col-12 mt-5">
				<div class="swiper">
					<div class="swiper-wrapper">
					<%
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT a.*, b.first_name, b.last_name, b.email, DATE_FORMAT(a.created_at, '%Y-%m-%d') AS formatted_createdAt FROM feedback a INNER JOIN users b ON a.user_id = b.id LIMIT 10;");

							while (rs.next()) {%>
								
								<div class="swiper-slide d-flex justify-content-center">
							<div class="feedback-card">
								<div class="name"><%=rs.getString("first_name")+" " +rs.getString("last_name")%></div>
								<div class="email"><%=rs.getString("email")%></div>
								<div class="comment"><%=rs.getString("comment")%></div>
								<div class="date"><%=rs.getString("formatted_createdAt")%></div>
							</div>
						</div>
								
								
							<%}

							rs.close();
							stmt.close();
							con.close();
							%>
					
					
						
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="_footer.jsp" />
	<script>
    const swiper = new Swiper('.swiper', {
        
        direction: 'horizontal',
        loop: true,
        autoplay: {
            delay: 3000, 
            disableOnInteraction: false, 
        },
        spaceBetween: 60,
        breakpoints: {
            640: {
                slidesPerView: 1,
                spaceBetween: 20,
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 40,
            },
            1400: {
                slidesPerView: 3,
                spaceBetween: 50,
            },
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
	</script>
</body>

</html>