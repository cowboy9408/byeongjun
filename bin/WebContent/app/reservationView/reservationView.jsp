<%@page import="java.util.List"%>
<%@page import="com.butler.app.dao.ReviewFileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html lang="en">

<%@ include file="../../header/pc_header.jsp" %>

<head>
      <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pc_header.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/Hotel_icon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
    <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    
    <script>
        let nowdate =0;

    $(function () {
        let txttotalprice = document.getElementById("pricecontent");

        let nowdate2 = document.getElementById("nowdate");
        nowdate2.value=1;
        $('#demo').daterangepicker({
            
            "locale": {
                "format": "YYYY-MM-DD",
                "separator": " ~ ",
                "applyLabel": "확인",
                "cancelLabel": "취소",
                "fromLabel": "From",
                "toLabel": "To",
                "customRangeLabel": "Custom",
                "weekLabel": "W",
                "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                "firstDay": 1
                
            },
           
            "startDate": 0,
            "endDate": 0,
            "drops": "down"
        }, function (start, end, label) {


            console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
            let totaldate = document.getElementById("totaldate");
            let totaldate2 = document.getElementById("totaldate2");
            console.log(end.format('DD')-start.format('DD'));



            // 기간
            nowdate = end.format('DD')-start.format('DD');
            nowdate2.value = nowdate;

            totaldate.innerHTML="체크인 : "+start.format('MM-DD')+" ~ "+"체크 아웃 : "+end.format('MM-DD')
            totaldate2.innerHTML="총 "+nowdate+"박 "+(nowdate+1)+"일";


            // 날짜 가져오기
            let book_checkin_date  = document.getElementById("book_checkin_date");
            book_checkin_date.value= start.format('YYYY-MM-DD');

            let book_checkout_date = document.getElementById("book_checkout_date");
            book_checkout_date.value= end.format('YYYY-MM-DD');

            console.log(book_checkin_date.value);
            console.log(book_checkout_date.value);

            let xcount = nowdate;
            let nd = document.getElementById("nowdate");
            nd.value=xcount;

            
            // 총 기간과 총합의 값
            console.log("총 기간과 총합의 값 : "+fullcharge*xcount);

            // 프론트 상에 보여주기
            txttotalprice.innerHTML=fullcharge*xcount;
            // input value에 담아주기
            toprice.value=fullcharge*xcount;
            book_charge= fullcharge*xcount;
            console.log(book_charge+"="+fullcharge+"X"+xcount);
            

            
            
            $("#add").on("click",function(){
                if($('#animal option:selected').text()=="강아지"){

                    var charge = parseInt($('.dog_weight option:selected').val());
                    txttotalprice.innerHTML=toprice.value;
                    
                    
                }else if($('#animal option:selected').text()=="고양이"){
                    var charge = parseInt($('.cat_weight option:selected').val());


                }else if($('#animal option:selected').text()=="새"){
                   var charge = parseInt($('.bird_weight option:selected').val());

                }else if($('#animal option:selected').text()=="파충류"){
                    var charge = parseInt($('.reptile_weight option:selected').val());

                }else if($('#animal option:selected').text()=="패럿"){
                   var charge = parseInt($('.Farad_weight option:selected').val());

                }else if($('#animal option:selected').text()=="토끼"){
                    var charge = parseInt($('.rabbit_weight option:selected').val());

                }else if($('#animal option:selected').text()=="햄스터"){
                   var charge = parseInt($('.hamster_weight option:selected').val());

                }else if($('#animal option:selected').text()=="그 외"){
                    var charge = parseInt($('.else_weight option:selected').val());

                }
            })

    });
        
        $('#demo').datepicker({
            mindate:0,
            maxdate:+"2y"
        })

    });

 
    </script>
    
<style>
  	img.thumbnail{
		display:block;
		clear:both;		
		height:80px;
	}
 </style>
</head>






<body class="reservation_wrap">

