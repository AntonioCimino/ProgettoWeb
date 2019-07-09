package com.es.model;

public class DatiAllogio {
	
	private String codice;
	private String indirizzo;
	private String tipo;
	private String prezzo;
	private String servizio;


		public String getCodice() {
			return codice;
		}

		public void setCodice(String c) {
			codice = c;
		}

		public String getIndirizzo() {
			return indirizzo;
		}

		public void setIndirizzo(String i) {
			indirizzo = i;
		}
		public String getPrezzo() {
			return prezzo;
		}

		public void setPrezzo(String p) {
			prezzo = p;
		}
		public String getTipo() {
			return tipo;
		}

		public void setTipo(String t) {
			tipo = t;
		}

		public String getServizio() {
			return servizio;
		}

		public void setServizio(String s) {
			servizio = s;
		}
}