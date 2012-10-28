<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>


<jsp:useBean id="RegisterForm" class="fr.pascallinder.webcave.RegisterForm" scope="session" />


<logic:messagesPresent>
	<bean:message key="errors.header" />
	<ul>
		<html:messages id="error">
			<li>
				<bean:write name="error" />
			</li>
		</html:messages>
	</ul>
	<hr>
</logic:messagesPresent>

<html:html locale="true">
<head>
	<LINK REL="stylesheet" HREF="WebContent/css/webcave.css" TYPE="text/css">
	<META http-equiv="Content-Style-Type" content="text/css">
	<title>RegisterForm.title</title>
</head>
<div id="container">
	<div id="intro">
		<div id="preamble">
			<body>

				<html:form action="RegisterAction.do">
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
						<tr>
							<td>
								Confirm Password
							</td>
							<td>
								<html:password property="passconfirm" />
							</td>
						</tr>
						<tr>
							<td>
								E-mail
							</td>
							<td>
								<html:text property="email" />
							</td>
						</tr>
					</table>
					<html:submit value="Commit" />
			</body>
		</div>
	</div>
</div>
</html:form>
</html:html>
