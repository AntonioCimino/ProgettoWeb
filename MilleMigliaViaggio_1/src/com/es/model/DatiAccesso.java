package com.es.model;

import java.sql.Date;

public class DatiAccesso {

	private String email;
	private String pass;
	private String nome;
	private String cognome;
	private int cell;
	private String nazione;
	private Date data;
	private String tipo;
	
		public String getTipo() {
			return tipo;
		}

		public void setTipo(String tipo) {
			this.tipo = tipo;
		}
		
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		public String getPass() {
			return pass;
		}

		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getNome() {
			return nome;
		}

		public void setNome(String nome) {
			this.nome = nome;
		}

		public String getCognome() {
			return cognome;
		}

		public void setCognome(String cognome) {
			this.cognome = cognome;
		}

		public int getCell() {
			return cell;
		}

		public void setCell(int cell) {
			this.cell = cell;
		}

		public String getNazione() {
			return nazione;
		}

		public void setNazione(String nazione) {
			this.nazione = nazione;
		}
		
		public Date getData_nascita() {
			return data;
		}
		
		public void setData_nascita(Date data) {
			this.data = data;
		}
}
