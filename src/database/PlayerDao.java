package database;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import characterclasses.Player;
import items.Sword;
import items.Weapon;

@Repository
public class PlayerDao {
	
	@PersistenceContext
    private EntityManager em;
	
	/**
	 * Maak een nieuwe character en koppel die aan het account
	 */
	
	@Transactional
	public Player createPlayer(Account account, String name, String sex){
		Player player = new Player();
		player.setName(name);
		player.setSex(sex);
		player.setAccount(account);
		player.setMaxHP(200);
		player.setCurrentHP(player.getMaxHP());
		
		
		player.setPiercingRes(1.0); 
		player.setBashingRes(1.0);
		player.setSlashingRes(1.0);
		player.setBlastRes(1.0);
		player.setHealingRes(1.0);
		player.setFireRes(1.0);
		player.setElecRes(1.0);
		player.setIceRes(1.0);
		player.setEarthRes(1.0); 
		player.setDarkRes(1.0);
		player.setHolyRes(1.0);
		player.setNatureRes(1.0);
		player.setSpiritRes(1.0);
		
		/*Weapon Weapon2 = new Sword("sword", 40, 10, 25);
		player.setWeapon(Weapon2);*/
		
		
		em.find(Account.class, account.getId()).setPlayer(player);
		
		em.persist(player); 
		
		return player;
	}
	
	@Transactional
	public Player findPlayer(Long id){
		Player player = em.find(Player.class, id);
		return player;
	}
	
	@Transactional
	public Player findPlayer(String username){
		Player player;
		try{player = (Player)em.createQuery("select player from Player as player where name = ?1").setParameter(1, username).getSingleResult();}
		catch(NoResultException e){player = null;}
		return player;
	}
	
	@Transactional
	public List<Player> allPlayers(){
		List<Player> players = em.createQuery("from Player", Player.class).getResultList();
		return players;
	}

}
