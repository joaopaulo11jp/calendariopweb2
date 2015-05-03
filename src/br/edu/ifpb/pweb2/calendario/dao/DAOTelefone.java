package dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import model.Categoria;
import model.Telefone;

public class DAOTelefone extends DAO<Telefone>{
	public DAOTelefone(){
		super();
	}
	
	public boolean verifyIfTelefoneExists(String numero){
		
		Telefone tel;
		Query q = manager.createQuery("select t from Telefone t where t.numero = '"+numero+"'");
		try{
			tel = (Telefone) q.getSingleResult();
		}catch(NoResultException e){
			return false;
		}
				
	 return true;	
	}

}
