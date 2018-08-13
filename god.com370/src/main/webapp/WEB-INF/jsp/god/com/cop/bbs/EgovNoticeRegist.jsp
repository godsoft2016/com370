<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

      <hr class="m-0">

      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="notice">
        <div class="my-auto">
          <h2 class="mb-5"><c:out value='${bdMstr.bbsNm}'/> - 게시글쓰기</h2>

<script type="text/javascript">
_editor_area = "nttCn";
_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
</script>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
	function fn_egov_validateForm(obj) {
		return true;
	}

	function fn_egov_regist_notice() {
// 		document.board.onsubmit();


		var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);


		if(ntceBgnde > ntceEndde){
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}

		if (!validateBoard(document.board)){
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			//document.board.onsubmit();
			document.board.action = "<c:url value='/cop/bbs${prefix}/insertBoardArticle.do'/>";
			document.board.submit();
		}
	}

	function fn_egov_select_noticeList() {
		document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
		document.board.submit();
	}
	function makeFileAttachment(){
	<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
		 var maxFileNum = document.board.posblAtchFileNumber.value;
	     if(maxFileNum==null || maxFileNum==""){
	    	 maxFileNum = 3;
	     }
		 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
		 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	</c:if>
	}




</script>

<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />

<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />

<c:choose>
	<c:when test="${anonymous}">
	<input type="hidden" name="ntcrNm" value="dummy">	<!-- validator 처리를 위해 지정 -->
<!-- 	<input type="hidden" name="password" value="dummy">	validator 처리를 위해 지정 -->
	</c:when>
	<c:otherwise>
	<input type="hidden" name="ntcrNm" value="${user.name}">	
	<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
	</c:otherwise>
</c:choose>

<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
   <input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
   <input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
</c:if>

	<table class="table table-bordered">
	  <tr>
	    <th><spring:message code="cop.nttSj" />*</th>
	    <td colspan="3">
	      <input name="nttSj" type="text" value=""  maxlength="60" title="제목입력" class="form-control">
	      <br/><form:errors path="nttSj" />
	    </td>
	  </tr>
	  <tr>
	    <th><spring:message code="cop.nttCn" />*</th>
	    <td colspan="3">
	      <textarea id="nttCn" name="nttCn" class="form-control" title="내용입력"></textarea>
	      <form:errors path="nttCn" />
	    </td>
	  </tr>
	  <c:choose>
	  	<c:when test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
		  <tr>
		    <th><spring:message code="cop.noticeTerm" />*</th>
		    <td colspan="3">
		      <input id="ntceBgnde" name="ntceBgnde" type="hidden" >
		      <input name="ntceBgndeView" type="text" size="10" value=""  readOnly
		      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" title="게시시작일자입력">
		      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"
		      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);"
			    width="15" height="15" alt="달력창팝업버튼이미지">
		      ~
		      <input id="ntceEndde" name="ntceEndde" type="hidden"  />
		      <input name="ntceEnddeView" type="text" size="10" value=""  readOnly
		      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);" title="게시종료일자입력">
		      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"
		      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);"
			    width="15" height="15" alt="달력창팝업버튼이미지">
			    <br/><form:errors path="ntceBgnde" />
			    <br/><form:errors path="ntceEndde" />

		    </td>
		  </tr>
	  	</c:when>
	  	
	  	<c:otherwise>
			<input name="ntceBgndeView" type="hidden" size="10" value="9999-12-31"  readOnly/>
			<input name="ntceEnddeView" type="hidden" size="10" value="9999-12-31"  readOnly/>
	  	</c:otherwise>
	  </c:choose>
	  <c:if test="${anonymous == 'true'}">
<!-- 		  <tr> -->
<%-- 		    <th height="23" class="emphasisRight"><spring:message code="cop.ntcrNm" /> --%>
<%-- 		    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th> --%>
<!-- 		    <td colspan="3"> -->
<!-- 		      <input name="ntcrNm" type="text" size="20" value="" maxlength="10" title="작성자이름입력"> -->
<!-- 		    </td> -->
<!-- 		  </tr> -->
		  <tr>
		    <th><spring:message code="cop.password" />*</th>
		    <td colspan="3">
		      <input name="password" type="password" value="" maxlength="20" title="비밀번호입력" class="form-control">
		    </td>
		  </tr>
	  	</c:if>

	  <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
	  <tr>
	    <th><spring:message code="cop.atchFile" /></th>
	    <td colspan="3">
<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력" class="form-control"/>
<div id="egovComFileList"></div>
	    </td>
	  </tr>

	  </c:if>
	</table>

  	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
      <c:if test="${bdMstr.authFlag == 'Y'}">
      <!--
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
	      <a href="javascript:fn_egov_regist_notice();"><spring:message code="button.create" /></a>
	      </td>
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	   -->
	  	  <td>
	  	  	<span class="button">
	  	  		<input type="button" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="javascript:fn_egov_regist_notice();return false;" class="btn btn-primary">
	  	  	</span>
	  	  </td>
	  	  <td width="10"></td>
      </c:if>
      <!--
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_select_noticeList();"><spring:message code="button.list" /></a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
       -->
      <td>
	  	  <span class="button">
	  	  	<input type="button" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_select_noticeList();return false;" class="btn btn-primary">
	  	  </span>
	  </td>
	</tr>
	</table>
	</div>
</form:form>

<script>
// 	$( document ).ready(function() {
	window.onload = function() {
// 		HTMLArea.init();
// 		HTMLArea.onload = initEditor;
		document.board.nttSj.focus();
		makeFileAttachment();
		location.href = '#notice';
	}
// 	});
</script>

        </div>
      </section>
