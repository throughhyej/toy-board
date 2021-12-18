package rose.systems.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "로그인 재시도 요망");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃");
		}
	}
	
}
