package br.edu.ifpb.pweb2.calendario.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.edu.ifpb.pweb2.calendario.model.Evento;

public class DAOEvento extends DAO<Evento>{
	
		public DAOEvento(){
			super();
		}
	
	public List<Evento> readEventoByMonth(int month){
		List<Evento> eventos = null;
		
	
		Query q = manager.createQuery("select e from Evento e where e.mes = :m");
		q.setParameter("m", month);
		
		try{
			eventos = q.getResultList();
			return eventos;
		}catch(NoResultException e){
			return null;
		}
		
	}
	
	
}
