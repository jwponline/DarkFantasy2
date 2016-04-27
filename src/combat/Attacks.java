package combat;

import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import characterclasses.Character;
import characterclasses.Player;

import combat.*;


public class Attacks {

	
	public static CombatOutcome piercingAtk(int t, HttpSession session) {
		CombatOutcome c = new CombatOutcome();
		
		Player p = (Player)session.getAttribute("player");
		Character Defender = Targetting(t, session);
				
		int Health = Defender.getCurrentHP();
		
		
		if (Health <= 0) {
			c.setPlayerDescription("Stop stabbing the corpse you psychopath!");
			return c;
		}
		
		double dmgMod = CombatCore.calcPlayerDMGMod(CombatCore.PlayerDMGMod(p, "piercing"), Defender);
		int damage = (int) Math.round(p.getPierceDMG() * dmgMod); 
		Health -= damage;
		c.setEnemyHpLoss(damage);

		c.setPlayerDescription("You rush forward and stab them with the pointy end of your " + p.getWeapon()
		+ ". Dealing " + damage + " damage to the " + Defender.getProfession() + ".\n");


		if (Health <= 0) {
			Health = 0;
			c.setPlayerDescription(c.getPlayerDescription() + "\nThe " + Defender.getProfession()
			+ " collapses under the weight of his wounds. He dies on the cold ground.");
		}
		
		Defender.setCurrentHP(Health);
		ApplyDMG(t, Defender, session);
		
		c = TheirTurn(p, c, session);
		
		return c;
	}
	
	
}
