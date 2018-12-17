<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 서식 지정 라이브러리 사용 가능 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>쌍용교육센터</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

		// 삭제 버튼에 대한 click 이벤트 등록
		$(".btnDelete").on("click", function() {
			var jobId = $(this).parents("tr").find("td:eq(0)").text();
			var job_title = $(this).parents("tr").find("td:eq(1)").text();
			// 번호, 이름 정보 출력
			$("#positionDeleteModal #jobId").val(jobId);
			$("#positionDeleteModal #job_title").val(job_title);
		});
		
		$(".btnUpdate").on("click", function() {
			$("#input .panel-heading").text("직위 수정");
			$("#input form").attr("action", "${pageContext.request.contextPath}/position/update");
			var jobId = $(this).parents("tr").find("td:eq(0)").text();
			var job_title = $(this).parents("tr").find("td:eq(1)").text();
			var minBasicPay = $(this).parents("tr").find("td:eq(2)").text();
			
			$("#jobId").val(jobId);
			$("#job_title").val(job_title);
			$("#minBasicPay").val(minBasicPay);
		});
	});
</script>

</head>
<body>
	<div class="container">
		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<!-- 주의) 상대경로 대신 절대경로 표기를 권장한다. -->
				<a href="${pageContext.request.contextPath}/employee/list"> <img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 직원관리 <small>by ServletMVC</small>
			</h1>

		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li><a
						href="${pageContext.request.contextPath}/employee/list">직원 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/region/list">지역
							관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/department/list">부서
							관리</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/position/list">직위
							관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/pw">관리자
							관리</a></li>

					<li><a href="${pageContext.request.contextPath}/login/logout">[admin]로그
							아웃</a></li>

				</ul>
			</div>
		</nav>

		<%-- 성공 실패 메시지 출력 위치 --%>
        <c:if test="${param.result=='success'}">
            <div class="alert alert-success alert-dismissible fade in"
             	style="padding-top: 5px; padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;">
             	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             	<strong>Success!</strong> 요청한 작업이 처리되었습니다.</div>
        </c:if>
        <c:if test="${param.result=='fail'}">
            <div class="alert alert-danger alert-dismissible fade in"
             	style="padding-top: 5px; padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;">
             	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             	<strong>Fail!</strong> 요청한 작업이 처리되지 못했습니다.</div>
        </c:if>	

		<div class="panel panel-default" id="input">
			<div class="panel-heading">직위 입력</div>
			<div class="panel-body" id="demo">
				<form role="form"
					action="${pageContext.request.contextPath}/position/insert"
					method="post">
					<div class="form-group">
					 	<input type="text"	class="form-control" id="jobId" 
					 		name="jobId" placeholder="번호" readonly="readonly" value="">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="job_title"
							name="job_title" placeholder="직위명 (30자 이내)" maxlength="30"
							required="required">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="minBasicPay"
							name="minBasicPay" placeholder="최소기본급" required="required">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
		
		<div class="panel panel-default" id="output">
			<div class="panel-heading">직위 출력</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>직위명</th>
							<th>최소기본급</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<!-- 
						<tr>
							<td>1</td>
							<td>사원</td>
							<td>1,000,000</td>
							<td><button type="button"
									class="btn btn-default btn-xs  btnDelete">삭제</button></td>
							<td><button type="button"
									class="btn btn-default btn-xs  btnUpdate">수정</button></td>
						</tr>
 						-->
						<c:forEach var="j" items="${list}">
							<tr>
								<td>${j.jobId}</td>
								<td>${j.job_title}</td>
								<td>${j.min_basicPay}</td>
								<!-- 삭제 버튼은 활성, 비활성 표시 필요 -->
								<td><button type="button"
										class="btn btn-default btn-xs btnDelete" data-toggle="modal" data-target="#positionDeleteModal" ${j.count_==0 ? "":"disabled='true'"}>삭제</button></td>
								<td><button type="button"
										class="btn btn-default btn-xs btnUpdate">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


			</div>
		</div>
	</div>

	<!-- 직위 정보 삭제용 모달 -->
	<div id="positionDeleteModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">직위 정보 삭제</h4>
				</div>
				<div class="modal-body">
					현재 직위 정보를 삭제할까요?
					<form
						action="${pageContext.request.contextPath}/position/delete"
						method="POST">
						<div class="form-group">
							<input type="text" class="form-control" id="jobId" name="jobId" value="" readonly="readonly" placeholder="jobId">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="job_title" name="job_title" value="" readonly="readonly" placeholder="job_title">
						</div>
						<input type="submit" value="SUBMIT" class="btn btn-default">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
