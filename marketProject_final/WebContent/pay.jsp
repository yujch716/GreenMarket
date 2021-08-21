<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
var IMP = window.IMP;
IMP.init('imp45573328'); //부여받은 가맹점 식별코드 -> 수정X

IMP.request_pay({
    pg : 'html5_inicis', 
    pay_method : 'vbank',
  	//앞 페이지에서 결제수단을 선택하면 'card'부분이 변경되도록 해야함
  	//카드결제 : card , 실시간 계좌이체 : trans , 무통장입금 : vbank , 휴대폰 소액결제 : phone , 삼성페이 : samsung 
  	
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : ${param.price},
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {  //결제완료후 뜨는 팝업창
        var msg = '결제가 완료되었습니다.';
        msg += '결제 금액 : ' + rsp.paid_amount;
        location.href = 'mainPage.jsp';
        /* 
       	//쓸 필요가 없음
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '카드 승인번호 : ' + rsp.apply_num;
		 */
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
</script>
</body>
</html>