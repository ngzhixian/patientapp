<%
    if (session.getAttribute("userId") == null && session.getAttribute("displayName") == null) {
        response.sendRedirect("HomePage");
        System.out.println("validation");
    }
%>    
