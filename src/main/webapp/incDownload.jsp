<%@ page import="javax.servlet.http.HttpUtils,java.util.Enumeration" %>
<%@ page import="java.lang.management.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"  %>
License:
<% 
        String name = request.getParameter("name");
        String chk = request.getParameter("chk");
		String dataDir = System.getenv("OPENSHIFT_DATA_DIR");

        out.println(name);
		String error="";
		if (name!=null && chk!=null && name.length()==Integer.parseInt(chk)) {
			String 	filename=dataDir+name+".txt";
			File f = new File(filename);
			int counter=0;
			if (f.exists()) {
				try {
					// read file
					BufferedReader reader = new BufferedReader( new FileReader (f));
					String line;
					line = reader.readLine();
					counter=Integer.parseInt(line);
				} catch (Exception e) {
					error=e.toString();
				}
			}
			if (error==null || error.length()==0) {
				counter++;
				try {   
					PrintWriter pw = new PrintWriter(new FileOutputStream(f));
					pw.println(""+counter);
					//clean up
					pw.close();
				} catch(Exception e) {
					error=e.toString();
				}
				out.println(counter);
			} else {
				out.println(name);
			}
				
			
		} else {
			out.println("error");
		}

%>

<%
%>