package rml.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/muserController")
public class MUserController {

	//@Autowired
	//private MUserServiceI muserService;

	
	@RequestMapping(value="/listUser")
	public String listUser(HttpServletRequest request) {
		
		request.setAttribute("userlist", "");
		return "listUser";
	}
	
 
}
