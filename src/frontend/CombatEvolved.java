package frontend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/combat")
public class CombatEvolved {

	
	public CombatEvolved() {
		// TODO Auto-generated constructor stub
		System.out.println("comcatevolved has loaded!");
	}
	
	@RequestMapping("stab")
	public String stab(){
		return "you didn't stab a woman";
	}



	
}
