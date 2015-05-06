package br.edu.ifpb.pweb2.calendario.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.edu.ifpb.pweb2.calendario.model.Evento;
import br.edu.ifpb.pweb2.calendario.model.Usuario;

public class DAOEvento extends DAO<Evento>{
		public DAOEvento(){
			super();
		}
	
	@SuppressWarnings("unchecked")
	public List<Evento> readEventoByMonthAndYear(int mes, int ano){
		
		Query q = manager.createQuery("select e from Evento e where e.mes = :m and e.ano = :a");
		q.setParameter("m", mes);
		q.setParameter("a", ano);
		
		try{
			return q.getResultList();
		}catch(NoResultException e){
			return null;
		}
	}
	
	public List<Evento> readEventoByUser(Usuario usuario){
		
		Query q = manager.createQuery("select e from Evento e where e.usuario = :u");
		q.setParameter("u",usuario);
		
		try{
			return q.getResultList();
		}catch(NoResultException e){
			return null;
		}
	}
}
