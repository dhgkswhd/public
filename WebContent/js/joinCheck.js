function join( f ) {
	var    	 	  id = f.id.value;			 // 파라미터 ID
	var  	  	 pwd = f.pwd.value;  		 // 파라미터 pwd
	var 	    pwd2 = f.pwd_check.value; 	 // 파라미터 pwd 확인
	var  phonenumber = f.phone_number.value; // 파라미터 연락처
	var   membertype = f.membertype.value; 	 // 파라미터 회원가입 유형
	
	if (membertype == '사업자') {
		var	    b_number = f.b_number.value; 	 // 파라미터 사업자등록번호
		var b_mutualname = f.b_mutualname.value; // 파라미터 상호명
		
		// 빈칸 있는지 검사
		if ( id == "" || pwd == "" || pwd2 == "" || phonenumber == "" ||
				b_number == "" || b_mutualname == "" ) {
			alert("필수정보를 모두 입력해야합니다.");
			return;
		}
	} else {
		if ( id == "" || pwd == "" || pwd2 == "" || phonenumber == "" ) {
			alert("필수정보를 모두 입력해야합니다.");
			return;
		}
	}
	
	// ID 유효성검사
	if ( id.indexOf(" ") >= 0 ) {
		alert("아이디에 공백을 사용할 수 없습니다.");
		return;
	}
	
	for ( i = 0; i < id.length; i++ ) {
        var ch = id.charAt(i);
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 영어 대소문자, 숫자만 입력가능합니다.");
            return;
        }
    }
	
	if ( id.length < 4 || id.length > 12 ) {
		alert("아이디는 4 ~ 12자로 입력하세요.");
		return;
	}
	
	// 비밀번호 유효성검사
	if ( pwd.length < 8 || pwd.length > 20 ) {
		alert("비밀번호는 8 ~ 20자로 입력하세요.");
		return
	} 
	
	if ( pwd !=  pwd2 ) {
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
	
	if ( !(/^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/.test( pwd )) ) {
		alert("비밀번호는 숫자와 영문을 혼용하여야합니다");
		return;
	}
	
	// 휴대폰번호 유효성검사
	if ( !(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/.test( phonenumber )) ) {
		alert("휴대폰번호를 정확히 입력해주세요.");
		return;
	}
	
	/** 사업자등록번호는 복잡해서 유효성검사를 하지 않았음 */
	
	/** 상호명 중복검사 하지 않았음 */
	
	var type = document.getElementsByName("membertype")[0].value;
	
	if (confirm("회원가입 하시겠습니까?")) {
		alert( membertype + "회원으로 가입이 완료되었습니다." );
	}
	
	f.submit();
}