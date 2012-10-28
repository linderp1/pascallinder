<%@ page language="java"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<head>
	<LINK REL="stylesheet" HREF="WebContent/css/webcave.css" TYPE="text/css">
	<META http-equiv="Content-Style-Type" content="text/css">
	<title>Webcave</title>
</head>
<body>
	<div id="container">
		<div id="intro">
			<div id="pageHeader">
				<h1>
					<span><bean:message key="Application.title" />Webcave</span>
				</h1>
				<h2>
					<span>The Beauty of <acronym title="Cascading Style Sheets">CSS</acronym> Design</span>
				</h2>
			</div>
			<div id="quickSummary">
				<p class="p2">
					Hello, Welcome the the Webcave application!<br>Manage your wine collection using this web application.
					<br><br>Design by <a href="http://www.pascallinder.fr">PaL</a>
				</p>
			</div>
			<div id="preamble">
				This is the main page.
				<br>
				<%--
Used for testing the DB connection only
      <html:link action="TestConnectAction">Show the winelist</html:link> 
--%>
				<html:link action="MemberAction">Login</html:link>	(Forgot your credentials?)
				<br>
				<html:link action="RegisterAction">Register</html:link>
			</div>
		</div>
		
		<div id="supportingText">
		<div id="explanation">
			<h3><span>So What is This About?</span></h3>
			<p class="p1"><span>The <acronym title="WebCave">WebCave</acronym> is a Jave web application using the Apache Struts Framework. Apache Struts is a free open-source framework for creating Java web applications. Web applications differ from conventional websites in that web applications can create a dynamic response. Many websites deliver only static pages. A web application can interact with databases and business logic engines to customize a response. Web applications based on JavaServer Pages sometimes commingle database code, page design code, and control flow code. In practice, we find that unless these concerns are separated, larger applications become difficult to maintain.</span></p>
			<p class="p1"><span>One way to separate concerns in a software application is to use a Model-View-Controller (MVC) architecture. The Model represents the business or database code, the View represents the page design code, and the Controller represents the navigational code. The Struts framework is designed to help developers create web applications that utilize a MVC architecture.</span></p>
		</div>
		</div>
		


	</div>
		
		
		
		
	</div>
</body>
</html:html>
