package br.edu.ifpb.pweb2.calendario.model;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Anotacao {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String titulo;
	private String texto;
	private int dia;
	private int mes;
	private int ano;
	@ManyToOne
	private Usuario usuario;
	@Temporal(TemporalType.DATE)
	private Calendar data;
	
	
	
		public Anotacao(int dia, int mes, int ano, Calendar data,String titulo,String texto){
			this.dia = dia;
			this.mes = mes;
			this.ano = ano;
			this.data = data;
			this.titulo = titulo;
			this.texto = texto;
		}
		
		public Anotacao(){}
	
	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
		
	public int getId(){
		return this.id;
	}
		
	public int getDia() {
		return dia;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}

	public int getMes() {
		return mes;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	
	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public String getDatastring(){
		String ano = Integer.toString(this.ano);
		String mes;
		if(Integer.toString(this.mes).length() == 1) mes = "0" + Integer.toString(this.mes);
		else mes = Integer.toString(this.mes);
		String dia;
		if(Integer.toString(this.dia).length() == 1) dia = "0" + Integer.toString(this.dia);
		else dia = Integer.toString(this.dia);
		
		return ano+mes+dia;
	}
	
	public String getDatastringbars(){
		String ano = Integer.toString(this.ano);
		String mes;
		if(Integer.toString(this.mes).length() == 1) mes = "0" + Integer.toString(this.mes);
		else mes = Integer.toString(this.mes);
		String dia;
		if(Integer.toString(this.dia).length() == 1) dia = "0" + Integer.toString(this.dia);
		else dia = Integer.toString(this.dia);
		
		return dia+"/"+mes+"/"+ano;
	}
}
