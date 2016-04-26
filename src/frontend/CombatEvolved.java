package frontend;



import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import characterclasses.GreaterDemon;
import characterclasses.Imp;
import characterclasses.NPC;
import characterclasses.PatheticDemonologist;
import characterclasses.Player;
import turnbasedcombat.CombatOutcome;

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
	
	@RequestMapping("defend")
	public CombatOutcome defend(HttpSession session){
		
		CombatOutcome c = new CombatOutcome();
		
		c.setPlayerDescription("The greater demon charges at you, as he swings his sword you quickly sidestep him, and trip him up. The imp claws at you and a quick bash with your shield knocks him into some barrels, it's all going quite well until you take a firebolt to the knee, ending your adventuring days.");
		c.setPlayerHpLoss(10);
			
		return (c);
	}
	
	@RequestMapping("stab")
	public CombatOutcome stab(HttpSession session){
		
		CombatOutcome c = new CombatOutcome();
		
		//Player p = (Player)session.getAttribute("player");
		NPC t = (NPC)session.getAttribute("Enemy 1");
		NPC q = (NPC)session.getAttribute("Enemy 2");
		NPC r = (NPC)session.getAttribute("Enemy 3");
			
		return (c);
	}

	@RequestMapping("player")
	public String player(HttpSession session){
		
		Player p = (Player)session.getAttribute("player");
		//CombatOutcome c = new CombatOutcome();
		
		//Player p = (Player)session.getAttribute("player");
		//NPC t = (NPC)session.getAttribute("Enemy 1");
		//NPC q = (NPC)session.getAttribute("Enemy 2");
		//NPC r = (NPC)session.getAttribute("Enemy 3");
		p.setCurrentHP((p.getCurrentHP()-59));
		String q = ""+ p.getName()+p.getCurrentHP();
		session.setAttribute("player", p);
		
		return (q);
	}

	
}
