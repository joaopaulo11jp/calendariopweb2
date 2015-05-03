package br.edu.ifpb.pweb2.calendario.model;

import java.util.Date;

public class Evento {
	private int dia;
	private int mes;
	private int ano;
	private Date data;
	
		public Evento(int dia, int mes, int ano, Date data){
			this.dia = dia;
			this.mes = mes;
			this.ano = ano;
			this.data = data;
		}
		
		public Evento(){}

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

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
	
	
}
