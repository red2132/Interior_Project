<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.client_logo .single_client_logo {
	border-bottom: 0px !important;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="banner_slider owl-carousel">
						<div class="single_banner_slider">
							<div class="row">
								<div class="col-lg-5 col-md-8">
									<div class="banner_text">
										<div class="banner_text_iner">
											<h1>댕냥이와 함께 사는 분들!</h1>
											<p>포인트 100% 증정!!</p>
											<a href="../event/detail.do?no=51&page=1" class="btn_2">확인하기</a>
										</div>
									</div>
								</div>
								<div class="banner_img d-none d-lg-block">
									<img src="banner2.png" alt="">
								</div>
							</div>
						</div>
						<div class="single_banner_slider">
							<div class="row">
								<div class="col-lg-5 col-md-8">
									<div class="banner_text">
										<div class="banner_text_iner">
											<h1>북유럽 스타일 인테리어</h1>
											<p></p>
											<a href="../comm/tag.do?tag=북유럽" class="btn_2">구경하기</a>
										</div>
									</div>
								</div>
								<div class="banner_img d-none d-lg-block">
									<img src="banner1.png" alt="">
								</div>
							</div>
						</div>
						<!-- <div class="single_banner_slider">
                            <div class="row">
                                <div class="col-lg-5 col-md-8">
                                    <div class="banner_text">
                                        <div class="banner_text_iner">
                                            <h1>Wood & Cloth
                                                Sofa</h1>
                                            <p>Incididunt ut labore et dolore magna aliqua quis ipsum
                                                suspendisse ultrices gravida. Risus commodo viverra</p>
                                            <a href="#" class="btn_2">buy now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner_img d-none d-lg-block">
                                    <img src="../template/img/banner_img.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="single_banner_slider">
                            <div class="row">
                                <div class="col-lg-5 col-md-8">
                                    <div class="banner_text">
                                        <div class="banner_text_iner">
                                            <h1>Cloth $ Wood Sofa</h1>
                                            <p>Incididunt ut labore et dolore magna aliqua quis ipsum
                                                suspendisse ultrices gravida. Risus commodo viverra</p>
                                            <a href="#" class="btn_2">buy now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner_img d-none d-lg-block">
                                    <img src="img/banner_img.png" alt="">
                                </div>
                            </div>
                        </div> -->
					</div>
					<div class="slider-counter"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- banner part start-->

	<!-- feature_part start-->
	<section class="feature_part padding_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="section_tittle text-center">
						<h2>인기상품</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-7 col-sm-6">
					<div class="single_feature_post_text">
						<p>Premium Quality</p>
						<h3>가전</h3>
						<a href="../new/list.do?sort=0&cate1=가전" class="feature_btn">바로가기
							<i class="fas fa-play"></i>
						</a> <img src="../template/img/feature/101.png" alt="">
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div class="single_feature_post_text">
						<p>Premium Quality</p>
						<h3>가구</h3>
						<a href="../new/list.do?sort=0&cate1=가구" class="feature_btn">바로가기
							<i class="fas fa-play"></i>
						</a> <img src="../template/img/feature/201.png" alt="">
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div class="single_feature_post_text">
						<p>Premium Quality</p>
						<h3>침구</h3>
						<a href="../new/list.do?sort=0&cate1=침구" class="feature_btn">바로가기
							<i class="fas fa-play"></i>
						</a> <img src="../template/img/feature/301.png" alt="">
					</div>
				</div>
				<div class="col-lg-7 col-sm-6">
					<div class="single_feature_post_text">
						<p>Premium Quality</p>
						<h3>조명</h3>
						<a href="../new/list.do?sort=0&cate1=조명" class="feature_btn">바로가기
							<i class="fas fa-play"></i>
						</a> <img src="../template/img/feature/401.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- upcoming_event part start-->

	<!-- product_list start-->
	<section class="product_list section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="section_tittle text-center">
						<h2>
							새상품 추천 <span>shop</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="product_list_slider owl-carousel">
						<c:forEach var="list" items="${ccArr }">
							<div class="single_product_list_slider">
								<div class="row align-items-center justify-content-between">
									<c:forEach var="i" items="${list }">
										<div class="col-lg-3 col-sm-6">
											<div class="single_product_item">
												<img src="${i.img }" alt="">
												<div class="single_product_text">
													<h4>${i.title }</h4>
													<h3>${i.price }</h3>
													<a href="../new/detail.do?no=${i.no }" class="add_cart">+
														add to cart<i class="ti-heart"></i>
													</a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- product_list end-->

	<!--  특가 -->
	<!-- <section class="our_offer section_padding">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-6 col-md-6">
					<div class="offer_img">
						<img src="../template/img/offer_img.png" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="offer_text">
						<h2>특가 Weekly Sale on 60% Off All Products</h2>
						<div class="date_countdown">
							<div id="timer">
								<div id="days" class="date"></div>
								<div id="hours" class="date"></div>
								<div id="minutes" class="date"></div>
								<div id="seconds" class="date"></div>
							</div>
						</div>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="enter email address"
                                aria-label="Recipient's username" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<a href="#" class="btn_2">구매 ㄱㄱ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- 특가 end -->

	<!-- product_list part start-->
	<section class="product_list best_seller section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="section_tittle text-center">
						<h2>커뮤니티</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-between" id="comm">
				<div class="col-lg-12">

					<div>
						<div class="single_product_item col-lg-3" v-for="vo in comm_data">
							<img :src="vo.filename" alt="" height="200px" width="300px">
							<div class="single_product_text">
								<a :href="'../comm/detail.do?no='+vo.no+'&page=1'"><h4>{{vo.subject}}</h4></a>
								<h3>{{vo.id}}</h3>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- product_list part end-->


	<!--  실시간 뉴스 -->
	<section class="section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class=news>
						<h1>실시간 관련 뉴스</h1>
						<div class="row">
							<div style="float: right">
								<input type=text size=30 class="input-sm" v-model="ss">
								<button class="btn btn-sm btn-primary" v-on:click="newsFind()">검색</button>
							</div>
						</div>
						<div style="height: 50px"></div>
						<div class="row">
							<table class="table" v-for="vo in news_data">
								<tr>
									<th colspan="2">{{vo.title}}</th>
								</tr>
								<tr>
									<td colspan="2"><a :href="vo.link">{{vo.desc}}</a></td>
								</tr>
								<tr>
									<td class="text-left">{{vo.date}}</td>
									<td class="text-right">{{vo.author}}</td>
								</tr>
							</table>
						</div>
					</div>


				</div>
			</div>
		</div>
	</section>
	<!--  실시간 뉴스 끝  -->

	<!-- subscribe_area part start-->
	<section class="client_logo">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="single_client_logo">
						<a href="https://www.iloom.com/"><img
							src="../template/img/client_logo/1.png" alt=""></a>
					</div>
					<div class="single_client_logo">
						<a href="https://www.hanssem.com/"><img
							src="../template/img/client_logo/2.png" alt=""></a>
					</div>
					<div class="single_client_logo">
						<a href="https://marketb.kr/"><img
							src="../template/img/client_logo/4.jpg" alt=""></a>
					</div>
					<div class="single_client_logo">
						<a href="https://www.ikea.com/kr/"><img
							src="../template/img/client_logo/5.png" alt=""></a>
					</div>
					<div class="single_client_logo">
						<a href="https://ohou.se/"><img
							src="../template/img/client_logo/3.jpg" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::subscribe_area part end::-->
	<script>
new Vue({
	el:'#comm',
	data:{
		comm_data:[]
	},
	mounted:function(){
		axios.get("http://localhost:8080/web/main/rest_comm.do")
		.then(res => {
			console.log(res.data);
			this.comm_data=res.data;
		})
	}
})
new Vue({
	el:'.news',
	data:{
		ss:'인테리어',
		cnt:5,
		news_data:[]
	},
	mounted:function(){
		axios.get("http://localhost:8080/web/news/news_find.do",{
			params:{
				cnt:this.cnt,
				ss:this.ss
			}
		}).then(res=>{
			this.news_data=res.data
		})
	},
	methods:{
		newsFind:function(){
			axios.get("http://localhost:8080/web/news/news_find.do",{
   			params:{
   				cnt:this.cnt,
   				ss:this.ss
   			}
   		}).then(res=>{
   			this.news_data=res.data
   		})
	}
}
})
</script>
</body>
</html>