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
IMP.init('imp45573328'); //�ο����� ������ �ĺ��ڵ� -> ����X

IMP.request_pay({
    pg : 'html5_inicis', 
    pay_method : 'vbank',
  	//�� ���������� ���������� �����ϸ� 'card'�κ��� ����ǵ��� �ؾ���
  	//ī����� : card , �ǽð� ������ü : trans , �������Ա� : vbank , �޴��� �Ҿװ��� : phone , �Ｚ���� : samsung 
  	
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '�ֹ���:�����׽�Ʈ',
    amount : ${param.price},
    buyer_email : 'iamport@siot.do',
    buyer_name : '�������̸�',
    buyer_tel : '010-1234-5678',
    buyer_addr : '����Ư���� ������ �Ｚ��',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {  //�����Ϸ��� �ߴ� �˾�â
        var msg = '������ �Ϸ�Ǿ����ϴ�.';
        msg += '���� �ݾ� : ' + rsp.paid_amount;
        location.href = 'mainPage.jsp';
        /* 
       	//�� �ʿ䰡 ����
        msg += '����ID : ' + rsp.imp_uid;
        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
		 */
    } else {
        var msg = '������ �����Ͽ����ϴ�.';
        msg += '�������� : ' + rsp.error_msg;
    }
    alert(msg);
});
</script>
</body>
</html>