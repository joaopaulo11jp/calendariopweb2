package br.edu.ifpb.pweb2.calendario.model;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String login;
	private String nome;
	private String senha;
	private boolean adminRight;
	private List<Evento> eventos;
	
		public Usuario(String login,String nome,String senha){
			this.login = login;
			this.nome = nome;
			this.senha = senha;
		    this.eventos = new ArrayList<Evento>();
		}
		
		public Usuario(){}
		

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
	
	
}
