<html>
  <head>
    <title>Test connection page</title>
  </head>
  
  <body>
	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
			<h1>General Information</h1>
			<h1>Local address: <%=request.getLocalAddr() %></h1>
			<h1>Remote address: <%=request.getRemoteHost() %></h1>
			<h1>Remote server name: <%=request.getServerName() %></h1>
			<h1>Remote server port: <%=request.getServerPort() %></h1>
			<h1>Remote servlet path: <%=request.getServletPath() %></h1>
			<h1>Is this connection secured?: <%=request.isSecure() %></h1>
			</td>
		</tr>
	</table>
  </body>
</html>
