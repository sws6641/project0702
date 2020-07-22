<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<!-- AJAX 포함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

	var pw = 0;  /* 정규식에 맞지 않아도 성공하는 것을 방지하기위해 카운트 */
        
    function fn_setNewPw(f) {

	      if (f.m_Pw.value == '' || f.m_Pw2.value == '') {
	         swal("필수", "비밀번호와 비밀번호확인 모두 입력하셔야 합니다.", "warning"); // warning", "error", "success", "info"
	         return;
	      }

	      if (f.m_Pw.value != f.m_Pw2.value) {
	         swal("오류", "비밀번호와 비밀번호확인은 같아야합니다. 다시 확인해 주세요.", "error"); // warning", "error", "success", "info"
	         return;
	      }
	      if (pw != 0) {
	         swal("오류", "비밀번호를 확인하세요.", "error"); // warning", "error", "success", "info"
	         f.m_Pw.focus();
	         return;
	      }

	      f.action = 'setNewPw';
	      f.submit();
	}
    
      
      $(document).ready(function(){
    	  // 2. 비밀번호 체크
          //    8 ~ 20 사이의 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*)를 사용한다.
          //    각각 1개 이상 포함해야 한다.
          var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;
      	  
          $('#m_Pw').keyup(function(){
        	  if(regExpPW.test($('#m_Pw').val())){
        		  $('#pwCheckResult').text('비밀번호 사용 가능합니다.');
        		  $('#pwCheckResult').css('color', 'blue').css('font-weight', 'bold');
        	      pw = 0;
        	  }
        	  else{
        		  $('#pwCheckResult').text('4~20자, 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*) 포함');
        		  $('#pwCheckResult').css('color', 'gray');
        		  pw++;
        	  }
          });
          
          $('#m_Pw2').keyup(function(){
        	  if($('#m_Pw').val() != $('#m_Pw2').val()){
        		  $('#pwConfirmResult').text('비밀번호가 일치하지 않습니다.');
        		  $('#pwConfirmResult').css('color', 'gray');
        	  }
        	  else{
        		  $('#pwConfirmResult').text('비밀번호가 일치합니다.');
        		  $('#pwConfirmResult').css('color', 'blue').css('font-weight', 'bold');
        	  }
          });
          
      });

</script>

<style type="text/css">
	input[type=button] {
		background-color: rgb(195, 214, 155);
		border: none;
		color: black;
		padding: 5px 5px;
		text-decoration: none;
		display: inline-block;
		font-size: 13px;
		margin: 4px 2px;
		cursor: pointer;
	}
	
	input {
		margin: 5px;
	}
	
	#locker {
		width: 10%;
	}
	
	div label {
		text-align: left;
		padding-right: 10px;
	}
</style>

<div class="main-menu">
	<form method="post">

		<c:if test="${empty m_Id}">
			<script type="text/javascript">
				alert('일치하는 회원정보가 없습니다.');
				history.back();
			</script>
		</c:if>
		<c:if test="${not empty m_Id}">
			<p>
				<strong>${m_Id}</strong> 님 새로운 비밀 번호를 설정해 주세요.
			</p>

			<img id="locker" src=" resources/img/lock.png" alt="" />
			<div>
				<label>비밀번호 설정</label><input type="password" name="m_Pw" id="m_Pw"><br>
				<div>
					<span id="pwCheckResult"></span>
				</div>
				<label>비밀번호 확인</label><input type="password" name="m_Pw2" id="m_Pw2"><br>
				<div>
					<span id="pwConfirmResult"></span>
				</div>
				<input type="hidden" name="m_Id" value="${m_Id}"> <input
					type="button" value="비밀번호 바꾸기" onclick="fn_setNewPw(this.form)" />
			</div>

		</c:if>



	</form>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>