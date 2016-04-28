package combat;

public class InCombat {

	private boolean inCombat = false;

	public InCombat(boolean a){
		inCombat = a;
	}	
	
	public boolean isInCombat() {
		return inCombat;
	}

	public void setInCombat(boolean inCombat) {
		this.inCombat = inCombat;
	}
	
	
	
}
