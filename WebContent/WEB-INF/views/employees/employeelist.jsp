<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		//사진보기 버튼에 대한 click 이벤트 등록
		$(".btn-picture").on("click", function() {
			//이름 확인
			var name = $(this).parent().text();
			name = name.slice(0, name.indexOf("/")-1);
			//전화번호 확인
			var phone = $(this).parents("tr").find("td:eq(3)").text();
			//파일이름 확인
			var filename = $(this).val();
			//이름,전화번호 정보 출력
			$("#pictureModal h4").text("["+name+"/"+phone+"] 사진");
			//사진 정보 출력
			$("#pictureModal img").attr("src", "${pageContext.request.contextPath}/resources/pictures/"+filename);
		});
		
		$('[data-toggle="tooltip"]').tooltip(); 
		
		$("#key option[value='${key}']").attr("selected", "selected");
        $("#value").val('${value}');
        
        // 사진 등록 버튼에 대한 click 이벤트 등록
        $(".btn-picture-form").on("click", function() {
        	var empId = $(this).parents("tr").find("td:eq(0)").text();
        	var name = $(this).parents("tr").find("td:eq(1)").text();
        	name = name.slice(0, name.indexOf("/")-1);
        
        	// 번호, 이름 정보 출력
        	$("#pictureFormModal #empId").val(empId);
        	$("#pictureFormModal #content").val(name);
        	
        	// 사진 존재 유무 -> hidden 태그
        	$("#pictureFormModal #pictureCount").val($(this).val());
        });
        
        // 삭제 버튼에 대한 click 이벤트 등록
        $(".btnDelete").on("click", function() {
        	var empId = $(this).parents("tr").find("td:eq(0)").text();
        	var name = $(this).parents("tr").find("td:eq(1)").text();
        	name = name.slice(0, name.indexOf("/")-1);
        	// 번호, 이름 정보 출력
        	$("#employeeDeleteModal #empId").val(empId);
        	$("#employeeDeleteModal #name_").val(name);
        });
        

		// 수정 버튼에 대한 click 이벤트 등록
		$(".btnUpdate").on("click", function() {
			
			// 직원 번호를 서버에 전송하는 과정 추가
			// -> submit 액션 or Ajax or Get 방식 전송
			// -> 요청주소는 /employee/updateForm 이 된다.
			window.location.assign("${pageContext.request.contextPath}/employee/updateForm?empId="+$(this).val());
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
					<li class="active"><a
						href="${pageContext.request.contextPath}/employee/list">직원 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/region/list">지역
							관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/department/list">부서
							관리</a></li>
					<li><a href="${pageContext.request.contextPath}/position/list">직위
							관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/pw">관리자
							관리</a></li>

					<li><a href="${pageContext.request.contextPath}/login/logout">[admin]로그
							아웃</a></li>
				</ul>
			</div>
		</nav>

		<div class="panel-group" id="output">
			<div class="panel panel-default">
				<div class="panel-heading">직원 출력</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=empId" data-toggle="tooltip" data-placement="top" title="사번 기준 정렬">사번</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=name_" data-toggle="tooltip" data-placement="top" title="이름 기준 정렬">이름/사진</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=ssn" data-toggle="tooltip" data-placement="top" title="주민번호 기준 정렬">주민번호</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=phone" data-toggle="tooltip" data-placement="top" title="전화번호 기준 정렬">전화번호</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=hiredate" data-toggle="tooltip" data-placement="top" title="입사일 기준 정렬">입사일</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=reg_name" data-toggle="tooltip" data-placement="top" title="지역명 기준 정렬">지역명</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=dept_name" data-toggle="tooltip" data-placement="top" title="부서명 기준 정렬">부서명</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=job_title" data-toggle="tooltip" data-placement="top" title="직위명 기준 정렬">직위명</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=basicpay" data-toggle="tooltip" data-placement="top" title="기본급 기준 정렬">기본급</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=extrapay" data-toggle="tooltip" data-placement="top" title="수당 기준 정렬">수당</a></th>
								<th><a
									href="${pageContext.request.contextPath}/employee/list?key=${key}&value=${value}&order=pay" data-toggle="tooltip" data-placement="top" title="급여 기준 정렬">급여</a></th>
								<th>사진등록</th>
								<th>삭제/수정</th>
							</tr>
						</thead>
						<tbody>
							<!-- 
							<tr>
								<td>EMP001</td>
								<td>홍길동/
									<button type="button" class="btn btn-default btn-xs"
										data-toggle="modal" data-target="#myModal">사진</button>
								</td>
								<td>901010-1122345</td>
								<td>010-123-1234</td>
								<td>1998-10-11</td>
								<td>서울</td>
								<td>개발부</td>
								<td>사원</td>
								<td>2,000,000</td>
								<td>1,000,000</td>
								<td>3,000,000</td>
								<td><button type="button" class="btn btn-default btn-xs">사진등록</button></td>
								<td><button type="button" class="btn btn-default btn-xs">삭제</button>/
									<button type="button"
										class="btn btn-default btn-xs  btnUpdateForm">수정</button></td>
							</tr>
							 -->
							<c:forEach var="e" items="${list}">
								<tr>
									<td>${e.empId}</td>
									<td>${e.name_} <button type="button" class="btn btn-default btn-xs btn-picture"
										data-toggle="modal" data-target="#pictureModal" value="${e.filename}" ${e.pictureCount==0 ? "disabled='true'":""}>사진</button></td>
									<td>${e.ssn}</td>
									<td>${e.phone}</td>
									<td>${e.hiredate}</td>
									<td>${e.reg_name}</td>
									<td>${e.dept_name}</td>
									<td>${e.job_title}</td>
									<td><fmt:formatNumber value="${e.basicpay}" groupingUsed="true"/></td>
									<td><fmt:formatNumber value="${e.extrapay}" groupingUsed="true"/></td>
									<td><fmt:formatNumber value="${e.pay}" groupingUsed="true"/></td>
									<td><button type="button" class="btn btn-default btn-xs btn-picture-form" data-toggle="modal" data-target="#pictureFormModal" value="${e.pictureCount}">사진등록</button></td>
									<!-- 삭제 버튼은 활성, 비활성 표시 필요 -->
									<td><button type="button"
											class="btn btn-default btn-xs btnDelete" data-toggle="modal" data-target="#employeeDeleteModal">삭제</button>/
									<button type="button"
											class="btn btn-default btn-xs btnUpdate" value="${e.empId}">수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<form action="${pageContext.request.contextPath}/employee/list" class="form-inline" role="form" method="post">
						<a href="${pageContext.request.contextPath}/employee/insertForm"
							class="btn btn-default">직원등록</a>
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge">${totalCount}</span>
						</button>
						<button type="button" class="btn btn-default">
							Count <span class="badge">1</span>
						</button>
						<select class="form-control" id="key" name="key">
							<option value="empId">번호</option>
							<option value="name_">이름</option>
							<option value="reg_name">지역</option>
							<option value="dept_name">부서</option>
							<option value="job_title">직위</option>
						</select> <label for="name"></label> <input type="text"
							class="form-control" id="value" name="value" required="required">
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span> Search
						</button>
					</form>
				</div>
			</div>
		</div>

		<div id="pictureModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">사진</h4>
					</div>
					<div class="modal-body">
						<div style="text-align: center;">
							<img id="modal-picture"
								src="${pageContext.request.contextPath}/resources/pictures/avatar.png"
								width="100%">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 직원 정보 삭제용 모달 -->
		<div id="employeeDeleteModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">직원 정보 삭제</h4>
					</div>
					<div class="modal-body">
						현재 직원 정보를 삭제할까요?
						<form
							action="${pageContext.request.contextPath}/employee/delete"
							method="POST">
							<div class="form-group">
								<input type="text" class="form-control" id="empId" name="empId" value="" readonly="readonly" placeholder="EMPID">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="name_" name="name_" value="" readonly="readonly" placeholder="NAME">
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
		
		<!-- 사진 업로드용 모달 -->
		<div id="pictureFormModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-md">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">사진업로드</h4>
					</div>
					<div class="modal-body">
						<form
							action="${pageContext.request.contextPath}/employee/fileUpload"
							method="POST" enctype="multipart/form-data">
							
							<!-- 사진 유무 확인 정보 -->
							<input type="hidden" id="pictureCount" name="pictureCount" value="">
							<div class="form-group">
								<input type="text" class="form-control" id="empId" name="empId" value="" readonly="readonly" placeholder="EMPID">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="content" name="content" value="" readonly="readonly" placeholder="CONTENT">
							</div>
							<div class="form-group">
								<input type="file" name="filename" class="form-control">
								<span class="help-block">(.jpg or .png, max 5M)</span>
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
	</div>
</body>
</html>