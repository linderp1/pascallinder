<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>


<jsp:useBean id="MemberForm" class="fr.pascallinder.webcave.MemberForm" scope="session" />

<html:html locale="false">
<head>
	<LINK REL="stylesheet" HREF="WebContent/css/webcave.css" TYPE="text/css">
	<META http-equiv="Content-Style-Type" content="text/css">
	<title><bean:message key="MemberForm.title" /></title>
</head>
<div id="container">
	<div id="intro">

<logic:messagesPresent>
	<bean:message key="errors.header" />
	<ul>
		<html:messages id="error">
			<li>
				<bean:write name="error" />
			</li>
		</html:messages>
	</ul>
	
</logic:messagesPresent>

			<div id="quickSummary">
				<p class="p2">
					Welcome the the Webcave application!<br>Manage your wine collection using this web application.
					<br><br>Design by <a href="http://www.pascallinder.fr">PaL</a>
				</p>
			</div>

		<div id="preamble">
			<p class="p1">
				<span><br>Please enter userID and password to enter</span>
			</p>
			<html:form action="MemberAction.do">
				<table>
					<tr>
						<td>
							Username
						</td>
						<td>
							<html:text property="login" />
						</td>
					</tr>
					<tr>
						<td>
							Password
						</td>
						<td>
							<html:password property="pass" />
						</td>
					</tr>
				</table>
				<html:submit value="Commit" />
		</div>
	</div>
</div>
</html:form>
</html:html>


