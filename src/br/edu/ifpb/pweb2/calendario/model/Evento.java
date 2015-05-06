package br.edu.ifpb.pweb2.calendario.model;

import java.util.Date;
import java.util.GregorianCalendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Evento {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int dia;
	private int mes;
	private int ano;
	@ManyToOne
	private Usuario usuario;
	@Temporal(TemporalType.DATE)
	private GregorianCalendar dataInicial;
	@Temporal(TemporalType.DATE)
	private GregorianCalendar dataFinal;
	
	
		public Evento(int dia, int mes, int ano, GregorianCalendar dataInicial,GregorianCalendar dataFinal){
			this.dia = dia;
			this.mes = mes;
			this.ano = ano;
			this.dataInicial = dataFinal;
			this.dataFinal = dataFinal;
		}
		
		public Evento(){}
	
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


	
	public GregorianCalendar getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(GregorianCalendar dataInicial) {
		this.dataInicial = dataInicial;
	}

	public GregorianCalendar getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(GregorianCalendar dataFinal) {
		this.dataFinal = dataFinal;
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

}
