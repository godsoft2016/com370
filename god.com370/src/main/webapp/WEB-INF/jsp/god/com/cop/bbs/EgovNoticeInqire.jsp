<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

      <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="notice">
        <div class="my-auto">
          <h2 class="mb-5"><c:out value='${result.bbsNm}'/> - 글조회</h2>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_delete_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		if (confirm('<spring:message code="common.delete.msg" />')) {
			document.frm.action = "<c:url value='/cop/bbs${prefix}/deleteBoardArticle.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_moveUpdt_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		document.frm.action = "<c:url value='/cop/bbs${prefix}/forUpdateBoardArticle.do'/>";
		document.frm.submit();
	}

	function fn_egov_addReply() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addReplyBoardArticle.do'/>";
		document.frm.submit();
	}
</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/cop/cmt/selectCommentList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/stf/selectSatisfactionList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
	function fn_egov_addScrap() {
		document.frm.action = "<c:url value='/cop/scp/addScrap.do'/>";
		document.frm.submit();
	}
</script>
</c:if>

<form name="frm" method="post" action="">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >

	<table class="table table-bordered">
	  <tr>
	    <th>제목</th>
	    <td><c:out value="${result.nttSj}" />
	    </td>
	  </tr>
	  <tr>
	    <th>작성자</th>
	    <td>
	    <c:choose>
	    	<c:when test="${anonymous == 'true'}">
	    		******
	    	</c:when>
	    	<c:when test="${result.ntcrNm == null || result.ntcrNm == ''}">
	    		<c:out value="${result.frstRegisterNm}" />
	    	</c:when>
	    	<c:otherwise>
	    		<c:out value="${result.ntcrNm}" />
	    	</c:otherwise>
	    </c:choose>

	    </td>
	    <th>작성시간</th>
	    <td><c:out value="${result.frstRegisterPnttm}" />
	    </td>
	    <th>조회수</th>
	    <td><c:out value="${result.inqireCo}" />
	    </td>
	  </tr>
	  <tr>
	    <th>글내용</th>
	    <td colspan="5">
	     <div id="bbs_cn">
<c:out value="${result.nttCn}" escapeXml="false" />
	     </div>
	    </td>
	  </tr>
	  <c:if test="${not empty result.atchFileId}">
		  <c:if test="${result.bbsAttrbCode == 'BBSA02'}">
		  <tr>
		    <th>첨부이미지</th>
		    <td colspan="5">
					<c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
						<c:param name="atchFileId" value="${result.atchFileId}" />
					</c:import>
		    </td>
		  </tr>
		  </c:if>
		  <tr>
		    <th>첨부파일 목록</th>
		    <td colspan="5">
				<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>
		    </td>
		  </tr>
	  </c:if>
	  <c:if test="${anonymous == 'true'}">
	  <tr>
	    <th><spring:message code="cop.password" /></th>
	    <td colspan="5">
	    	<input name="password" type="password" size="20" value="" maxlength="20" title="비밀번호입력">
	    </td>
	  </tr>
	  </c:if>
	</table>

		     <c:if test="${result.frstRegisterId == sessionUniqId}">
			      <a href="javascript:fn_egov_moveUpdt_notice()" class="btn btn-primary">수정</a>
			      <a href="javascript:fn_egov_delete_notice()" class="btn btn-primary">삭제</a>
		     </c:if>
		     <c:if test="${result.replyPosblAt == 'Y'}">
			      <a href="javascript:fn_egov_addReply()" class="btn btn-primary">답글작성</a>
	          </c:if>
<!-- 		      <a href="javascript:fn_egov_select_noticeList('1')" class="btn btn-primary">목록</a> -->
		      <a href="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>?bbsId=${result.bbsId}#notice" class="btn btn-primary">목록</a>
<%-- 		      <c:if test="${useScrap == 'true'}"> --%>
<!-- 			      <a href="javascript:fn_egov_addScrap()" class="btn btn-primary">스크랩</a> -->
<%-- 	          </c:if> --%>

	<c:if test="${useComment == 'true'}">
	<c:import url="/cop/cmt${prefix}/selectCommentList.do" charEncoding="utf-8">
		<c:param name="type" value="body" />
	</c:import>
	</c:if>

	<c:if test="${useSatisfaction == 'true'}">
	<c:import url="/cop/stf${prefix}/selectSatisfactionList.do" charEncoding="utf-8">
		<c:param name="type" value="body" />
	</c:import>
	</c:if>

</form>

<script>
// 	$( document ).ready(function() {
	window.onload = function() {
		onloading();
		location.href = '#notice';
	}
// 	});
</script>

        </div>
      </section>
