package dao;


import java.util.List;

import javax.persistence.NoResultException;

import model.Cliente;
import model.Telefone;

import javax.persistence.*;

public class DAOCliente extends DAO<Cliente>{
	public DAOCliente(){
		super();
	}
	
	public Cliente read(String cpf) throws Exception{
		
		try{
			Query q = manager.createQuery("select c from Cliente c where c.cpf = '"+cpf+"'");
			
			Cliente c = (Cliente) q.getSingleResult();
			
			return c;
		}catch(ClassCastException e){
			throw new Exception("Tipo invalido!");
		}catch(NoResultException e){
			return null;
		}catch(Exception e){
			throw new Exception(e.getMessage());
		}
		
	}
	
	public boolean verifyIfClienteExists(String cpf){
		
	
		Query q = manager.createQuery("select c from Cliente c where c.cpf = '"+cpf+"'");
		try{
		  Cliente c = (Cliente) q.getSingleResult();
		  
		}catch(NoResultException e){
			return false;
		}
				
	 return true;
	}
	
	public List<Telefone> pegaTelefonePorCpf(String cpf) throws Exception{
		Cliente c = read(cpf);
		
		if(c == null) throw new Exception("Cliente nao cadastrado");
		
		try{
			Query q = manager.createQuery("select t from Telefone t JOIN Cliente c on c.id_cliente = t.proprietario.id_cliente where c.cpf = :x");
			q.setParameter("x",c.getCpf());
			List<Telefone> tels = q.getResultList();
			
		}catch(NoResultException e){
			return null;
		}
		
	 return null;	
	}
	
	
	
}
