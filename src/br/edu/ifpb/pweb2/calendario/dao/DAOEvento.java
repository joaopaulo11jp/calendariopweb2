package br.edu.ifpb.pweb2.calendario.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.edu.ifpb.pweb2.calendario.model.Evento;

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
}
