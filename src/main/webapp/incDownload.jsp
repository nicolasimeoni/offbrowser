<%@ page import="javax.servlet.http.HttpUtils,java.util.Enumeration" %>
<%@ page import="java.lang.management.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.text.*"  %>
<% 
        String name = request.getParameter("name");
        String chk = request.getParameter("chk");
		String id = request.getParameter("id");
		String dataDir = System.getenv("OPENSHIFT_DATA_DIR");

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
					reader.close();
					counter=Integer.parseInt(line);

				} catch (Exception e) {
					error=e.toString();
				}
			}
			if (error==null || error.length()==0) {
				counter++;
				PrintWriter pw =null;
				try {   
					pw = new PrintWriter(new FileOutputStream(f));
					pw.println(""+counter);
					//clean up
				} catch(Exception e) {
					error=e.toString();
				} finally {
					if(pw!=null) pw.close();
				}
				out.print("OK;"+name+";" + counter);
			} else {
				out.print("ERROR;"+error);
			}
			// write to log
			SimpleDateFormat sdfLog = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
			Date d = new Date(System.currentTimeMillis());
			String s = sdfLog.format(d) + ";"+name+";"+ counter +";"+id;
			if (error!=null) s+=";"+error;

			File	logFile = new File (dataDir+name+".log");
			// scrive su file di log
			PrintWriter outLog=null;
			try {
				outLog = new PrintWriter(new BufferedWriter(new FileWriter(logFile, true)));
				outLog.println(s);
			} catch (IOException e) {
			} finally {
				if(outLog!=null) outLog.close();
			}				
			
		} else {
			out.println("ERROR;"+error);
		}
%>