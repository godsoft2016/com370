<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/bbs/"/>

<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
<!--
	function press(event) {
	}

	function fn_egov_addNotice() {
	}

	function fn_egov_select_noticeList(pageNo) {
	}

	function fn_egov_inqire_notice(nttId, bbsId) {
	}
//-->
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
<!--
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}

	function fn_egov_addNotice() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
		document.frm.method = 'get';
		document.frm.submit();
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_inqire_notice(nttId, bbsId) {
		 if(bbsId == "") return false; //20150508
		 document.submitParam.nttId.value = nttId;
		 document.submitParam.bbsId.value = bbsId;
		 document.submitParam.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
		 document.submitParam.submit();
	}
//-->
</script>
</c:otherwise>
</c:choose>

      <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="${boardVO.bbsId}">
        <div class="my-auto">
          <h2 class="mb-5"><c:out value="${brdMstrVO.bbsNm}"/></h2>

<form name="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
<input type="hidden" name="nttId"  value="0" />
<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

  <div class="form-row align-items-center">
    <div class="col-auto">
      <label class="sr-only" for="searchCnd"></label>
<select name="searchCnd" id="searchCnd" class="form-control" placeholder="검색조건선택">
<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
<c:if test="${anonymous != 'true'}">
<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
</c:if>
</select>
    </div>
    <div class="col-auto">
      <label class="sr-only" for="searchWrd"></label>
      <input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" placeholder="검색어 입력" class="form-control mb-2">
    </div>
    <div class="col-auto">
      <button type="submit" class="btn btn-primary mb-2" onclick="fn_egov_select_noticeList('1'); return false;"><spring:message code="button.inquire" /></button>
      <c:if test="${brdMstrVO.authFlag == 'Y'}">
        <a href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>" onClick="javascript:fn_egov_addNotice(); return false;" class="btn btn-secondary mb-2"><spring:message code="button.create" /></a>
      </c:if>
    </div>
  </div>
</form>

<table class="table table-bordered" summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수   입니다">
 <thead>
  <tr>
    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
    <th scope="col" style="width: 10%;">번호</th>
    <th scope="col" style="width: 44%;">제목</th>
   	<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
	    <th scope="col" style="width: 20%;">게시시작일</th>
	    <th scope="col" style="width: 20%;">게시종료일</th>
   	</c:if>
   	<c:if test="${anonymous != 'true'}">
    	<th scope="col" style="width: 20%;">작성자</th>
    </c:if>
    <th scope="col" style="width: 15%;">작성일</th>
    <th scope="col" style="width: 8%;">조회수</th>
  </tr>
 </thead>

 <tbody>
 	<form name="submitParam" method="post">
	 	<input type="hidden" name="bbsId"  />
		<input type="hidden" name="nttId"  />
 	</form>
	 <c:forEach var="result" items="${resultList}" varStatus="status">
	  <tr>
	    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
	    <td scope="row"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	    <td class="listLeft" nowrap>
	    	<c:choose>
	    		<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
			    	<c:if test="${result.replyLc!=0}">
			    		<c:forEach begin="0" end="${result.replyLc}" step="1">
			    			&nbsp;
			    		</c:forEach>
			    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
			    	</c:if>
	    			<c:out value="${result.nttSj}" />
	    		</c:when>
	    		<c:otherwise>
		    		<form name="subForm" method="get" action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>">
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				    	<c:if test="${result.replyLc!=0}">
				    		<c:forEach begin="0" end="${result.replyLc}" step="1">
				    			&nbsp;
				    		</c:forEach>
				    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
				    	</c:if>
			    		<span class="link">
<%-- 			    			<a href="#"  onclick="fn_egov_inqire_notice('${result.nttId}', '${result.bbsId }');"><c:out value="${result.nttSj}"/></a> --%>
			    			<a href="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>?nttId=${result.nttId}&bbsId=${result.bbsId}#notice"><c:out value="${result.nttSj}"/></a>
			    		</span>
			    	</form>
	    		</c:otherwise>
	    	</c:choose>
	    </td>
    	<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
		    <td class="listCenter" nowrap><c:out value="${result.ntceBgnde}"/></td>
		    <td class="listCenter" nowrap><c:out value="${result.ntceEndde}"/></td>
    	</c:if>
    	<c:if test="${anonymous != 'true'}">
	    	<td class="listCenter" nowrap><c:out value="${result.frstRegisterNm}"/></td>
	    </c:if>
	    <td class="listCenter" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
	    <td class="listCenter" nowrap><c:out value="${result.inqireCo}"/></td>
	  </tr>
	 </c:forEach>
	 <c:if test="${fn:length(resultList) == 0}">
	  <tr>
    	<c:choose>
    		<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
    			<td class="listCenter" colspan="7" ><spring:message code="common.nodata.msg" /></td>
    		</c:when>
    		<c:otherwise>
    			<c:choose>
    				<c:when test="${anonymous == 'true'}">
		    			<td class="listCenter" colspan="4" ><spring:message code="common.nodata.msg" /></td>
		    		</c:when>
		    		<c:otherwise>
		    			<td class="listCenter" colspan="5" ><spring:message code="common.nodata.msg" /></td>
		    		</c:otherwise>
		    	</c:choose>
    		</c:otherwise>
    	</c:choose>
 		  </tr>
	 </c:if>
 </tbody>
</table>

<div align="center">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
</div>

        </div>
      </section>

<script>
// 	$( document ).ready(function() {
	window.onload = function() {
		location.href = '#${boardVO.bbsId}';
	}
// 	});
</script>
