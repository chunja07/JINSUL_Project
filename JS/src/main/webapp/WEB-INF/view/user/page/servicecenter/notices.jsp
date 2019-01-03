<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lz0e8vpjrz5ApswJPUqL&submodules=geocoder"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/view/user/include/mainheader.jsp" />
<style>
	    body{ background-color: #fafafa; }
		header{ padding-top: 0px; border: 0px solid #fafafa; }
		ul{ list-style:none; }
		
</style>

<section id="servicecenter" style= margin-top: 170px; "> 
	<div id="wrap" style="color: #272829;">
		<div class="container row">
		  <div class="login_div">
		<div class="main_left col-md-3" 
		style="margin-bottom: -83px;
    	position: relative;
    	background: #fff;
    	border: 0.1px solid white;
    	box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
    	margin-left: 0px;
    	margin-top: 25px; 
    	border-radius: 15px;">
    
    
		<div class="login_div" >
		<ul style=" margin-bottom: -72px;">
		<h2 style="color: #387cb8; font-size: 20px; ">정보</h2>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/company_info">회사소개</a></li>
		<h2 style="color: #387cb8; font-size: 20px; ">법무</h2>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/policy">개인정보정책</a></li>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/tos">이용약관</a></li>
		<h2 style="color: #387cb8; font-size: 20px; ">고객센터</h2>	
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/notice">공지·건의사항</a>
		
		</li><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</ul>
		</div>
	</div>





			
			
		 
			<div class="main_right col-md-9">
<div class="items" style="margin-top: 25px; ">
				
			<div class="item" style="padding: 85px;
    margin-bottom: 22px;
    position: relative;
    background: #fff;
    border: 0.1px solid white;
    box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
    margin-left: 11px;
    margin-top: 19px;
    border-radius: 15px;">
			    	
			   <div class="noti_section">
    	           <div class="asd" style="font-size: 25px; color: #3f80ba; margin-bottom: 20px; ">
    	          	 	공지사항
    	           </div>
    	            
    	       <div class="area_cont">
                    <div class="qwe">
                        <table class="ewq">
                           
                            <colgroup>
                                <col style="width:710px">
                                <col style="width:150px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col"  style=" background-color: #3f80ba; color: white; " >내용</th>
                                <th scope="col"  style=" background-color: #3f80ba; color: white; width: 220px;">등록일</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach items="${notice}" var="list" varStatus="status">
	                            <tr>
		                            <td class="ta_left">
		                                <div class="inner_cell">
		                                    <span class="txt_public">
		                                        <a href="${pageContext.request.contextPath}/notices_info/${list.notice_id}" class="loss_word link_txt" style="color: #080808;">
		                                       		[공지]<sapn style="margin-left: 20px;"> ${list.notice_title}</sapn>
		                                        </a>
		                                       </span>
		                                </div>
		                            </td>
		                            <td>
		                            	<div class="inner_cell">${list.notice_date}</div>
		                            </td>
								</tr>
							</c:forEach>
							
                        	</tbody>
                    	</table>
                    		<legend class="screen_out" style="margin-top: 20px;"></legend>
                    	<!-- 페이징 시작 -->
                    	<div id="pasing" style="text-align: center">
							   <c:if test="${ page != 1 }">   
							      <a href="${pageContext.request.contextPath}/notice">처음</a>
							   </c:if>   
							
							   <c:if test="${ startPage != 1 }">   
							      <a href="${pageContext.request.contextPath}/notice?page=${startPage-1}">이전</a>
							   </c:if>      
							
							   <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							   <c:if test="${ i == page }" var="result">   
							      <b>${ i }</b>
							   </c:if>         
							   <c:if test="${ not result }">   
							      <a href="${pageContext.request.contextPath}/notice?page=${i}">${ i }</a>
							   </c:if>         
							   </c:forEach>
							
							   <c:if test="${ endPage != totalPage }">   
							      <a href="${pageContext.request.contextPath}/notice?page=${endPage+1}">다음</a>
							   </c:if>   
							
							   <c:if test="${ page != totalPage }">   
							      <a href="${pageContext.request.contextPath}/notice?page=${totalPage}">끝</a>
							   </c:if>      
							</div>
                    </div>
                   
				
  

                            <input type="hidden" id="currentPage" name="currentPage" value="1">
                            <input type="hidden" id="currentGroup" name="currentGroup" value="1">
                        </form>
                    </div>
                </div>
    	           
    	        </div>
			    	
			</div>




			
			<div class="item" style="    padding: 85px;
    margin-bottom: 22px;
    position: relative;
    background: #fff;
    border: 0.1px solid white;
    box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
    margin-left: 11px;
    margin-top: 30px;
    border-radius: 15px; ">
			
			  <div class="noti_section">
    	           <div class="asd" style="font-size: 25px; color: #3f80ba; margin-bottom: 20px; ">
    	          	 	건의사항
    	           </div>
    	            
    	           <div class="area_cont">
                    <div class="qwe">
                        <table class="ewq">
                          
                            <colgroup>
                                <col style="width:710px">
                                <col style="width:150px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col"  style=" background-color: #3f80ba; color: white; " >내용</th>
                                <th scope="col"  style=" background-color: #3f80ba; color: white; ">등록일</th>
                            </tr>
                             <c:forEach items="${user_question}" var="question" varStatus="status">
                            <tr>
	                            <td class="ta_left">
	                            	<a href="${pageContext.request.contextPath}/question_info/${question.question_id}" class="loss_word link_txt" style="color: #080808;">
                                   		[건의] <sapn style="margin-left: 20px;">${question.question_title}</sapn>
                                    </a>
	                            </td>
	                            <td>
	                             	${question.question_date}
	                            </td>
                            </tr>
                            </c:forEach>
                          
                                    
                            </thead>
                            </table>
                            <!-- 페이징 시작 -->
                    	<div id="pasing" style="text-align: center">
							   <c:if test="${ user_page != 1 }">   
							      <a href="${pageContext.request.contextPath}/notice">처음</a>
							   </c:if>   
							
							   <c:if test="${ user_startPage != 1 }">   
							      <a href="${pageContext.request.contextPath}/notice?question_page=${user_startPage-1}">이전</a>
							   </c:if>      
							
							   <c:forEach var="i" begin="${ user_startPage }" end="${ user_endPage }">
							   <c:if test="${ i == user_page }" var="result">   
							      <b>${ i }</b>
							   </c:if>         
							   <c:if test="${ not result }">   
							      <a href="${pageContext.request.contextPath}/notice?question_page=${i}">${ i }</a>
							   </c:if>         
							   </c:forEach>
							
							   <c:if test="${ user_endPage != user_totalPage }">   
							      <a href="${pageContext.request.contextPath}/notice?question_page=${user_endPage+1}">다음</a>
							   </c:if>   
							
							   <c:if test="${ user_page != user_totalPage }">   
							      <a href="${pageContext.request.contextPath}/notice?question_page=${user_totalPage}">끝</a>
							   </c:if>      
							</div>
                            <br>
                            <a href="${pageContext.request.contextPath}/question_input"><div class="login_btn">
                              <input type="button"  value="글쓰기">
                           </div></a>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                            </div>
                            </div>
                            </div>
                            
			
			

			
			

						</div>
			
			</div>	
		
	</div>
	</div>
			</div>
</section>
<jsp:include page="/WEB-INF/view/user/include/mainfooter.jsp"/>



