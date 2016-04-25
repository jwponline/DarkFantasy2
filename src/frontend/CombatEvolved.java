package frontend;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import characterclasses.GreaterDemon;
import characterclasses.Imp;
import characterclasses.NPC;
import characterclasses.PatheticDemonologist;
import turnbasedcombat.TempMain;

@RestController
@RequestMapping("/combat")
public class CombatEvolved {

	
	@RequestMapping("engage")
	public String engage(HttpSession session){
		NPC q = new GreaterDemon("O'crap", "Greater Demon", 80, 80, 20);
		NPC r = new Imp("hctiB'elttiL", "Imp", 25, 25, 10);
		NPC s = new PatheticDemonologist("Alfred", "Cult leader", 55, 55, 15);
		String t = "Victory";
		session.setAttribute("Enemy 1", q);
		session.setAttribute("Enemy 2", r);
		session.setAttribute("Enemy 3", s);
		return s.getName();
	}
	
	public CombatEvolved() {
		// TODO Auto-generated constructor stub
		System.out.println("comcatevolved has loaded!");
	}
	
	@RequestMapping("stab")
	public String stab(HttpSession session){
		
		StringBuilder g = new StringBuilder();
		NPC v = TempMain.main();
		NPC t = (NPC)session.getAttribute("Enemy 1");
		NPC q = (NPC)session.getAttribute("Enemy 2");
		NPC r = (NPC)session.getAttribute("Enemy 3");
		g.append(t.getName());
		g.append(q.getName());
		g.append(r.getName());
		g.append(v.getName());
		
		
		
		return (g.toString());
	}



	
}
