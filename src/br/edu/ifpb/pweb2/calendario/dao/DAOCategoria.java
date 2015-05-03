package dao;

import java.util.List;

import model.Categoria;
import model.Produto;

import javax.persistence.*;

public class DAOCategoria extends DAO<Categoria>{
	public DAOCategoria(){
		super();
	}
	
	public Categoria readByName(String nome_categ){
		
		Categoria categ;
		Query q = manager.createQuery("select c from Categoria c where c.nome_categ LIKE :n");
		q.setParameter("n", nome_categ);
		
		try{
			categ = (Categoria) q.getSingleResult();
			return categ;
		}catch(NoResultException e){
			return null;
		}
	}
	
	public boolean verifyIfCategoriaExists(String nome_categ){
		
		Categoria categ;
		Query q = manager.createQuery("select c from Categoria c where c.nome_categ = '"+nome_categ+"'");
		try{
			categ = (Categoria) q.getSingleResult();
		}catch(NoResultException e){
			return false;
		}
				
	 return true;	
	}
	
}