<div class="mask"></div>

    <div class="box1">
        <div class="Hotel_pic">

            <div class="bigpic">
                <img id="pictures" src="${pageContext.request.contextPath}/img/business_place_img/${hotelresult.business_place_num_pk}/${hotelresult.business_place_num_pk}_1.png" alt="">
            </div>
            <div class="small">
                <div id="smallpic">
                	<img id="pictures" src="${pageContext.request.contextPath}/img/business_place_img/${hotelresult.business_place_num_pk}/${hotelresult.business_place_num_pk}_1.png" alt="">
                </div>
                <div id="smallpic">
                	<img id="pictures" src="${pageContext.request.contextPath}/img/business_place_img/${hotelresult.business_place_num_pk}/${hotelresult.business_place_num_pk}_2.png" alt="">
                </div>
                <div id="smallpic">
                	<img id="pictures" src="${pageContext.request.contextPath}/img/business_place_img/${hotelresult.business_place_num_pk}/${hotelresult.business_place_num_pk}_3.png" alt="">
                </div>
                <div id="smallpic">
                	<img id="pictures" src="${pageContext.request.contextPath}/img/business_place_img/${hotelresult.business_place_num_pk}/${hotelresult.business_place_num_pk}_4.png" alt="">
                </div>
            </div>
            
        </div>

        <div class="Hotel_explain">
            <div class="Hotel_name">${hotelresult.business_name}</div>
            <div class="Hotel_addr">${hotelresult.business_addr} ${hotelresult.business_addrdetail} </div>
            <div class="Hotel_info">${hotelresult.business_main_intro}</div>
        </div>
    </div>

<form action="/book/BookOk.book" type="post" onsubmit="return reservation()">
<!-- 예약 종류 선택하기 -->
    <div class="box2">
        <div class="addanimal">
            <div class="selectanimal">우리 아이는</div>
                <select name="animal" id="animal">
                   
                    <option class="uderline" value="선택" selected="selected">선택</option>
                    <option value="0">강아지</option>
                    <option value="1">고양이</option>
                    <option value="2">새</option>
                    <option value="3">파충류</option>
                    <option value="4">패럿</option>
                    <option value="5">토끼</option>
                    <option value="6">햄스터</option>
                    <option value="7">그 외</option>
                </select>
            
            <div class="selectprice">몸무게는요</div>
             <!-- 강아지 무게 -->
                <select name="상세정보" id="selectbox" class="dog_weight">
                    
                    <option value="40000">1 ~ 5kg 1박 40000원</option>
                    <option value="80000">6 ~ 10kg 1박 80,000원</option>
                    <option value="120000">11 ~ 15kg 1박 120,000원</option>
                    <option value="150000">16 ~ 20kg 1박 150,000원</option>
                    <option value="180000">20kg 이상 1박 180,000원</option>
                </select>
                
            <!-- 고양이 무게 -->
                <select name="상세정보" id="selectbox" class="cat_weight">
                    
                    <option value="30000">1 ~ 5kg 1박 30000원</option>
                    <option value="60000">6 ~ 10kg 1박 60,000원</option>
                    <option value="80000">10kg 이상 1박 80,000원</option>
                </select>
                
            <!-- 새 무게 -->
                <select name="상세정보" id="selectbox" class="bird_weight">
                    
                    <option value="20000">1 ~ 3kg 1박 20000원</option>
                </select>

            <!-- 파충류 무게 -->
                <select name="상세정보" id="selectbox" class="reptile_weight">
                    
                    <option value="20000">1 ~ 5kg 1박 20000원</option>
                    <option value="40000">5 ~ 10kg 1박 40000원</option>
                    <option value="60000">10 ~ 15kg 1박 60000원</option>
                    <option value="80000">15kg 이상 1박 80000원</option>
                </select>


             <!-- 패럿 무게  -->
                <select name="상세정보" id="selectbox" class="Farad_weight">
                    
                    <option value="20000">1 ~ 3kg 1박 20000원</option>
                    <option value="40000">3 ~ 6kg 1박 40000원</option>
                </select>


            <!-- 토끼 무게 -->
                <select name="상세정보" id="selectbox" class="rabbit_weight">
                    
                    <option value="20000">1 ~ 3kg 1박 20000원</option>
                    <option value="40000">3 ~ 6kg 1박 40000원</option>
                    <option value="60000">6 ~ 9kg 1박 60000원</option>
                    <option value="80000">10kg 이상 1박 80000원</option>
                </select>


            <!-- 햄스터 무게 -->
                <select name="상세정보" id="selectbox" class="hamster_weight">
                    
                    <option value="10000"> ~ 1kg 1박 10000원</option>
                    <option value="15000"> 1kg ~ 2kg 1박 15000원</option>
                </select>

            
            <!-- 그 외 몸무게 -->
                <select name="상세정보" id="selectbox" class="else_weight">
                    
                    <option value="20000">1 ~ 3kg 1박 20000원</option>
                </select>

                <button type="button" class="add" id="add" disabled="disabled" onclick="copyDiv()">추가하기</button>



                <!-- -----추가 시 뜨는 창----- -->
                 <!-- 무게창 고르면 display:flex 로 바꾸기  -->

                 <div id="parentadd" class="parentadd">

                    <!-- <div class='addinfo' id='addinfo'>
                        <div class='animal_info'>
                        <span class='animalname'>종류</span>
                        <span class='animalprice'>무게와 가격</span>
                        </div>
                        <div class='Xbtn'>
                        <img id='Xbtn' src='img/X_gray.png'><button id='remove_btn'></button></div>
                    </div> -->

                </div>

        </div>
        <div class="pickdate">
            
            <div class="datecontent">
                <label><img src="${pageContext.request.contextPath}/img/calender.png" alt="" class="calender_img">
                <input type="text" id="demo" name="demo" value="" readonly></label>
                <input type="hidden" id="book_checkin_date" name="book_checkin_date" readonly>
                <input type="hidden" id="book_checkout_date" name="book_checkout_date" readonly>
                <input type="hidden" id="nowdate" readonly>
            </div>

        </div>

