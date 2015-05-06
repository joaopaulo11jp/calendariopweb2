package br.edu.ifpb.pweb2.calendario.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Usuario {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String login;
	private String nome;
	private String senha;
	private boolean adminRight;
	@OneToMany(cascade=CascadeType.ALL, mappedBy="usuario")
	private List<Evento> eventos;
	
		public Usuario(String login,String nome,String senha){
			this.login = login;
			this.nome = nome;
			this.senha = senha;
		    this.eventos = new ArrayList<Evento>();
		}
		
		public Usuario(){}
		
	public int getId(){
		return this.id;
	}
	
	public String getLogin() {
		return login;		
	}
	public void setLogin(String login) {
		this.login = login;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public List<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(List<Evento> eventos) {
		this.eventos = eventos;
	}
	
	public void addEvento(Evento evento){
		this.eventos.add(evento);
	}
	
	
}
