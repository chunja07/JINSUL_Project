package js.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
public class WebSocketController {

	@RequestMapping("/ws-echo")
	public String echo_ws() {		
		return "chat/websocket-echo";
	}
	
}