<!-- 총 기간과 가격 -->
        <div class="buy">
        <input type="hidden" id="BUSINESS_PLACE_NUM_FK" name="BUSINESS_PLACE_NUM_FK" value="${hotelresult.business_place_num_pk}">
            <div id="totaldate" class="totaldate">
                
            </div>
            <div id="totaldate2" class="totaldate2">
                
            </div>
            <div class="pricetitle">가격</div>
            <div class="totalprice">
                <span id="pricecontent" class="pricecontent">0</span>
                <span class="pricewon">원</span>
            </div>
			<input type="hidden" name="book_charge" id="book_charge">
			
			<!-- 제출 버튼 -->
            <div class="reserbtnflex">
            <button type="submit" class="reservation_btn" onclick="reservation()">예약하기</button>
            <img src="${pageContext.request.contextPath}/img/reservationCart.png" alt="" class="cart">
            
        	</div>
    	</div>
    </div>
</form>

<!-- 호텔정보 / 사업자정보 / 리뷰 버튼 -->
    <div class="box3">
        <div class="Dtail_btn">
            <a href="#D1"><button class="HotelDtail_info_title" href="#D1">
                <span class="Hbtn_title">호텔정보</span>
            </button></a>
            <a href="#D2"><button class="Entrepreneur_info_title">
                <span class="Ebtn_title">사업자 정보</span>
            </button></a>
            <a href="#D3"><button class="review_info_title">
                <span class="Rbtn_title">리뷰</span>
            </button></a>
        </div>


<!-- 호텔 상세 정보 란 -->
        <a id="aa" name="D1">
            <article class="HotelDtail_box" >
                <div class="startHD">※<span>
                    ~ 
                </span>호텔/동물병원의 상세정보 입니다.※</div>

                <div class="HD_explain">
                    <span class="HDE">
                    ${hotelresult.business_workplace_detail}<br>
                    ${hotelresult.business_workplace_rule}
                    </span>
                </div>
                
                <div class="HDpic">호텔 이미지를 올리는 곳<br>현재 height는 auto 이기 때문에 아래처럼 올려지는 사진 크기대로 높이가 정해짐.
                
                <img src="${pageContext.request.contextPath}/img/business_place_img/${hotelresult.business_place_num_pk}/${hotelresult.business_place_num_pk}_1.png" alt="">
                </div>
            </article>
        </a>

