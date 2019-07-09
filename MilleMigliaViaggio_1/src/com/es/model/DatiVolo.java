package com.es.model;

public class DatiVolo {
	
	private String codice;
	private String prezzo_v;
	private String compagnia;
	private String ora_andata;
	private String ora_ritorno;


		
		public String getCodice() {
			return codice;
		}

		public void setCodice(String c) {
			codice = c;
		}
	
		public String getCompagnia() {
			return compagnia;
		}

		public void setCompagnia(String c) {
			compagnia = c;
		}
		public String getOra_a() {
			return ora_andata;
		}

		public void setOra_a(String o) {
			ora_andata = o;
		}
		public String getOra_r() {
			return ora_ritorno;
		}

		public void setOra_r(String o) {
			ora_ritorno = o;
		}

		public String getPrezzo() {
			return prezzo_v;
		}

		public void setPrezzo(String p) {
			prezzo_v = p;
		}
}