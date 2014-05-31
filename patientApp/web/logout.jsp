<%@page import = "java.util.Date" session="true"%>
<%
  session = request.getSession(false);
  if (session!= null){
        session.invalidate();

  }
  session.setAttribute("user", null);
  response.sendRedirect("login.jsp");
%>
