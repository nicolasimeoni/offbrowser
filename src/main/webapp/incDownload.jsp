<%@ page import="javax.servlet.http.HttpUtils,java.util.Enumeration" %>
<%@ page import="java.lang.management.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"  %>
License:
<% 
        String name = request.getParameter("name");
		String dataDir = System.getenv("OPENSHIFT_DATA_DIR");

        out.println(name);
		if (name!=null && name.length()>0 && name.length()<20) {
			String 	filename=dataDir+name+".txt"; 	
			String str = "print me";
			//always give the path from root. This way it almost always works.
			try {   
				PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
				pw.println(str);
				//clean up
				pw.close();
			} catch(IOException e) {
			   out.println(e.getMessage());
			}

		}

%>

<%
%>