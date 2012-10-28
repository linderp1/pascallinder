<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Test connection page</title>
  </head>
  
  <body>
	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
			<h1><%=request.getAttribute("name") %></h1>
			</td>
		</tr>
	</table>
  </body>
</html>