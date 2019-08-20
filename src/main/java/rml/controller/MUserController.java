package rml.controller;


import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/d")
public class MUserController {

	//@Autowired
	//private MUserServiceI muserService;

	@ResponseBody
	@RequestMapping(value="/StreamCode")
	public String listUser(HttpServletRequest request) throws IOException {
		String addr = request.getParameter("addr");
		String code = request.getParameter("code");
		
		String writeToThisFile = "/root/vps_push_stream_douyu/1.txt";
		
		if(null==addr||"".equals(addr)||null==code||"".equals(code)){
			return "url or code is null" ;
		}else{
			code = code.replace("||", "&");
			FileWriter fw = new FileWriter(writeToThisFile);
			fw.write(addr+"/"+code );
			//System.out.println(code);
			fw.close();
			Process pro = Runtime.getRuntime().exec("/root/vps_push_stream_douyu/vps_killShowAndFfmpeg.sh");
			try {
				pro.waitFor();
			} catch (InterruptedException e) {
				e.printStackTrace();
			} 
			//response.getWriter().write("fw is write over");;
		}
		request.setAttribute("userlist", "");
		return "success";
	}
	
 
}
