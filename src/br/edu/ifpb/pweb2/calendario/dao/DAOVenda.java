package dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import model.Cliente;
import model.Venda;
import model.VendaProduto;

public class DAOVenda extends DAO<Venda>{
	public DAOVenda(){
		super();
	}
	
	public Venda deleteLast() throws Exception{
		
		
		try{
			Query q = manager.createQuery("select MAX(v.id_venda) from Venda v");
			Venda v = (Venda)q.getSingleResult();
			delete(v);
			return v;
		}catch(NoResultException e){
			throw new Exception("Nao ha vendas registradas!");
		}catch(Exception e){
			throw new Exception(e.getMessage());
		}
	
	}
	
	public Venda ultimaVenda(){
		
		try{
			Query q = manager.createQuery("select MAX(v.id_venda) from Venda v");
			int id = (Integer) q.getSingleResult();
			q = manager.createQuery("select v from Venda v where v.id_venda = :x");
			q.setParameter("x", id);
			Venda v = (Venda)q.getSingleResult();
			return v;
		}catch(NoResultException e){
			return null;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}	
	}
	
	public List<Venda> vendaPorCliente(Cliente cliente){
		
		try{
			Query q = manager.createQuery("select c from Cliente c where c.id_cliente ="+cliente.getId_cliente());
			Cliente c = (Cliente) q.getSingleResult();
			
			return c.getCompras();
		}catch(NoResultException e){
			return null;
		}
		
	}
	
	public List<VendaProduto> itensDaVenda(int id) throws Exception{
		Venda v = read(id);
		String str = "";
		if(v == null) throw new Exception("Venda nao registrada!");
		
		try{
			Query q = manager.createQuery("select vpx from VendaProduto vpx where vpx.venda = :x");
			q.setParameter("x",v);
			List<VendaProduto> vplist= q.getResultList();
			
			return vplist;
		}catch(NoResultException e){
			return null;
		}
		
	}

}
