<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	#ticket_tb {
		heigth : 200px;
		background-color : #FBEFEF;
	}
	#ticket_tb .table {
		width : 730px;
		height: 212px;
		margin : 0 auto;
		color : black;
		text-align: center;
		border-collapse : collapse;
		table-layout: fixed;
	}
	#ticket_tb .table th {
		background : #eeb6a5;
		height : 15px;
		text-align: center;
	}
</style>
</head>
<body>
		<div id="ticket_tb">
			<table class="table">
				<tr>
					<th>No.</th>
					<th>일시</th>
					<th>갯수</th>
					<th>결제금액</th>
				</tr>
				<c:if test="${!empty thList }">
					<c:forEach items="${thList }" var="ticket">
						<tr>
							<td>${ticket.tNo }</td>
							<td>${ticket.tDate }</td>
							<td>${ticket.tPriceNo }</td>
							<td>${ticket.tUseNo}원</td>
						</tr>
					</c:forEach>
					<!-- 페이징처리 -->
					<tr align="center" height="20">
						<td colspan="4">
							<!-- 이전 -->
							<c:if test="${pi.currentPage <= 1 }">
								[이전]&nbsp;
							</c:if>
							<c:if test="${pi.currentPage > 1 }">
								<c:url var="before" value="healthTicketList.do">
									<c:param name="page" value="${pi.currentPage - 1 }"/>
								</c:url>
								<a href="${before }" style="color : black;">[이전]</a>&nbsp;
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<!-- 현재 선택된 페이지 -->
								<c:if test="${p eq pi.currentPage }">
									<font color="red">${p }</font>
								</c:if>
								<c:url var="pagination" value="healthTicketList.do">
									<c:param name="page" value="${p}"/>
								</c:url>
								<c:if test="${p ne pi.currentPage }">
									<a href="${pagination }" style="color : black;">${p }</a>&nbsp;
								</c:if>
							</c:forEach>	
							
							<!-- 다음 -->
							<c:if test="${pi.currentPage >= pi.maxPage }">
								&nbsp;[다음]
							</c:if>
							<c:if test="${pi.currentPage < pi.maxPage }">
								<c:url var="after" value="healthTicketList.do">
									<c:param name="page" value="${pi.currentPage + 1 }"/>
								</c:url>
								<a href="${after}" style="color : black;">&nbsp;[다음]</a>
							</c:if>
						</td>
					</tr>
				</c:if>
				<c:if test="${empty thList }">
					<tr>
						<td colspan="4">조회된 정보가 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
</body>
</html>