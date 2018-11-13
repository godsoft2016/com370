<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form:form commandName="tableVO" method="get">

<form:input path="columnNm1"/>

<input type="submit" value="검색">
<input type="reset" value="취소">

</form:form>

<!-- <form method="post"> -->
<%-- <input type="text" name="columnNm1" value="${tableVO.columnNm1}"> --%>
<!-- <input type="submit" value="검색"> -->
<!-- <input type="reset" value="취소"> -->

<a href="${pageContext.request.contextPath}/table/insertTableForm.do">등록</a>

<table border="1">

<c:forEach items="${results}" var="item">

<tr>
	<td><a href="${pageContext.request.contextPath}/table/insertTableForm.do?multi=update&tableId=${item.tableId}">${item.tableId}</a></td>
	<td><a href="insertTableForm.do?multi=update&tableId=${item.tableId}">${item.tableId}</a></td>
	<td><a href="deleteTable.do?tableId=${item.tableId}" onclick="return btnDelete(this);">삭제</a></td>
	<td><a href="delete2Table.do?tableId=${item.tableId}" onclick="return btnDelete(this);">완전삭제</a></td>
</tr>

</c:forEach>

</table>

<!-- </form> -->

<script type="text/javascript">
function btnDelete(_this) {
	console.log('_this', _this);
	console.log('_this.href', _this.href);
	if (confirm('삭제하시겠습니까?')) {
		return true;
	} else {
		return false;
	}
}
</script>

</body>
</html>