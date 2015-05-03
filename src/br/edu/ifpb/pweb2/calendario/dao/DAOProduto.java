package dao;

import java.util.List;

import model.Produto;

import javax.persistence.*;

public class DAOProduto extends DAO<Produto>{
	public DAOProduto(){
		super();
	}
	
    // OUTRAS CONSULTAS
	public List<Produto> read(String descricao) throws Exception{
		
		try{
		Query q = manager.createQuery("select p from Produto p where p.descricao = '"+descricao+"'");
		List<Produto> p = q.getResultList();
		return p;
		}catch(NoResultException e){
		    return null;
		}catch(Exception e){
			throw new Exception(e.getMessage());
		}
	 	
	}
	
	
	
	public boolean verifyIfProdutoExists(String descricao, String marca){
		
		Query q = manager.createQuery("select p from Produto p where p.descricao = '"+descricao+"' and p.marca ='"+marca+"'");
		try{
		  Produto p = (Produto) q.getSingleResult();
		  
		}catch(NoResultException e){
			return false;
		}
				
	 return true;
	}
}
