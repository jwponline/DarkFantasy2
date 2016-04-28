package combat;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;


import characterclasses.Character;
import characterclasses.Player;

import combat.Target;


/*
 * 
 * calcDMGMod
 * PlayerDealDMG
 * NPCDealDMG
 * 
 * dmg substraction can be done in the java, see combat evolved
 * 
 */

public class CombatCore {
	
	protected static CombatOutcome TheirTurn(Player p, CombatOutcome c, HttpSession session){
		Character Enemy1 = (Character)session.getAttribute("Enemy 1");
		Character Enemy2 = (Character)session.getAttribute("Enemy 2");
		Character Enemy3 = (Character)session.getAttribute("Enemy 3");
		
		int d, e, f;
		d = e = f = 0;
		StringBuilder sb = new StringBuilder();
		
		int totalEnemyHP = Enemy1.getCurrentHP() + Enemy2.getCurrentHP() + Enemy3.getCurrentHP();
		if (totalEnemyHP > 0) {
			d = TheyAttack(p, Enemy1, sb);
			e = TheyAttack(p, Enemy2, sb);
			f = TheyAttack(p, Enemy3, sb);
		}
		
		session.setAttribute("player", p); 		//sets player hp to session
		
		c.setPlayerHpLoss(d+e+f);
		c.setEnemyDescription(sb.toString());
		
		c.setWinner(youWin(Enemy1, Enemy2, Enemy3));
		
		return c;
	}
	
	protected static int TheyAttack(Player p, Character e, StringBuilder sb){
		if(e.getCurrentHP() > 0){
			if (p.getCurrentHP() > 0){
				sb.append(e.getAttackDescription());
				
				int newHealth = p.getCurrentHP();
				double dmgMod = calcNPCDMGMod(e.getDmgType(), p);
				int dmg = (int) Math.round(e.getDamage() * dmgMod);
				newHealth -= dmg;
	
				if (newHealth <= 0) {
					newHealth = 0;
					p.setCurrentHP(newHealth);
					return dmg;
				}
	
				p.setCurrentHP(newHealth);
				return dmg;
			}
			else {
				sb.append("The " + e.getProfession() + " spits on your corpse.\n");
				return 0;
			}
		}
		else {return 0;}
	}
	
	protected static Character Targetting(HttpSession session){
		Character target;
		Target ta = (Target)session.getAttribute("target");
		int t = ta.getTarget();
		switch(t){
		
			case 1: 
				target = (Character)session.getAttribute("Enemy 1");
				break;
			case 2:
				target = (Character)session.getAttribute("Enemy 2");
				break;
			case 3:
				target = (Character)session.getAttribute("Enemy 3");
				break;
			default:
				target = null;
				System.out.println("targetting system got a input that was not 1 2 or 3");
				break;
		}
		
		return target;
		
	}
	
	protected static void ApplyDMG(Character c, HttpSession session){
		Target ta = (Target)session.getAttribute("target");
		int t = ta.getTarget();
		switch(t){
		
			case 1: 
				session.setAttribute("Enemy 1", c);
				break;
			case 2:
				session.setAttribute("Enemy 2", c);
				break;
			case 3:
				session.setAttribute("Enemy 3", c);
				break;
			default:
				System.out.println("targetting system got a input that was not 1 2 or 3 that also went wrong with apply dmg");
				break;
		}
	}
	
	protected static boolean youWin(Character enemy1, Character enemy2, Character enemy3){
		boolean winner = false;
		
		if (enemy1.getCurrentHP() < 1 && enemy2.getCurrentHP() < 1 && enemy3.getCurrentHP() < 1){
			winner = true;
		}
		
		return winner;
	}
	
	protected static double calcNPCDMGMod(ArrayList<String> atktypes, Player Defender) {
		double atkMod = 1.0;

		for (int i = 0; i < atktypes.size(); i++) {
			switch (atktypes.get(i).toLowerCase()) {
			case "healing":
				atkMod *= Defender.getPiercingRes();
				break;
			case "piercing":
				atkMod *= Defender.getPiercingRes();
				break;
			case "bashing":
				atkMod *= Defender.getBashingRes();
				break;
			case "slashing":
				atkMod *= Defender.getSlashingRes();
				break;
			case "blast":
				atkMod *= Defender.getBlastRes();
				break;
			case "fire":
				atkMod *= Defender.getFireRes();
				break;
			case "electricity":
				atkMod *= Defender.getElecRes();
				break;
			case "ice":
				atkMod *= Defender.getIceRes();
				break;
			case "earth":
				atkMod *= Defender.getEarthRes();
				break;
			case "dark":
				atkMod *= Defender.getDarkRes();
				break;
			case "holy":
				atkMod *= Defender.getHolyRes();
				break;
			case "nature":
				atkMod *= Defender.getNatureRes();
				break;
			case "spirit":
				atkMod *= Defender.getSpiritRes();
				break;
			default:
				break;
			}
		}
		return atkMod;
	}
	
	protected static double calcPlayerDMGMod(ArrayList<String> atktypes, Character Defender) {
		double atkMod = 1.0;

		for (int i = 0; i < atktypes.size(); i++) {
			switch (atktypes.get(i).toLowerCase()) {
			case "healing":
				atkMod *= Defender.getPiercingRes();
				break;
			case "piercing":
				atkMod *= Defender.getPiercingRes();
				break;
			case "bashing":
				atkMod *= Defender.getBashingRes();
				break;
			case "slashing":
				atkMod *= Defender.getSlashingRes();
				break;
			case "blast":
				atkMod *= Defender.getBlastRes();
				break;
			case "fire":
				atkMod *= Defender.getFireRes();
				break;
			case "electricity":
				atkMod *= Defender.getElecRes();
				break;
			case "ice":
				atkMod *= Defender.getIceRes();
				break;
			case "earth":
				atkMod *= Defender.getEarthRes();
				break;
			case "dark":
				atkMod *= Defender.getDarkRes();
				break;
			case "holy":
				atkMod *= Defender.getHolyRes();
				break;
			case "nature":
				atkMod *= Defender.getNatureRes();
				break;
			case "spirit":
				atkMod *= Defender.getSpiritRes();
				break;
			default:
				break;
			}
		}
		return atkMod;
	}

	protected static ArrayList<String> PlayerDMGMod(Player Player, String attackType) {
		ArrayList<String> Combined = new ArrayList<String>();
		Combined.add(attackType);
		if (Player.getDmgType() != null) {
			Combined.addAll(Player.getDmgType());
		}
		/*
		 * if (Player.Weapon.getDmgType() != null) {
		 * Combined.addAll(Player.Weapon.getDmgType());
		 * }
		 */
		return Combined;
	}
	
	
}
