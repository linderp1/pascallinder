<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<jsp:useBean id="WineListForm" class="fr.pascallinder.webcave.WineListForm" scope="session" />

<html:html locale="false">
<head>
	<LINK REL="stylesheet" HREF="WebContent/css/webcave.css" TYPE="text/css">
	<META http-equiv="Content-Style-Type" content="text/css">
	<title><bean:message key="WineDisplay.title" /></title>
</head>
<body>
	<div id="container">
		<div id="intro">
			<div id="pageHeader">
				<h1>
					<span><bean:message key="WineDisplay.title" />Webcave</span>
				</h1>
				<h2>
					<span>The Beauty of <acronym title="Cascading Style Sheets">CSS</acronym> Design</span>
				</h2>
			</div>
			<div id="quickSummary">
				<p class="p2">
					Manage your wine collection using this web application.
					<br><br>Design by <a href="http://www.pascallinder.fr">PaL</a>
				</p>
			</div>
			<div id="preamble">
				This is the wine list
				<br>
				<p class="p1">
					Click on a wine to get more information on it.
				</p>
				<%--Used for testing the DB connection only
      				<html:link action="TestConnectAction">Show the winelist</html:link> 
				--%>

			</div>
			<div>
				Wine list
				<br>Hello
				<br>
				<p class="p1">
					-----------------------
				</p>
				<%--Used for testing the DB connection only
      				<html:link action="TestConnectAction">Show the winelist</html:link> 
				--%>
				<%
				// get login parameter from calling page
				String login = request.getParameter("login");
				String pass = request.getParameter("pass");
				String url = "jdbc:mysql://192.168.1.4/webcavedb?user=root";
				Class.forName("org.gjt.mm.mysql.Driver");
				//String pass = MemberForm.getPass();
				//DB address and connection parameters
				//String url = "jdbc:mysql://localhost/winedb?user=root?";
				//create database connection
				javax.sql.DataSource dataSource;
				java.sql.Connection myConnection = null;
				//dataSource = getDataSource(request);
				System.out.println("DB Connection ...");
				//myConnection = dataSource.getConnection();
				myConnection = DriverManager.getConnection(url,"root","5008apt19");
				PreparedStatement stmt = myConnection.prepareStatement("select name from wine");
				//stmt.setString(1, login);
				ResultSet rs = stmt.executeQuery();
				%>
				
				<table border=1>
				<tr>
				<td>Name</td>
				</tr>
				
				<%
				while (rs.next()) {
					String wineName = rs.getString(1);
				%>
				<tr>
				<td>
				<%=wineName %>
				</td>
				</tr>
				<%}%>
				</table>

				<%stmt.close();
				%>

			</div>

		</div>
	</div>
	</div>
</body>
</html:html>
