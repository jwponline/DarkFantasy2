package frontend;



import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import characterclasses.Character;
import characterclasses.GreaterDemon;
import characterclasses.Imp;
import characterclasses.NPC;
import characterclasses.PatheticDemonologist;
import characterclasses.Player;
import combat.Attacks;
import combat.CombatOutcome;
import combat.InCombat;
import combat.Magic;
import combat.Target;
import combat.SpecialMoves;

@RestController
@RequestMapping("/combat")
public class CombatEvolved {

	
	@RequestMapping("engage")
	public String engage(HttpSession session){
		NPC q = new GreaterDemon("O'crap", "Greater Demon", 80, 80, 20);
		NPC r = new Imp("hctiB'elttiL", "Imp", 25, 25, 10);
		NPC s = new PatheticDemonologist("Alfred", "Cult leader", 55, 55, 15);
		InCombat z = new InCombat(true);
		session.setAttribute("combat", z);
		session.setAttribute("Enemy 1", q);
		session.setAttribute("Enemy 2", r);
		session.setAttribute("Enemy 3", s);
		return "Combat Instance Created";
	}
	
	public CombatEvolved() {
		// TODO Auto-generated constructor stub
		System.out.println("comcatevolved has loaded!");
	}
	
	@RequestMapping("defend")
	public CombatOutcome defend(HttpSession session){
		
		CombatOutcome c = new CombatOutcome();
		
		c.setPlayerDescription("The greater demon charges at you, as he swings his sword you quickly sidestep him, and trip him up. The imp claws at you and a quick bash with your shield knocks him into some barrels, "
				+ "it's all going quite well until you take a firebolt to the knee, nearly ending your adventuring days. You lose 10 HP.");
		c.setPlayerHpLoss(10);
		Player p = (Player)session.getAttribute("player");
		p.setCurrentHP((p.getCurrentHP()-10));
		session.setAttribute("player", p);
			
		return (c);
	}
	
	@RequestMapping("stab")
	public CombatOutcome stab(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = Attacks.piercingAtk(session);
		return (c);
	}
	
	@RequestMapping("slash")
	public CombatOutcome slash(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = Attacks.slashingAtk(session);
		return (c);
	}
	
	@RequestMapping("bash")
	public CombatOutcome bash(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = Attacks.bashingAtk(session);
		return (c);
	}

	@RequestMapping("pray")
	public CombatOutcome pray(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = Magic.HolyPrayer(session);
			
		return (c);
	}
	
	@RequestMapping("fireball")
	public CombatOutcome fireball(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = Magic.Fireball(session);
			
		return (c);
	}
	
	@RequestMapping("icespike")
	public CombatOutcome icespike(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = Magic.IceSpike(session);
			
		return (c);
	}
	
	@RequestMapping("mindread")
	public CombatOutcome mindread(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = Magic.MindRead(session);
			
		return (c);
	}
	
	@RequestMapping("inspect")
	public CombatOutcome inspect(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		c = SpecialMoves.Inspect(session);
			
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
		/*p.setCurrentHP((p.getCurrentHP()-59));
		String q = ""+ p.getName()+p.getCurrentHP();
		session.setAttribute("player", p); */
		
		String q = "" + (boolean)session.getAttribute("combat");
		return (q);
	}
	
	@RequestMapping("target1")
	public String target1(HttpSession session){
		Target target = new Target(1);
		session.setAttribute("target", target);
		Character p = (Character)session.getAttribute("Enemy 1");
		String q = p.getProfession();
		return q;
	}

	@RequestMapping("target2")
	public String target2(HttpSession session){
		Target target = new Target(2);
		session.setAttribute("target", target);
		NPC p = (NPC)session.getAttribute("Enemy 2");
		String q = p.getProfession();
		return q;
	}
	
	@RequestMapping("target3")
	public String target3(HttpSession session){
		Target target = new Target(3);
		session.setAttribute("target", target);
		Character p = (Character)session.getAttribute("Enemy 3");
		String q = p.getProfession();
		return q;
	}
	
}
