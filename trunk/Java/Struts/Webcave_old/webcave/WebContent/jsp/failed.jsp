<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<!-- 
	<jsp:useBean id="MemberForm" class="fr.pascallinder.webcave.MemberForm" scope="session" />
-->


<html:html locale="false">
<head>
	<LINK REL="stylesheet" HREF="WebContent/css/webcave.css" TYPE="text/css">
	<META http-equiv="Content-Style-Type" content="text/css">
	<title><bean:message key="RegisterForm.titleDone" /></title>
</head>
<div id="container">
	<div id="intro">
		<div id="pageHeader">
			<h1>
				<span>Webcave</span>
			</h1>
			<h2>
				<span>The Beauty of <acronym title="Cascading Style Sheets">CSS</acronym> Design</span>
			</h2>
		</div>
		<div id="preamble">
			<p class="p1">
				<span>Sorry, registration failed</span>
			</p>
			<p class="p1">
				<span><a href="index.jsp">Back to the main page </a></span>
			</p>
		</div>
	</div>
</div>
</html:html>
