package rml.controller;


import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/d")
public class MUserController {

	//@Autowired
	//private MUserServiceI muserService;
	Log logger = LogFactory.getLog(getClass());
	@ResponseBody
	@RequestMapping(value="/StreamCode")
	public String listUser(HttpServletRequest request) throws IOException {
		String addr = request.getParameter("addr");
		addr = java.net.URLDecoder.decode(java.net.URLDecoder.decode(addr, "utf-8"),"utf-8");
		String code = request.getParameter("code");
		code = java.net.URLDecoder.decode(java.net.URLDecoder.decode(code, "utf-8"),"utf-8");
		
		String writeToThisFile = "/usr/share/tomcat/webapps/vps_push_stream_douyu/video/1";
		
		if(null==addr||"".equals(addr)||null==code||"".equals(code)){
			return "url or code is null" ;
		}else{
			code = code.replace("||", "&");
			FileWriter fw = new FileWriter(writeToThisFile);
			fw.write(addr+"/"+code );
			//System.out.println(code);
			fw.close();
			logger.info("write over ");
			Process pro = Runtime.getRuntime().exec("/usr/share/tomcat/webapps/vps_push_stream_douyu/video/vps_killShowAndFfmpeg.sh");
			logger.info("push stream ... ");
			try {
				pro.waitFor();
			} catch (InterruptedException e) {
				logger.info("push stream err ");
				e.printStackTrace();
			} 
			//response.getWriter().write("fw is write over");;
		}
		request.setAttribute("userlist", "");
		return "success";
	}
	
 
}
