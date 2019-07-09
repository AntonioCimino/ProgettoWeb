package com.es.model;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.http.Cookie;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;



public class DBManager 
{
	public DBManager()
	{
		con = null;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/prog_web";
			String username = "root"; 
			String pwd = "p4p3r0"; 
			con = (Connection) DriverManager.getConnection(url,username,pwd);
		}
		catch(Exception e)
		{
			System.out.println("Connessione fallita");
		}
	}
	
	
	public boolean accesso(DatiAccesso d) 
	{
		String email =  d.getEmail();
		String pass =  d.getPass();
		
		try 
		{
			Statement query = (Statement) con.createStatement();
			ResultSet result = (ResultSet) query.executeQuery("select * from cliente;");
			while (result.next())
			{
				String e = result.getString("email");
				String p = result.getString("pass");
				d.setTipo(result.getString("tipo"));
				if(e.equals(email) && p.equals(pass)) {return true;}
			}
		} 
		catch (SQLException e) {}
		return false;
	}
	
	
	
	@SuppressWarnings("resource")
	public void registrazione(DatiAccesso d) throws SQLException, IOException 
	{
		String email = d.getEmail();
		String pass = d.getPass();
		String nome = d.getNome();
		String cognome = d.getCognome();
		int cell = d.getCell();
		String nazione = d.getNazione();
		Date data_nascita = d.getData_nascita();
		
		
		PreparedStatement prepared = (PreparedStatement) con.prepareStatement("insert into cliente (email,pass,nome,cognome,cell,nazione,data_nascita,tipo) values(?,?,?,?,?,?,?,?)");
		prepared.setString(1, email);
		prepared.setString(2, pass);
		prepared.setString(3, nome);
		prepared.setString(4, cognome);
		prepared.setInt(5, cell);
		prepared.setString(6, nazione);
		prepared.setDate(7, (java.sql.Date) data_nascita);
		prepared.setString(8, "u");
		
		prepared.executeUpdate();
		 
	
	}
	
	public List<String> Ricerca(String arr,int m, int a) {
		String periodo;
		String anno = String.valueOf(a);
		String mese = String.valueOf(m);
		List<String> info_p = new ArrayList<String>();
		try 
		{
			ResultSet result = null;
			if(arr != "" && m!=0 && a != 0) {
				periodo=anno + "-" + mese + "-%";
				PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM pacchetti where nazione = ? AND data_inizio like ?;");
				prepared.setString(2, periodo);
				prepared.setString(1,arr);
				result = (ResultSet) prepared.executeQuery();
			}
			else if (arr != "" && m == 0 && a == 0) {
				PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM pacchetti where nazione = ? ");
				prepared.setString(1,arr);
				result = (ResultSet) prepared.executeQuery();
			}
			else if (arr == "" && m!= 0 && a != 0) {
				periodo=anno + "-" + mese + "-%";
				System.out.print(periodo);
				PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM pacchetti where data_inizio like ?;");
				prepared.setString(1, periodo);
				result = (ResultSet) prepared.executeQuery();
			}
										
			while (result.next())
			{
				info_p.add(result.getString("immagine"));
				info_p.add(result.getString("destinazione"));
				info_p.add(result.getString("descrizione_pacchetto"));
				info_p.add(result.getString("prezzo"));
				info_p.add(result.getString("codice_pacchetto"));
			}
			
		}
		catch (Exception e){}
		
		return info_p;
	}
public List<String> Pac() {
		int i = 0;
		List<String> info_p = new ArrayList<String>();
		try 
		{
			ResultSet result = null;
			PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM pacchetti;");
			result = (ResultSet) prepared.executeQuery();
										
			while (result.next())
			{
					
					info_p.add(result.getString("immagine"));
					info_p.add(result.getString("descrizione_pacchetto"));
					info_p.add(result.getString("prezzo"));
					info_p.add(result.getString("destinazione"));
					info_p.add(result.getString("codice_pacchetto"));
					info_p.add(result.getString("n_pacchetti_acquistati"));
					
			}
			
		}
		catch (Exception e){}
		
		return info_p;
	}
