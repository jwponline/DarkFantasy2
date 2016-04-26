package characterclasses;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;

import database.Account;
import items.Weapon;

@Entity
public class Player {
	private Long id;
	@NotNull
	private String name;
	private Account account;
	@NotNull
	private String sex;	
	
	private int currentHP;
	private int maxHP;
	
	private double healingRes, piercingRes, bashingRes, slashingRes, blastRes;
	private double fireRes, elecRes, iceRes, earthRes, darkRes, holyRes, natureRes, spiritRes;
	
	
	private String weapon;
	private int slashDMG;
	private int bashDMG;
	private int pierceDMG;
	private ArrayList<String> dmgType;
	
	

	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name="increment", strategy = "increment")
	public Long getId() {
		return id;
	}
	
	public Player(){}
	
	@NotNull
	@OneToOne (mappedBy="player")
	public Account getAccount() {
		return this.account;
	}
	
	public void setAccount(Account account) {
		this.account = account;
	}
	
	@SuppressWarnings("unused")
	private void setId(Long id) {
		this.id = id;
	}
	
	@NotNull
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public int getCurrentHP() {
		return currentHP;
	}

	public void setCurrentHP(int currentHP) {
		this.currentHP = currentHP;
	}

	public int getMaxHP() {
		return maxHP;
	}

	public void setMaxHP(int maxHP) {
		this.maxHP = maxHP;
	}

	public double getHealingRes() {
		return healingRes;
	}

	public void setHealingRes(double healingRes) {
		this.healingRes = healingRes;
	}

	public double getPiercingRes() {
		return piercingRes;
	}

	public void setPiercingRes(double piercingRes) {
		this.piercingRes = piercingRes;
	}

	public double getBashingRes() {
		return bashingRes;
	}

	public void setBashingRes(double bashingRes) {
		this.bashingRes = bashingRes;
	}

	public double getSlashingRes() {
		return slashingRes;
	}

	public void setSlashingRes(double slashingRes) {
		this.slashingRes = slashingRes;
	}

	public double getBlastRes() {
		return blastRes;
	}

	public void setBlastRes(double blastRes) {
		this.blastRes = blastRes;
	}

	public double getFireRes() {
		return fireRes;
	}

	public void setFireRes(double fireRes) {
		this.fireRes = fireRes;
	}

	public double getElecRes() {
		return elecRes;
	}

	public void setElecRes(double elecRes) {
		this.elecRes = elecRes;
	}

	public double getIceRes() {
		return iceRes;
	}

	public void setIceRes(double iceRes) {
		this.iceRes = iceRes;
	}

	public double getEarthRes() {
		return earthRes;
	}

	public void setEarthRes(double earthRes) {
		this.earthRes = earthRes;
	}

	public double getDarkRes() {
		return darkRes;
	}

	public void setDarkRes(double darkRes) {
		this.darkRes = darkRes;
	}

	public double getHolyRes() {
		return holyRes;
	}

	public void setHolyRes(double holyRes) {
		this.holyRes = holyRes;
	}

	public double getNatureRes() {
		return natureRes;
	}

	public void setNatureRes(double natureRes) {
		this.natureRes = natureRes;
	}

	public double getSpiritRes() {
		return spiritRes;
	}

	public void setSpiritRes(double spiritRes) {
		this.spiritRes = spiritRes;
	}

	public int getSlashDMG() {
		return slashDMG;
	}

	public void setSlashDMG(int slashDMG) {
		this.slashDMG = slashDMG;
	}

	public int getBashDMG() {
		return bashDMG;
	}

	public void setBashDMG(int bashDMG) {
		this.bashDMG = bashDMG;
	}

	public int getPierceDMG() {
		return pierceDMG;
	}

	public void setPierceDMG(int pierceDMG) {
		this.pierceDMG = pierceDMG;
	}
	
	public String getWeapon() {
		return weapon;
	}

	public void setWeapon(String weapon) {
		this.weapon = weapon;
	}

	public ArrayList<String> getDmgType() {
		return dmgType;
	}

	public void setDmgType(ArrayList<String> dmgType) {
		this.dmgType = dmgType;
	}
}
