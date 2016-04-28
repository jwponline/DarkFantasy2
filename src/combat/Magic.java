package combat;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import characterclasses.Character;
import characterclasses.Player;


public class Magic {

	public static CombatOutcome MagicResolved(ArrayList<String> atkTypes, Player p, Character Defender,
			CombatOutcome c, int spellDMG, HttpSession session) {
		int Health = Defender.getCurrentHP();
		int dmg = (int) Math.round(spellDMG * CombatCore.calcPlayerDMGMod(atkTypes, Defender));
		Health -= dmg;
		c.setEnemyHpLoss(dmg);


		if (Health <= 0) {
			Health = 0;
			c.setPlayerDescription(c.getPlayerDescription() + "\nThe " + Defender.getProfession()
			+ " collapses under the weight of his wounds. He dies on the cold ground.");
		}
		
		Defender.setCurrentHP(Health);
		CombatCore.ApplyDMG(Defender, session);
		
		c = CombatCore.TheirTurn(p, c, session);
		
		return c;
		
	}
	
	public static CombatOutcome HolyPrayer(HttpSession session) {

		CombatOutcome c = new CombatOutcome();
		
		Player p = (Player)session.getAttribute("player");
		Character Defender = CombatCore.Targetting(session);
		
		if (Defender.getCurrentHP() <= 0) {
			c.setPlayerDescription("You pray for the ressurection of the " + Defender.getProfession()
					+ ". So you may kill it again. Sadly your prayers go unanswered.");
		} else {
			int spellDMG = 60;
			ArrayList<String> atkTypes = new ArrayList<String>();
			atkTypes.add("spirit");
			atkTypes.add("holy");

			c.setPlayerDescription("You say a prayer to the great god Imhotep and he bathes the "
					+ Defender.getProfession() + " in holy fire.");

			MagicResolved(atkTypes, p, Defender, c, spellDMG, session);
			
		}
		
		return c;
	}
		
	public static CombatOutcome Fireball(HttpSession session) {

		CombatOutcome c = new CombatOutcome();
		
		Player p = (Player)session.getAttribute("player");
		Character Defender = CombatCore.Targetting(session);
		
		if (Defender.getCurrentHP() <= 0) {
			c.setPlayerDescription("You cremate the corpse of the " + Defender.getProfession() + ". How noble.");
		} else {
			int spellDMG = 75;
			ArrayList<String> atkTypes = new ArrayList<String>();
			atkTypes.add("blast");
			atkTypes.add("fire");

			c.setPlayerDescription("You weave the intricate sigils, and fire flows from your fingertips, forming into a tight ball. You throw it with glee at the "
					+ Defender.getProfession() + ".");

			MagicResolved(atkTypes, p, Defender, c, spellDMG, session);
			
		}
		
		return c;
	}
	
	public static CombatOutcome IceSpike(HttpSession session) {

		CombatOutcome c = new CombatOutcome();
		
		Player p = (Player)session.getAttribute("player");
		Character Defender = CombatCore.Targetting(session);
		
		if (Defender.getCurrentHP() <= 0) {
			c.setPlayerDescription("Inspired by vlad the impelar you conjure an ice spike and impale the body of the "
					+ Defender.getProfession() + " upon it. It strikes terror into the hearts of your enemies.");
		} else {
			int spellDMG = 45;
			ArrayList<String> atkTypes = new ArrayList<String>();
			atkTypes.add("piercing");
			atkTypes.add("ice");

			c.setPlayerDescription("You gather the ambient water in the air, freezing it with the coldness of your soul, forming it into a deadly ice javalin. You throw it with glee at the "
					+ Defender.getProfession() + ".");

			MagicResolved(atkTypes, p, Defender, c, spellDMG, session);
			
		}
		
		return c;
	}
	
	public static CombatOutcome MindRead(HttpSession session) {

		CombatOutcome c = new CombatOutcome();
		
		Player p = (Player)session.getAttribute("player");
		Character Defender = CombatCore.Targetting(session);
		
		if (Defender.getCurrentHP() <= 0) {
			c.setPlayerDescription("You terrifying images of the great beyond assail your, and sends you reeling.");
		} else {
			int spellDMG = 30;
			ArrayList<String> atkTypes = new ArrayList<String>();
			atkTypes.add("blast");
			atkTypes.add("spirit");

			c.setPlayerDescription("You reach out with your mind, invading that of the " + Defender.getProfession() + "."
					+ Defender.getThoughtDescription());

			MagicResolved(atkTypes, p, Defender, c, spellDMG, session);
			
		}
		
		return c;
	}
}