public void Pagina_pacc(String id,DatiPacchetti p,DatiVolo v,DatiAllogio a) {
	try 
	{
		String cod_a = null,cod_v = null;
		ResultSet result = null;
		PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM pacchetti where codice_pacchetto = ?;");
		prepared.setString(1, id);
		result = (ResultSet) prepared.executeQuery();
									
		while (result.next())
		{
				
				p.setImmagine(result.getString("immagine"));
				p.setDescrPacc(result.getString("descrizione_pacchetto"));
				p.setData_f(result.getString("data_fine"));
				p.setData_i(result.getString("data_inizio"));
				p.setNazione(result.getString("nazione"));
				p.setDescrluogo(result.getString("descrizione_luogo"));
				p.setPrezzo(result.getString("prezzo"));
				p.setDestinazione(result.getString("destinazione"));
				p.setN_acquisti(result.getString("n_pacchetti_acquistati"));
				cod_a = result.getString("codice_struttura");
				cod_v = result.getString("codice_volo");
		}
		prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM struttura where codice_struttura = ?;");
		prepared.setString(1, cod_a);
		result = (ResultSet) prepared.executeQuery();
									
		while (result.next())
		{
				
				a.setIndirizzo(result.getString("indirizzo"));
				a.setPrezzo(result.getString("prezzo"));
				a.setServizio(result.getString("servizio"));
				a.setTipo(result.getString("tipo"));				
		}
		prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM volo where codice_volo = ?;");
		prepared.setString(1, cod_v);
		result = (ResultSet) prepared.executeQuery();
									
		while (result.next())
		{
				
				v.setCompagnia(result.getString("compagnia"));
				v.setOra_a(result.getString("ora_andata"));
				v.setOra_r(result.getString("ora_ritorno"));
				v.setPrezzo(result.getString("prezzo"));				
		}
		
	}
	catch (Exception e){}
	}
	
	public void SendEmail(String email,String mex,String nome) throws SQLException {
		GregorianCalendar gc = new GregorianCalendar();
		String data = "" + gc.get(Calendar.DAY_OF_MONTH) +"/"+ gc.get(Calendar.MONTH)+"/"+ gc.get(Calendar.YEAR);
		PreparedStatement prepared = (PreparedStatement) con.prepareStatement("insert into messaggi(contenuto_email,data_i,nome_cliente,email)values(?,?,?,?);");
		prepared.setString(1, mex);
		prepared.setString(2, data);
		prepared.setString(3, nome);
		prepared.setString(4, email);
		prepared.executeUpdate();
	}
	public List<String> ReadEmail() {
		int i = 0;
		List<String> info_p = new ArrayList<String>();
		try 
		{
			ResultSet result = null;
			PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM messaggi order by data_i asc;");
			result = (ResultSet) prepared.executeQuery();
										
			while (result.next())
			{
					
					info_p.add(result.getString("contenuto_email"));
					info_p.add(result.getString("nome_cliente"));
					info_p.add(result.getString("data_i"));
					info_p.add(result.getString("email"));
			}
			
		}
		catch (Exception e){}
		
		return info_p;
	}
	public void AggiungiC(String cod,String email) throws SQLException {
		boolean ins = true;
		PreparedStatement prepared = (PreparedStatement) con.prepareStatement("select * from carrello where stato = 'c'");
		ResultSet result = (ResultSet) prepared.executeQuery();
		while(result.next()) {
			if(email.equals((result.getString("email"))) && cod.equals(result.getString("pacchetto"))) {ins=false;}
		}
		
		if(ins == true) {
			prepared = (PreparedStatement) con.prepareStatement("insert into carrello(stato,email,pacchetto,quantita)values(?,?,?,?);");
			prepared.setString(1, "c");
			prepared.setString(2, email);
			prepared.setString(3, cod);
			prepared.setString(4, "0");
			prepared.executeUpdate();
		}
	}
	
	
	public List<String> PacCarrello(String email) {
		int i = 0;
		List<String> info_p = new ArrayList<String>();
		try 
		{
			ResultSet result = null;
			PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM pacchetti where codice_pacchetto = any (SELECT pacchetto FROM carrello where email = ? and stato = 'c');");
			prepared.setString(1, email);
			result = (ResultSet) prepared.executeQuery();
										
			while (result.next())
			{
					
					info_p.add(result.getString("immagine"));
					info_p.add(result.getString("descrizione_pacchetto"));
					info_p.add(result.getString("prezzo"));
					info_p.add(result.getString("destinazione"));
					info_p.add(result.getString("codice_pacchetto"));
					info_p.add(result.getString("n_pacchetti_acquistati"));
					
			}
			
		}
		catch (Exception e){}
		
		return info_p;
	}
	public List<String> PacAcquisti(String email) {
		int i = 0;
		List<String> info_p = new ArrayList<String>();
		try 
		{
			ResultSet result = null;
			PreparedStatement prepared = (PreparedStatement) con.prepareStatement("SELECT * FROM pacchetti,carrello where  codice_pacchetto = pacchetto and codice_pacchetto = any (SELECT pacchetto FROM carrello where email = ? and stato = 'v');");
			prepared.setString(1, email);
			result = (ResultSet) prepared.executeQuery();
										
			while (result.next())
			{
		
					info_p.add(result.getString("immagine"));
					info_p.add(result.getString("descrizione_pacchetto"));
					info_p.add(result.getString("prezzo"));
					info_p.add(result.getString("destinazione"));
					info_p.add(result.getString("codice_pacchetto"));
					info_p.add(result.getString("quantita"));
			}
			
		}
		catch (Exception e){}
		
		return info_p;
	}
	public void Acquista(String q,String id,String e) {
		String n = null,n2 = null;
		int i = 0;
		List<String> info_p = new ArrayList<String>();
		try 
		{
			PreparedStatement prepared = (PreparedStatement) con.prepareStatement("select quantita from carrello where pacchetto = ? AND email = ? AND stato='v';");
			prepared.setString(1, id);
			prepared.setString(2, e);
			ResultSet r = (ResultSet) prepared.executeQuery();
			while(r.next()) {
				n2 = r.getString("quantita");
			}
			int qua;
			if(n2!=null) {qua = Integer.parseInt(n2) + Integer.parseInt(q);} else {qua = Integer.parseInt(q);}
			prepared = (PreparedStatement) con.prepareStatement("delete from carrello where pacchetto = ? AND email = ?;");
			prepared.setString(1, id);
			prepared.setString(2, e);
			prepared.execute();
			prepared = (PreparedStatement) con.prepareStatement("insert into carrello(stato,email,pacchetto,quantita)values(?,?,?,?);");
			prepared.setString(1, "v");
			prepared.setString(2, e);
			prepared.setString(3, id);
			prepared.setString(4, String.valueOf(qua));
			prepared.executeUpdate();
			prepared = (PreparedStatement) con.prepareStatement("select * from pacchetti where codice_pacchetto = ?");
			prepared.setString(1, id);
			r = (ResultSet) prepared.executeQuery();
			while(r.next()) {
				n = r.getString("n_pacchetti_acquistati");
			}
			int j = Integer.parseInt(q);
			int x = Integer.parseInt(n) + j;
			prepared = (PreparedStatement) con.prepareStatement("update pacchetti set n_pacchetti_acquistati = ? where codice_pacchetto = ?");
			prepared.setInt(1,x);
			prepared.setString(2, id);
			prepared.executeUpdate();
		}
		catch (Exception e1){System.out.print("errore");}
	}
	
	public void Elimina(String id,String e) {
		int i = 0;
		List<String> info_p = new ArrayList<String>();
		try 
		{
			PreparedStatement prepared = (PreparedStatement) con.prepareStatement("delete from carrello where pacchetto = ? AND email = ?;");
			prepared.setString(1, id);
			prepared.setString(2, e);
			prepared.execute();
		}
		catch (Exception e1){System.out.print("errore");}
	}
	
	public void Aggiungi(DatiPacchetti d,DatiAllogio s,DatiVolo v) throws  SQLException {
		PreparedStatement prepared = (PreparedStatement) con.prepareStatement("insert into pacchetti(codice_pacchetto,descrizione_pacchetto,prezzo,data_inizio,data_fine,descrizione_luogo,destinazione,nazione,immagine,n_pacchetti_acquistati,codice_volo,codice_struttura)values(?,?,?,?,?,?,?,?,?,?,?,?);");
		prepared.setString(1, d.getCodice());
		prepared.setString(2, d.getDescrPacc());
		int n = Integer.parseInt(d.getPrezzo());
		prepared.setInt(3, n);
		prepared.setString(4, d.getData_i());
		prepared.setString(5, d.getData_f());
		prepared.setString(6, d.getDescrluogo());
		prepared.setString(7, d.getDestinazione());
		prepared.setString(8, d.getNazione());
		prepared.setString(9, d.getImmagine());
		n = 0;
		prepared.setInt(10, n);
		prepared.setString(11, v.getCodice());
		prepared.setString(12, s.getCodice());
		prepared.executeUpdate();
		
		prepared = (PreparedStatement) con.prepareStatement("insert into struttura(codice_struttura,prezzo,indirizzo,tipo,servizio)values(?,?,?,?,?);");
		prepared.setString(1, s.getCodice());
		prepared.setString(3,s.getIndirizzo() );
		n = Integer.parseInt(s.getPrezzo());
		prepared.setInt(2, n);
		prepared.setString(4, s.getTipo());
		prepared.setString(5, s.getServizio());
		prepared.executeUpdate();
		
		prepared = (PreparedStatement) con.prepareStatement("insert into volo(codice_volo,prezzo,compagnia,ora_andata,ora_ritorno)values(?,?,?,?,?);");
		prepared.setString(1, v.getCodice());
		prepared.setString(3,v.getCompagnia() );
		n = Integer.parseInt(v.getPrezzo());
		prepared.setInt(2, n);
		prepared.setString(4, v.getOra_a());
		prepared.setString(5, v.getOra_r());
		prepared.executeUpdate();
	}
	
	public void Elimina_pac(String id) {
		String s = null,v = null;
		int i = 0;
		List<String> info_p = new ArrayList<String>();
		try 
		{
			PreparedStatement prepared = (PreparedStatement) con.prepareStatement("select * from pacchetti where codice_pacchetto = ?;");
			prepared.setString(1, id);
			ResultSet r = (ResultSet) prepared.executeQuery();
			while(r.next()) {
				s = (String) (r.getString("codice_struttura"));
				v = (String)(r.getString("codice_volo"));
			}
			
			prepared = (PreparedStatement) con.prepareStatement("delete from pacchetti where codice_pacchetto = ?;");
			prepared.setString(1, id);
			prepared.execute();
			
			prepared = (PreparedStatement) con.prepareStatement("delete from volo where codice_volo = ?;");
			prepared.setString(1, v);
			prepared.execute();
			
			prepared = (PreparedStatement) con.prepareStatement("delete from struttura where codice_struttura = ?;");
			prepared.setString(1, s);
			prepared.execute();
		}
		catch (Exception e1){System.out.print("errore");}
	}
	
	private Connection con;
}

	
