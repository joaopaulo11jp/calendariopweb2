package br.edu.ifpb.pweb2.calendario.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.edu.ifpb.pweb2.calendario.model.Anotacao;
import br.edu.ifpb.pweb2.calendario.model.Usuario;

public class DAOUsuario extends DAO<Usuario>{
	public DAOUsuario(){
		super();
	}
	
	public Usuario readUsuario(String usuario){
		Usuario user = null;
		
		Query q = manager.createQuery("select u from Usuario u where u.login = :login");
		q.setParameter("login", usuario);
		
		try {
			user = (Usuario) q.getSingleResult();
			return user;
		}catch(NoResultException e){
			return null;
		}
		
	}
	
	public Usuario authenticateUsuario(String usuario, String senha){
		
		
		Query q = manager.createQuery("select u from Usuario u where u.login = :l AND u.senha = :s");
		q.setParameter("l", usuario);
		q.setParameter("s", senha);
		
		try {
			Usuario user = (Usuario) q.getSingleResult();
			return user;
		}catch(NoResultException e){
			return null;
		}
		
	}
	@SuppressWarnings("unchecked")
	public List<Anotacao> readEventosUsuario(int i, int m){
		Query q = manager.createQuery("SELECT u.eventos FROM Usuario u where u.id = :i AND u.eventos.mes = :m");
		q.setParameter("i", i);
		q.setParameter("m", m);
		
		try{
			return q.getResultList();
		}catch(NoResultException e){
			return null;
		}
	}
}
