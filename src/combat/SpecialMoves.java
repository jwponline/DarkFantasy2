package combat;

import javax.servlet.http.HttpSession;

import characterclasses.Character;
import characterclasses.Player;
import combat.CombatOutcome;

public class SpecialMoves {

	public static CombatOutcome Inspect(HttpSession session){
		CombatOutcome c = new CombatOutcome();
		
		Character Enemy1 = (Character)session.getAttribute("Enemy 1");
		Character Enemy2 = (Character)session.getAttribute("Enemy 2");
		Character Enemy3 = (Character)session.getAttribute("Enemy 3");
		
		String standing = "";
		String dead = "";
		String description = "";
		int total = 0;
		boolean death = false;
		
		StringBuilder sb = new StringBuilder();


			if (Enemy1.getCurrentHP() > 0) {
				standing = standing + " a " + Enemy1.getProfession() + ", ";
				description = description + "" + Enemy1.getArmorDescription() + "\n";
				total += 1;
			} else {
				dead = dead + "a " + Enemy3.getProfession() + ", ";
				death = true;
			}
			if (Enemy2.getCurrentHP() > 0) {
				standing = standing + " a " + Enemy2.getProfession() + ", ";
				description = description + "" + Enemy2.getArmorDescription() + "\n";
				total += 1;
			} else {
				dead = dead + "a " + Enemy3.getProfession() + ", ";
				death = true;
			}
			if (Enemy3.getCurrentHP() > 0) {
				standing = standing + " a " + Enemy3.getProfession() + ", ";
				description = description + "" + Enemy3.getArmorDescription() + "\n";
				total += 1;
			} else {
				dead = dead + "a " + Enemy3.getProfession() + ", ";
				death = true;
			}

			sb.append("Before you stand " + total + " foes;" + standing + "still draw breath.\n");

			sb.append("" + description + "\n");

			if (death) {
				sb.append("All the while " + dead + " decays into the dirt.\n");
			}
			
		c.setPlayerDescription(sb.toString());
		
		return c;
	}
	
}
