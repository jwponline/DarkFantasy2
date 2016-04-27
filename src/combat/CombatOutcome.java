package combat;

public class CombatOutcome {

	private String playerDescription;
	private String enemyDescription;
	private int playerHpLoss;
	private int enemyHpLoss;
	
	
	public String getPlayerDescription() {
		return playerDescription;
	}
	public void setPlayerDescription(String playerDescription) {
		this.playerDescription = playerDescription;
	}
	public String getEnemyDescription() {
		return enemyDescription;
	}
	public void setEnemyDescription(String enemyDescription) {
		this.enemyDescription = enemyDescription;
	}
	public int getPlayerHpLoss() {
		return playerHpLoss;
	}
	public void setPlayerHpLoss(int playerHpLoss) {
		this.playerHpLoss = playerHpLoss;
	}
	public int getEnemyHpLoss() {
		return enemyHpLoss;
	}
	public void setEnemyHpLoss(int enemyHpLoss) {
		this.enemyHpLoss = enemyHpLoss;
	}
	
}
