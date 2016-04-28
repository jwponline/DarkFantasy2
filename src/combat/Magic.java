package combat;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import characterclasses.Character;
import characterclasses.Player;
import turnbasedcombat.PlayerDeath;

public class Magic {

	public static CombatOutcome MagicResolved(ArrayList<String> atkTypes, Player p, Character Defender,
			CombatOutcome c, int spellDMG, int t, HttpSession session) {
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
		CombatCore.ApplyDMG(t, Defender, session);
		
		c = CombatCore.TheirTurn(p, c, session);
		
		return c;
		
	}
	
	public static CombatOutcome HolyPrayer(int t, HttpSession session) {

		CombatOutcome c = new CombatOutcome();
		
		Player p = (Player)session.getAttribute("player");
		Character Defender = CombatCore.Targetting(t, session);
		
		if (Defender.getCurrentHP() <= 0) {
			System.out.println("You pray for the ressurection of the " + Defender.getProfession()
					+ ". So you may kill it again. Sadly your prayers go unanswered.");
		} else {
			int spellDMG = 60;
			ArrayList<String> atkTypes = new ArrayList<String>();
			atkTypes.add("spirit");
			atkTypes.add("holy");

			c.setPlayerDescription("You say a prayer to the great god Imhotep and he bathes the "
					+ Defender.getProfession() + " in holy fire.");

			MagicResolved(atkTypes, p, Defender, c, spellDMG, t, session);
			
		}
		
		return c;
	}
	
	
}
