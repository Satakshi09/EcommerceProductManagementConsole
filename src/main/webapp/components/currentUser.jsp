
<%
String user=(String)session.getAttribute("current-user");
if(user!=null)
{
%>

<p><%=user%></p>

<%
session.removeAttribute("user");
}
%>
