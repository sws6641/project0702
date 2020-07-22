<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!-- 동적인 페이지 포함 -->
<jsp:include page="./template/header.jsp" />

<style type="text/css">

	#container {
	/*   width: 1500px;
	  height: 600px;  */
	 /*  border: 1px solid #000; */
	  overflow: auto;
	   scroll-snap-type: y mandatory; 
	}
	.item {
	  display: flex;
	  height: 150%;
	  align-items: center;
	  justify-content: center;
	  font-size: 5em;
	  scroll-snap-align: start;
	}

</style>


<div class ="main-menu">  
	<div id="container">
	 <div class="item"> <img id="myImg1" src="<%=request.getContextPath() %>/resources/img/main.png" width ="800px" height ="600px"> </div> 
	 
	 </div>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="./template/footer.jsp" %>