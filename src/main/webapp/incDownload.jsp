<%@ page import="javax.servlet.http.HttpUtils,java.util.Enumeration" %>
<%@ page import="java.lang.management.*" %>
<%@ page import="java.util.*" %>
License:
  <%
        String value = request.getParameter("licenseName");

        out.println(value);
		
		String envValue = System.getenv("OPENSHIFT_DATA_DIR");
       out.println("env data: ");
		       out.println(envValue);

    %>
