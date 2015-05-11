<%@ page import="javax.servlet.http.HttpUtils,java.util.Enumeration" %>
<%@ page import="java.lang.management.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.text.*"  %>
<html>
<body>
<center><h1>Active Licenses</h1></center>
<br/>
<table>
<tr><th>Date</th><th>App name</th><th>Counter</th><th>Device ID</th></tr>
<% 
        String name = request.getParameter("name");
        String chk = request.getParameter("chk");
		String dataDir = System.getenv("OPENSHIFT_DATA_DIR");

		String error="";
		if (name!=null && chk!=null && name.length()==Integer.parseInt(chk)) {
			String 	filename=dataDir+name+".log";
			out.print("<!-- filename:"+filename +"-->");
			File f = new File(filename);
			if (f.exists()) {
				out.print("<!-- exists-->");
				try {
					// read file
					BufferedReader reader = new BufferedReader( new FileReader (f));
					String line;
					line = reader.readLine();
					out.print("<!-- "+line+"-->");
					
					while(line != null){
						StringTokenizer st = new StringTokenizer(line,";");
						out.print("<tr><td>"+st.nextToken()+"</td><td>"+st.nextToken()+"</td><td>"+st.nextToken()+"</td><td>"+st.nextToken()+"</td></tr>");
						line = reader.readLine();
					}  
					
					reader.close();

				} catch (Exception e) {
					error=e.toString();
					out.print("<!-- "+error+"-->");
				}
			}
			
		} else {
			
		}
%>
</table>
</body>
</html>