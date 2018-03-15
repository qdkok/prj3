<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
    
<%
	String fileName=request.getParameter("filename");
	if( fileName !=null ){
	//응답방식 변경
	response.setContentType("application/octet-stream");
	//응답 헤더 설정
	response.setHeader("Content-Disposition","attachement;fileName="+URLEncoder.encode(fileName,"UTF-8"));
	//파일을 읽기 위한 입력스트림
	//File file = new File("C:/dev/workspace/project_3/WebContent/upload/"+fileName);
	File file=new File("C:/dev/git/prj3/project_3/WebContent/upload"+fileName);
	FileInputStream fis=null;
	OutputStream os=null;
	
	try{
		if( file.exists() ){
		fis=new FileInputStream(file);
		
		//읽어들인 파일의 내용을 모두 배열에 저장한 후
			byte[] tempArr=new byte[(int)file.length()];
			int temp=0;
			int idx=0;
			while((temp=fis.read()) != -1){
				tempArr[idx]=(byte)temp;
				idx++;
			}//end while
				
			out.clear();
			out=pageContext.pushBody();
			//스트림을 재설정한 후 읽어들인 파일을 기록
			os=response.getOutputStream();
			os.write(tempArr);
			os.flush();
		}//end if
		
	}finally{
		if(fis != null){fis.close();}//end if
		if(os != null){os.close();}//end if
	}
	
	}//end if
%>