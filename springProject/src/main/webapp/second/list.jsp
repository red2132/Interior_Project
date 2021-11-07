<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery.js"></script>
 <script>
  $( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  } );
  </script>
<style type="text/css">
.clicked {
        color: #ff3368;
      }
</style>
</head>
<body>
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Shop Category</h2>
                            <p>중고거래 <span><i class="ti-arrow-right"></i></span> ${cate1 } <span><i class="ti-arrow-right"></i></span> ${cate2 }</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <section class="cat_product_area section_padding">
        <div class="container" id=asd>
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>대분류</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                   <!--  <li><a href="#"><span>전체</span></a></li> -->
                                    <c:forEach var="c1" items="${secondCateList }">
                                    	<c:if test="${c1==cate1 }">
											<c:set var="style" value="style='color: #ff3368'"/>
										</c:if>
										<c:if test="${c1!=cate1 }">
											<c:set var="style" value=""/>
										</c:if>										
                                    	<li><a href="../second/list.do?cate1=${c1 }"><span ${style }>${c1 }</span></a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>소분류</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <c:forEach var="c2" items="${secondCate2List }">
                                    	<c:if test="${c2==cate2 }">
											<c:set var="style" value="style='color: #ff3368'"/>
										</c:if>
										<c:if test="${c2!=cate2 }">
											<c:set var="style" value=""/>
										</c:if>
                                    	<li><a href="../second/list.do?cate1=${cate1 }&cate2=${c2 }"><span ${style }>${c2 }</span></a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </aside>
						
						<!-- 필터기능 구현 X -->
                        <!-- <aside class="left_widgets p_filter_widgets price_rangs_aside">
                            <div class="l_w_title">
                                <h3>Price Filter</h3>
                            </div>
                            <div class="widgets_inner">
                                <p>
							  <label for="amount">Price range:</label>
							  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
							</p>
							 
							<div id="slider-range"></div>
                            </div>
                        </aside> -->
                    </div>
                </div>
                <div class="col-lg-9">
                	<%-- <div class="row">
                	   <p>중고거래 &ensp;<span>→</span>&ensp;${cate1 }&ensp;<span>→</span>&ensp;${cate2 }&ensp;<span>→</span>&ensp;${cate3 }</p>
                	</div> --%>
                	<div class="row">
                	  <c:forEach var="c3" items="${secondCate3List }">
                	 	<c:if test="${c3==cate3 }">
						  <c:set var="style" value="style='color: #ff3368'"/>
					    </c:if>
						<c:if test="${c3!=cate3 }">
						  <c:set var="style" value=""/>
						</c:if>
                        <a href="../second/list.do?cate1=${cate1 }&cate2=${cate2 }&cate3=${c3 }" style="color:black;font-weight: bold; "><span ${style }> &nbsp;${c3 } &nbsp;</span></a>               	
                	  </c:forEach>
                	</div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center">
                                <div class="single_product_menu">
                                    <p><span>${cnt } </span> 개의 상품이 검색되었습니다.</p>
                                </div>
                                <!-- 정렬  -->
                                <div>                                     
                                     <button class="cbtn" v-on:click="change(2)" style="background-color: white; border-style: none;">낮은가격순</button>
                                     <button class="cbtn" v-on:click="change(3)" style="background-color: white; border-style: none;">높은가격순</button>                                                              
                                </div>
                                                                              
								<!-- 검색  -->
								                            
                                <form method="post" action="../second/find.do" id=frm>
                                  <div class="single_product_menu d-flex">                                 
						           <input type="checkbox" value="T" class="input-sm" name="fs" checked="checked">이름	   
						           <input type="checkbox" value="C" class="input-sm" name="fs">내용
						           <div class="input-group">
						             <input type=text name=ss size=15 class="form-control" placeholder="search">
						               <div class="input-group-prepend">
                          		         <span class="input-group-text" id="inputGroupPrepend">
                          		           <i class="ti-search" onclick="document.getElementById('frm').submit();" style="cursor: pointer;"></i>
                          		         </span>
                                       </div>
                                   </div>						       
						        </div>	
						       </form>                              
                            </div>
                        </div>
                    </div>
                    <!-- 리스트 출력 -->
                    <div class="row align-items-center latest_product_inner">    
                        <div class="col-lg-4 col-sm-6" v-for="vo in sort_data">
                            <div class="single_product_item">
                                <a :href="'../second/detail.do?no='+vo.no">
                                <img :src="vo.img" style="width:300px; height:250px;">
                                <div class="single_product_text">                                	
                                	<h4>{{vo.title}}</h4>
                                    <h3>{{vo.price}}</h3> 
                                </div>
                                </a>
                                <div class="single_product_text">
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>    
         				<!-- 페이징 -->
                        <div class="col-lg-12">
                            <div class="pageination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center" v-for="i in totalpage">                                    	                                    
							              <li class="page-item active" v-if="curpage==i"><a href="#" v-on:click="pageChange(i)">{{i}}</a></li>
							              <li v-if="curpage!=i"><a href="#" v-on:click="pageChange(i)">{{i}}</a></li>							                                          
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Category Product Area =================-->

    <!-- 추천 -->
    <section class="product_list best_seller">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>관련상품<span style="color: #ff3368">중고상품</span></h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                       <c:forEach var="rvo" items="${rlist }">
                        <div>
                            <a href="../second/detail.do?no=${rvo.no }"><img src="${rvo.img}"></a>
                            <div class="single_product_text">
                                <a href="../second/detail.do?no=${rvo.no }"><h4>${rvo.title}</h4></a>
                                <h3>${rvo.price }</h3>
                            </div>
                        </div>
                       </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section> 
    <!-- 추천 슬라이드 -->    
</body>
<script>
new Vue({
	el:'#asd',
	data:{
		  cate1:'${cate1}',
		  cate2:'${cate2}',
		  cate3:'${cate3}',
		  n:1,
		  sort_data:[],
		  curpage:1,
		  totalpage:0		  
	},
	mounted:function(){
		this.getData();
	},
	 methods:{
		  getData:function(){
			  axios.get("http://localhost:8080/web/second/rest_cate.do",{
				  params:{
					  page:this.curpage,
					  n:this.n,
					  cate1:this.cate1,
					  cate2:this.cate2,
					  cate3:this.cate3
				  }
			  }).then(response=>{
				  console.log(response.data);
				  this.sort_data=response.data;
				  this.curpage=this.sort_data[0].curpage;
				  this.totalpage=this.sort_data[0].totalpage;
			  })
		  },
		  change:function(n){
			  this.n=n;
			  axios.get("http://localhost:8080/web/second/rest_cate.do",{
				  params:{
					  page:this.curpage,
					  n:this.n,
					  cate1:this.cate1,
					  cate2:this.cate2,
					  cate3:this.cate3
				  }
			  }).then(response => {
				  // response가 결과값
				  console.log(response.data); // 디버깅
				  this.sort_data=response.data;
				  this.curpage=this.sort_data[0].curpage;
				  this.totalpage=this.sort_data[0].totalpage;
			  })
		  },
		  pageChange:function(page)
		  {
			  this.curpage=page;
			  console.log("page="+page);
			  this.getData();
		  }		 
	 }
})

</script>


<script>
var div2 = document.getElementsByClassName("cbtn");

function handleClick(event) {
  console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  console.log(event.target.classList);

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("clicked");
    }

    event.target.classList.add("clicked");
  }
}

function init() {
  for (var i = 0; i < div2.length; i++) {
    div2[i].addEventListener("click", handleClick);
  }
}
 init();
</script>
</html>