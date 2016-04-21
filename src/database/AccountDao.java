package database;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AccountDao {
	
	@PersistenceContext
    private EntityManager em;

	/**
	 * Maak een nieuwe Account aan en sla die op in de database
	 */
	@Transactional
	public Account createAccount(String username, String password){
		Account account = new Account();
		account.setUsername(username);
		account.setPassword(password);
		
		em.persist(account);
		
		return account;
	}
	
	/**
	 * Verwijder een account uit de database
	 */
	@Transactional
	public void remove(Long id){
		Account account = em.find(Account.class, id);
		if(account != null){
			em.remove( account );
		}
	}
	
	/**
	 * Haal een account op a.d.h.v. zijn id
	 */
	@Transactional
	public Account findAccount(Long id){
		Account account = em.find(Account.class, id);
		return account;
	}
	
	@Transactional
	public Account findAccount(String username){
		Account account;
		try{account = (Account) em.createQuery("select account from Account as account where username = ?1").setParameter(1, username).getSingleResult();}
		catch(NoResultException e){account = null;}
		return account;
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public Account findAccountByPassword(String password, String username){
		Account account = null;
		List<Account> accounts = null;
		try{accounts = em.createQuery("select account from Account as account where password = ?1").setParameter(1, password).getResultList();}
		catch(NoResultException e){}
		for(int i = 0; i < accounts.size(); i++){
			if(accounts.get(i).getUsername().equals(username)){
				account = accounts.get(i);
				break;
			}
		}
		return account;
	}
	
	/**
	 * Haal alle accounts op uit de database
	 */
	@Transactional
	public List<Account> allAccounts(){
		List<Account> accounts = em.createQuery("from Account", Account.class).getResultList();
		return accounts;
	}
}