<!-- 사업자 상세 정보 란 -->
    <a id="aa" name="D2">
        <article class="Entrepreneur_info_box">
            <div class="Einfotitle">▶사업자 정보</div>
            
            <div class="Entrepreneur_box">
                <table>
                    <tr id="Etr">
                        <td id="Etitle" class="ET">사업자</td>
                        <td class="ET">${ownerResult.user_name}</td>
                    </tr>
                    <tr id="Etr">
                        <td id="Etitle" class="ET">사업자 등록번호</td>
                        <td class="ET">${ownerResult.user_business_num}</td>
                    </tr>
                    <tr id="Etr">
                        <td id="Etitle" class="ET">E-mail</td>
                        <td class="ET">${hotelresult.business_email}</td>
                    </tr>
                    <tr>
                        <td id="Etitle" class="ET">영업 소재지</td>
                        <td class="ET">${hotelresult.business_addr} ${hotelresult.business_addrdetail}</td>
                    </tr>
                </table>

            <!-- GSP 들어가는 공간 -->
            </div>
            <div class="Hotel_map_title">⭐ 오시는 길</div>
            <div id="map" class="Hotel_map">
              
            </div>
            <input type="hidden" id="Hotel_address" name="Hotel_address" value="${hotelresult.business_addr} ${hotelresult.business_addrdetail}">
            <input type="hidden" id="Hotel_name" name="Hotel_name" value="${hotelresult.business_name}">

        </article>
    </a>

    
<!-- 유저가 올리는 리뷰 -->
<a id="aa" name="D3">
			<article class="review_info_box">

				<div class="Rtitle">
					▶리뷰
					<button id="go_reservation_info">리뷰 쓰러 가기</button>
				</div>


				<c:choose>
					<c:when test="${reviewResult != null and reviewResult.size()>0 }">
						<c:forEach items="${reviewResult}" var="reviewResult">
						<!-- 유저 리뷰와 관리인 답글 포함한 박스
                 			  유저 리뷰를 지으면 관리인 답글까지 같이 지워진다.
                 			  관리인이 답장을 달지 않았으면 
                 			 .replyBigbox display:none 으로 해놓기
            			-->
							<div class="Review_Reply">
							
								<div class="user_review_box">
									<div class="user_info">
										<span class="usernick">${reviewResult.review_nickname}</span> 
										<img class="user_from" src="${pageContext.request.contextPath}/img/카카오톡.png" alt="">
										<span class="user_date">${reviewResult.review_regdate}</span>

										<!-- 유저 리뷰 수정하는 버튼 -->
										<button id="modify_Review" class="Review_btn"
											onclick="modify()" title="수정하기">
											<img id="modi"
												src="${pageContext.request.contextPath}/img/modify_icon.png"
												alt="" class="MD">
										</button>

										<!-- 유저 리뷰 삭제하는 버튼 -->
										<button id="delete_Review" class="Review_btn" onclick="delete_review(this)" title="삭제하기">
											<img id="delete" src="${pageContext.request.contextPath}/img/delete.png" alt="" class="MD">
										</button>

										<br> <span class="user_pet"> 아이 종류: </span> <span
											class="user_pet_what">강아지</span>
									</div>

									<div id="Rbox" class="user_review">
										<!-- <div id="Rbox" class="user_title">여기는 리뷰제목입니다.</div> -->

										<div id="Rbox" class="user_contents">
											${reviewResult.review_contents}
											<c:choose>
												<c:when test="${reviewResult.review_file_systemname != null}">											
													<img src="${cp}/reviewfile/${reviewResult.review_file_systemname}" class="thumbnail">
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>											
										</div>
									</div>

									<!-- 유저가 올리는 사진 -->
									<div class="user_review_pic" id="URP">
										
									</div>

								</div>
					</div>

							<!-- 수정박스 -->
							<form id="review_modify_Form" method="post" action="/user/review_modifyAction.us" enctype="multipart/form-data">
								<div class="Mbox">
									<div class="flex_go">
										<div>
											<span id="user_pet_M" class="Mall"> 아이 종류:</span> 
											<span id="user_pet_what_M" class="Mall">강아지</span><br> 
											<span id="price_prod" class="Mall">무게와 가격</span>
										</div>

										<div class="btnbox">
											<button type="submit" class="CB" onclick="complete()">
												<img src="${pageContext.request.contextPath}/img/complete_btn.png" alt="" id="Mbtn" class="MCbtn">
											</button>
											<button type="button" class="CB" onclick="cancel()">
												<img src="${pageContext.request.contextPath}/img/Mdelete_btn.png" alt="" id="Dbtn" class="MCbtn">
											</button>
										</div>
									</div>
									<textarea name="Mnew_review" id="Mnew_review" cols="30" rows="10">${reviewResult.review_contents}</textarea>
									<input type="hidden" id="review_num" name="review_num" value="${reviewResult.review_num_pk}"> 
									<input type="hidden" id="business_place_num_pk" name="business_place_num_pk"value="${hotelresult.business_place_num_pk}">

									<!-- 사진 추가하면 사진이 담긴 자식 생성됨. -->
									
									<div class="modypic" id="ele">
										<c:forEach var="i" begin="0" end="1">
										<div class="file${i+1}_cont">

											<div style="float: left;">
												<input type="file" name="file${i+1}" id="file${i+1}" style="display: none;">
												<input type="hidden" name="filename" value="${i<files.size() ? files[i].orgname : ''}">
											</div>
											
											<c:forTokens items="${files[i].orgname}" delims="." var="token" varStatus="status">
												<c:if test="${status.last}">
													<c:if
														test="${token eq 'jpg' or token eq 'jpeg' or token eq 'png' or token eq 'gif' or token eq 'webp'}">
														<img src="${cp}/reviewfile/${files[i].systemname}" class="thumbnail">
													</c:if>
												</c:if>
											</c:forTokens>
										</div>
										</c:forEach>									
									</div>
									
									<div class="addpic">
										<a href="javascript:upload('file${1}')">파일 선택</a> 
										<span id="file${1}name"> ${i<files.size() ? files[0].orgname : "선택된 파일 없음"} </span>
										<div style="float: right; margin-right: 100px;">
											<a href="javascript:cancelFile('file${1}')">첨부 삭제</a>
										</div> 
										
