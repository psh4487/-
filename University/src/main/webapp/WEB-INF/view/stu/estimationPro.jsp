<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function() {
	$('#dataSubmit').click(function() {
		var form = document.subdata;
		var no1 = $('input[name=no1]:checked').val();
		var no2 = $('input[name=no2]:checked').val();
		var no3 = $('input[name=no3]:checked').val();
		var no4 = $('input[name=no4]:checked').val();
		var no5 = $('input[name=no5]:checked').val();
		var no6 = $('input[name=no6]:checked').val();
		var no7 = $('input[name=no7]:checked').val();
		var no8 = $('input[name=no8]:checked').val();
		var no9 = $('input[name=no9]:checked').val();
		var no10 = $('input[name=no10]:checked').val();
		var prof_say = $('input[name=prof_say]').val();
		console.log(no1);
		if (no1 == null) {
			alert("1�� ������ �����ϼ���.");
		} else if (no2 == null) {
			alert("2�� ������ �����ϼ���.");
		} else if (no3 == null) {
			alert("3�� ������ �����ϼ���.");
		} else if (no4 == null) {
			alert("4�� ������ �����ϼ���.");
		} else if (no5 == null) {
			alert("5�� ������ �����ϼ���.");
		} else if (no6 == null) {
			alert("6�� ������ �����ϼ���.");
		} else if (no7 == null) {
			alert("7�� ������ �����ϼ���.");
		} else if (no8 == null) {
			alert("8�� ������ �����ϼ���.");
		} else if (no9 == null) {
			alert("9�� ������ �����ϼ���.");
		} else if (no10 == null) {
			alert("10�� ������ �����ϼ���.");
		} else if (prof_say == "") {
			alert("�������� �ϰ���� ���� �Է��ϼ���.");
		} else {
			form.submit();
		}
	});
});
</script>

<body>
<span style="font-weight:bold">1. ���ǰ�ȹ���� ����ϰ� �����Ǿ� ���¼��ÿ� ������ �Ǿ���.</span><br>
			<input type="radio" name="no1" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no1" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no1" value="3">�����̴�&nbsp;
			<input type="radio" name="no1" value="4">�׷���&nbsp;
			<input type="radio" name="no1" value="5">�ſ�׷���&nbsp;<br><br>
		<span style="font-weight:bold">2. �����ڷᰡ ������ Ȱ��Ǿ� �н��� ������ �Ǿ���.</span><br>
			<input type="radio" name="no2" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no2" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no2" value="3">�����̴�&nbsp;
			<input type="radio" name="no2" value="4">�׷���&nbsp;
			<input type="radio" name="no2" value="5">�ſ�׷���&nbsp;<br><br>
		<span style="font-weight:bold">3. �� ������ ���������� �������� �� �Ǿ���.</span><br>
			<input type="radio" name="no3" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no3" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no3" value="3">�����̴�&nbsp;
			<input type="radio" name="no3" value="4">�׷���&nbsp;
	 		<input type="radio" name="no3" value="5">�ſ�׷���	&nbsp;<br><br>
		<span style="font-weight:bold">4. �������� �л����� ������ ������ �����Ͽ���.</span><br>
			<input type="radio" name="no4" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no4" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no4" value="3">�����̴�&nbsp;
			<input type="radio" name="no4" value="4">�׷���&nbsp;
			<input type="radio" name="no4" value="5">�ſ�׷���&nbsp;	<br><br>
		<span style="font-weight:bold">5. ����, ���� �� ���� ���� ������ �����Ͽ���.</span><br>
			<input type="radio" name="no5" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no5" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no5" value="3">�����̴�&nbsp;
			<input type="radio" name="no5" value="4">�׷���&nbsp;
			<input type="radio" name="no5" value="5">�ſ�׷���&nbsp;	<br><br>	
		<span style="font-weight:bold">6. ���� ������ ȿ�������� ���޵Ǿ� �����ϱ� ������.</span><br>
			<input type="radio" name="no6" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no6" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no6" value="3">�����̴�&nbsp;
			<input type="radio" name="no6" value="4">�׷���&nbsp;
			<input type="radio" name="no6" value="5">�ſ�׷���	&nbsp;<br><br>	
		<span style="font-weight:bold">7. �� ���Ǹ� ���Ͽ� �ش�о߿� ���� ����� ���� �ڱ��� �޾Ҵ�.</span><br>
			<input type="radio" name="no7" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no7" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no7" value="3">�����̴�&nbsp;
			<input type="radio" name="no7" value="4">�׷���&nbsp;
			<input type="radio" name="no7" value="5">�ſ�׷���&nbsp;<br>	<br>	
		<span style="font-weight:bold">8. �������� ���Ǹ� ������ ���Ǹ� �����Ͽ���.</span><br>
			<input type="radio" name="no8" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no8" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no8" value="3">�����̴�&nbsp;
			<input type="radio" name="no8" value="4">�׷���&nbsp;
			<input type="radio" name="no8" value="5">�ſ�׷���&nbsp;	<br><br>	
		<span style="font-weight:bold">9. �� ���Ǹ� �ٸ� �л����� ��õ�ϰ� �ʹ�.</span><br>
			<input type="radio" name="no9" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no9" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no9" value="3">�����̴�&nbsp;
			<input type="radio" name="no9" value="4">�׷���&nbsp;
			<input type="radio" name="no9" value="5">�ſ�׷���&nbsp;	<br><br>	
		<span style="font-weight:bold">10. �� ���Ǵ� ���������� �����Ͽ���. </span><br>
			<input type="radio" name="no10" value="1">�����ƴϴ�&nbsp;
			<input type="radio" name="no10" value="2">�ƴϴ�&nbsp;
			<input type="radio" name="no10" value="3">�����̴�&nbsp;
			<input type="radio" name="no10" value="4">�׷���&nbsp;
			<input type="radio" name="no10" value="5">�ſ�׷���&nbsp;<br><br>
		<span style="font-weight:bold">�������� �ϰ� ���� �� </span><br>
		<textarea rows="10" cols="60" name="prof_say" Placeholder="�������� �ϰ���� ���� �Է��ϼ���." style="resize:none;"></textarea><br><br>
		<input type="button" class="btn btn-dark"  value="����" id="dataSubmit">
</body>