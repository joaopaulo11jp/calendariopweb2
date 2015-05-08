package br.edu.ifpb.pweb2.calendario.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.edu.ifpb.pweb2.calendario.model.Anotacao;
import br.edu.ifpb.pweb2.calendario.model.Usuario;

public class DAOAnotacao extends DAO<Anotacao>{
		public DAOAnotacao(){
			super();
		}
	
	@SuppressWarnings("unchecked")
	public List<Anotacao> readAnotacaoByMonthAndYear(int mes, int ano){
		
		Query q = manager.createQuery("select a from Anotacao a where a.mes = :m and a.ano = :x");
		q.setParameter("m", mes);
		q.setParameter("x", ano);
		
		try{
			return q.getResultList();
		}catch(NoResultException e){
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public List<Anotacao> readAnotacaoByUser(Usuario usuario){
		
		Query q = manager.createQuery("select a from Anotacao a where a.usuario = :u");
		q.setParameter("u",usuario);
		
		try{
			return q.getResultList();
		}catch(NoResultException e){
			return null;
		}
	}
}