<%-- 									<input type="file" name="file" id="file" href="javascript:upload('file${1}')">
										<input type="button" value="이미지 추가" id="addpic_btn" class="CaddB">
										<input type="button" value="이미지 삭제" href="javascript:cancelFile('file${1}')"> --%>
									</div>
								</div>
							</form>

							<!-- 관리인 리뷰 답장 -->
							<c:choose>
								<c:when test="${reviewResult.reply_contents != null}">
									<div class="replyBigbox">
										<img src="${pageContext.request.contextPath}/img/Ladder.png" alt="" class="ladder">
										<div class="reply_box">
											<div class="manager_info">
												<img
													src="${pageContext.request.contextPath}/img/manager_icon.png"
													alt="" class="manager_icon">
												<div class="manager_name">호텔의 작성자 아이디</div>
												<div class="manager_date">${reviewResult.reply_regdate}</div>
											</div>
											<div class="manager_Hotelname">${hotelresult.business_name}</div>
											<div class="manager_reply">
												${reviewResult.reply_contents}
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
	`								
								</c:otherwise>
							</c:choose>


							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div id="emty_review">
							<div id="ER">아직 리뷰가 없습니다.</div>
						</div>
					</c:otherwise>
				</c:choose>
			</article>
		</a>
    </div>

</body>
<!-- 문서수정할때는주석처리를 하고 진행하세요 -->
<%--     <c:choose>
        <c:when test="${sessionScope.loginUser eq null}">
            <script>
                alert("login후에 이용하세요.");
                window.location.href="/index.jsp"
            </script>
        </c:when>
    </c:choose>
 --%>
<%@ include file="../../footer/footer.jsp" %>


<script src="${pageContext.request.contextPath}/js/reservation.js"></script>
<script src="${pageContext.request.contextPath}/js/pc_header.js"></script>
<!-- <script src="script/test2.js"></script> -->
<!-- <script src="/plugins/moment/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script> -->

<!--        
        <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8371f82865e1a5caad2fb3821aba3a1a&libraries=services"></script>
<script>
var Hotel_address = document.getElementById('Hotel_address')
var Hotel_name = document.getElementById('Hotel_name')

console.log(Hotel_address.value)
console.log(Hotel_name.value)

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(Hotel_address.value, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+Hotel_name.value+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>


<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>

	function upload(name){
		$("#"+name).click();
	}
	//$(제이쿼리선택자).change(함수) : 해당 선택자의 요소에 변화가 일어난다면 넘겨주는 함수 호출
	$("[type='file']").change(function(e){
		//e : 파일이 업로드된 상황 자체를 담고있는 객체
		//e.target : 파일이 업로드가 된 input[type=file] 객체(태그객체)
		//e.target.files : 파일태그에 업로드를 한 파일 객체들의 배열
		let file = e.target.files[0];
		
		if(file == undefined){
			//$("#file1name")
			$("#"+e.target.id+"name").text("선택된 파일 없음");
			$("."+e.target.id+"_cont .thumbnail").remove();
		}
		else{
			$("#"+e.target.id+"name").text(file.name);
			
			//["QR","png"]
			let ext = file.name.split(".").pop();
			if(ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif' || ext == 'webp'){
				$("."+e.target.id+"_cont .thumbnail").remove();
				const reader = new FileReader();
				
				reader.onload = function(ie){
					const img = document.createElement("img");
					img.setAttribute("src",ie.target.result)
					img.setAttribute("class",'thumbnail');//<img src="???/QR.png" class="thumbnail">
					document.querySelector("."+e.target.id+"_cont").appendChild(img);
				}
				
				reader.readAsDataURL(file);
			}
			
		}
	});
	
	function cancelFile(name){
		if($.browser.msie){
			$("input[name="+name+"]").replaceWith( $("input[name="+name+"]").clone(true) );
		}
		else{
			$("input[name="+name+"]").val("");
		}
		$("#"+name+"name").text("선택된 파일 없음");
		$("."+name+"_cont .thumbnail").remove();
		$("#"+name+"name").next().val("");
		
	};
	
</script>

<script>

    if($("#parentadd").val()==""){
        book_charge = 0;
        fullcharge = 0;
    }
function removethis(i){
    // 총가격과 #thisprice+i 의 value 값을 parseint 로 변환해 빼어 계산한다.
    console.log("삭제 한 상품 가격 :"+arrayprice[i]);
            let txttotalprice = document.getElementById("pricecontent");
            let nd = document.getElementById("nowdate");
            let xcount = parseInt(nd.value);

            let disprice = parseInt(arrayprice[i]);
            console.log(disprice);
            console.log(xcount);
            console.log(book_charge);
            
            console.log(book_charge+"-"+disprice+"*"+xcount);

            book_charge=book_charge-disprice*xcount;
            fullcharge= fullcharge-disprice;
            txttotalprice.innerHTML=book_charge;

            console.log(book_charge);
            console.log(fullcharge);

            


            


    // 담긴 상품들 어레이에서 삭제하기
    let idx = array.indexOf("bigadd"+i);
    while(idx>-1){
        array.splice(idx, 1);
        idx = array.indexOf("bigadd"+i);
    }

    
    console.log("\n");


    $(".bigadd"+i).remove();

    console.log(arraypet[i]);



        if(arraypet[i]=='고양이'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');

        }else if(arraypet[i]=='강아지'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');

        }else if(arraypet[i]=='그 외'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');
        }else if(arraypet[i]=='새'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');

        }else if(arraypet[i]=='파충류'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');

        }else if(arraypet[i]=='패럿'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');

        }else if(arraypet[i]=='토끼'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');

        }else if(arraypet[i]=='햄스터'){
            arraypet.splice(i,1);
            arraypet.splice(i,0,'삭제');

        }


    console.log(arraypet);

}
</script>


</html>