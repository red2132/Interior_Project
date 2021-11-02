<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>    
    <script src="http://code.jquery.com/jquery.js"></script>
    <link rel="stylesheet" href="../template/css/style.css">
</head>
<script>
$(function(){
    var $win = $(window);
    var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
 
    /*사용자 설정 값 시작*/
    var speed          = 400;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
    var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
    var $layer         = $('.left_sidebar_area'); // 레이어 셀렉팅
    var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
    $layer.css('position', 'relative').css('z-index', '1');
    /*사용자 설정 값 끝*/
 
    // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
    if (top > 0 )
        $win.scrollTop(layerTopOffset+top);
    else
        $win.scrollTop(0);
 
    //스크롤이벤트가 발생하면
    $(window).scroll(function(){
        yPosition = $win.scrollTop() - 350; //이부분을 조정해서 화면에 보이도록 맞추세요
        if (yPosition < 0)
        {
            yPosition = 0;
        }
        $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
    });
});
</script>
<body>
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Shop Category</h2>
                            <p>검색한 내용 : ${ss }</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <section class="cat_product_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>대분류</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <!-- <li><a href="#"><span>전체</span></a></li> -->
                                    <c:forEach var="c1" items="${secondCateList }">                                    										
                                    	<li><a href="../second/list.do?cate1=${c1 }"><span ${style }>${c1 }</span></a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </aside>  
                                             
                        <!-- <aside class="left_widgets p_filter_widgets price_rangs_aside">
                            <div class="l_w_title">
                                <h3>Price Filter</h3>
                            </div>
                            <div class="widgets_inner">
                                <div class="range_item">
                                    <div id="slider-range"></div>
                                    <input type="text" class="js-range-slider" value="" />
                                    <div class="d-flex">
                                        <div class="price_text">
                                            <p>Price :</p>
                                        </div>
                                        <div class="price_value d-flex justify-content-center">
                                            <input type="text" class="js-input-from" id="amount" readonly />
                                            <span>to</span>
                                            <input type="text" class="js-input-to" id="amount" readonly />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside> -->
                    </div>
                </div>
                <div class="col-lg-9">                	                	
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center">
                                <div class="single_product_menu">
                                    <p><span>${fcnt } </span> 개의 상품이 검색되었습니다.</p>
                                </div>
                                <!-- 아직 정렬 구현 안됨 -->
                                <div class="single_product_menu d-flex">
                                    <h5>short by : </h5>
                                    <select>
                                        <option data-display="Select">default</option>
                                        <option value="1">낮은 가격순</option>
                                        <option value="2">높은 가격순</option>
                                        <option value="3">리뷰 많은순</option>
                                        <option value="4">평점 높은순</option>
                                    </select>
                                </div>
                                                   
                               <form method="post" action="../second/find.do" id="frm">
                                <div class="single_product_menu d-flex" style="display: inline-block;">                                 
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

                    <div class="row align-items-center latest_product_inner">
                        <c:forEach var="vo" items="${flist }">
                        <div class="col-lg-4 col-sm-6" id=m_div>
                            <div class="single_product_item">
                                <a href="#">
                                <img src="${vo.img }" style="width:300px; height:250px;">
                                <div class="single_product_text">
                                	<h4>${vo.title }</h4>
                                    <h3>${vo.price }원</h3>
                                </div>
                                </a>
                                <div class="single_product_text">
                                    <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                         <%-- <div class="col-lg-12">
                            <div class="pageination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">                                                                             
                                        <c:if test="${startPage>1 }">
							              <li><a class="page-link" href="../second/find.do?fs=${fs }&ss=${ss }&page=${startPage-1 }">&lt;</a></li>
							             </c:if>
							               <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							                <c:if test="${curpage==i }">
							                  <c:set var="style" value="class=page-item active"/>
							                </c:if>
							                <c:if test="${curpage!=i }">
							                  <c:set var="style" value="class=page-item"/>
							                </c:if>
							                <li ${style }><a class="page-link" href="../second/find.do?fs=${fs }&ss=${ss }&page=${i }">${i }</a></li>
							               </c:forEach>
							             <c:if test="${endPage<totalpage }">
										  <li class="page-item"><a class="page-link" href="../second/find.do?fs=${fs }&ss=${ss }&page=${endPage+1 }">&gt;</a></li>
										 </c:if>                                        
                                    </ul>
                                </nav>
                            </div>
                        </div>  --%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Category Product Area =================-->

    <!-- 추천 -->
    <%-- <section class="product_list best_seller">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>추천<span style="color: #ff3368">새상품</span></h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                        <c:forEach var="nvo" items="clist">
                        <div class="single_product_item">
                            <a href="../new/list.do?no=${nvo.no }"><img src="${nvo.img }" alt=""></a>
                            <div class="single_product_text">
                                <a href="../new/list.do?no=${nvo.no }"><h4>${nvo.title }</h4></a>
                                <h3>${nvo.price }</h3>
                            </div>
                        </div>
                        </c:forEach>
                        
                        <!-- <div class="single_product_item">
                            <img src="img/product/product_2.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="img/product/product_3.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="img/product/product_4.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="img/product/product_5.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section> --%>
    <!-- 추천 슬라이드 -->
 
</body>

</html>