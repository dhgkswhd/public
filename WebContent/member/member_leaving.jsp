<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		<script>
		function leaving ( f ) {
			var	  ages = f.ages.value.substring(0,2); // 연령대
			var reason = f.reason.value.trim();
			
			if ( (isNaN(ages)) ) {
				alert("연령대를 선택해주세요");
				return;
			}
			
			if ( reason.length > 100 ) {
				alert("100자이내로 입력해주세요");
				return;
			}
			
			if ( confirm("정말 탈퇴하시겠습니까?") ) {
				alert("회원탈퇴가 정상적으로 처리되었습니다. 그동안 이용해주셔서 감사합니다 (__)");
				location.href = "member_leaving_result.do?ages="
								+ ages + "&reason=" + reason;	
			}
		}
		
		</script>
		
		<style>
		fieldset dd {
			margin : 0;
			display : inline;
			font-size : 13px;
		}
		
		label {
			margin : 15px;
		}
		
		textarea {
			 margin : 15px 0 10px;
		}
		
		fieldset {
			text-align : center;
			position : absolute;
			top : 50%;
			left : 50%;
			width : 700px;
			height : 340px;
			overflow : hidden;
		    transform : translate(-50%, -50%);
		}
		</style>
	</head>
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<form method="POST"> 
			<fieldset>
			<legend><h3>회원탈퇴</h3></legend>
			<dl>
				<strong><dd>* 서비스 이용 중 불편사항은 언제든지 연락 주시면, 최선을 다해 해결 되도록 노력하겠습니다.</dd></strong><br>
				<strong><dd>* 회원 탈퇴 시 회원님의 개인정보, 거래내역 등은 모두 삭제 됩니다.</dd></strong>
			</dl>
			<div style="display:;">
				<dl>
					<dd>
						<label for="ages">* 연령대</label>
						<select class="f" name="ages" id="ages">
							<option>선택</option>
							<option>10대</option>
							<option>20대</option>
							<option>30대</option>
							<option>40대</option>
							<option>50대</option>
							<option>60대</option>
							<option>70대 이상</option>
						</select>
					</dd>
					<br>
					<dd>
						<label for="reason">* 리셀폰에 남기고 싶은 의견이 있으시면 기재해주세요 </label><br>
						<textarea name="reason" id="reason" cols="70px" rows="3px" placeholder="100자 이내 입력" style="resize: none;"></textarea>
					</dd>
					<br>
					<dd>
						* 탈퇴하신 회원님의 소중한 의견을 접수하여 더 나은 쇼핑몰이 되도록 노력하겠습니다.
					<dd>
				</dl>
				<div>
					<input class="btn" type="button" value="회원탈퇴" onclick="leaving(this.form)">
				</div>
			</div>
			</fieldset>
		</form>
	</body>
</html>