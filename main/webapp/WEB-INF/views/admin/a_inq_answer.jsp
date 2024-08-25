<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/css/inquiry.css" %>
<%@ include file="/resources/css/inquirystyle.css" %>
<%@ include file="../include/admin_header.jsp"%>
<script data-cfasync="false" type="text/javascript"
src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>
<style>

</style>
<script>
$(function(){
	$("#btnMail").click(function(){
		setTimeout(() => {
			$("#frmMail").attr("action", "/admin/adminInquiry");
			$("#frmMail").attr("method", "get");
			$("#frmMail").submit();
		}, 10000);
	});
});
</script>
<h1>1:1 문의</h1>
 <head>
 	<meta name="viewport" content="widtgh=device-width, initial-scale-1.0">
 	<meta name="description" content="contact form example">
 </head>
 
 <body>
 <div class="row">
 	<div class="col-md-3"></div>
 	<div class="col-md-6">
  <form id="frmMail" class="gform pure-form pure-form-stacked" method="POST" action="/admin/sendMail">
  
 	<input type="hidden" name="to" value="${inquiryVo.email}">
 	<input type="hidden" name="inquiry_no" value="${inquiryVo.inquiry_no}">
    <div class="form-elements">
		<fieldset class="pure-group">
			<label for="subject">제목 </label>
			<input id="subject" name="subject" class="form-control" placeholder="제목을 입력하세요" value="[re]${inquiryVo.inquiry_title}"/>
		</fieldset>


		<fieldset class="pure-group">
			<label for="content">답변내용 </label>
			<textarea id="content" name="content" class="form-control" rows="10"
			placeholder="내용을 입력하세요">[re]${inquiryVo.inquiry_content}
------------------------------</textarea>
		</fieldset>

		<button id="btnMail" type="submit" class="button-success pure-button button-xlarge">
			<i class="fa fa-paper-plane"></i>&nbsp;답변 전송
		</button>
	</div>

    <!-- Customise the Thankyou Message People See when they submit the form: -->
	<div class="thankyou_message" style="display:none;">
    	<h2>답변 작성 및 송부가 완료되었습니다.</h2>
	</div>

	</form>
	</div>
 	<div class="col-md-3"></div>
</div>

 </body>