package com.nenad.model;

public class Vozilo {
	private int voziloID;
	private String datum;
	private String vreme;
	private String marka;
	private String tip;
	private String godiste;
	private String imeVlasnika;
	private String telefon;
	private String adresa;
	
		
	public Vozilo() {
		super();
	}

	public Vozilo(int voziloID, String datum, String vreme, String marka, String tip, String godiste,
			String imeVlasnika, String telefon, String adresa) {
		super();
		this.voziloID = voziloID;
		this.datum = datum;
		this.vreme = vreme;
		this.marka = marka;
		this.tip = tip;
		this.godiste = godiste;
		this.imeVlasnika = imeVlasnika;
		this.telefon = telefon;
		this.adresa = adresa;
	}

	public Vozilo(String datum, String vreme, String marka, String tip, String godiste, String imeVlasnika,
			String telefon, String adresa) {
		super();
		this.datum = datum;
		this.vreme = vreme;
		this.marka = marka;
		this.tip = tip;
		this.godiste = godiste;
		this.imeVlasnika = imeVlasnika;
		this.telefon = telefon;
		this.adresa = adresa;
	}

	public int getVoziloID() {
		return voziloID;
	}

	public void setVoziloID(int voziloID) {
		this.voziloID = voziloID;
	}

	public String getDatum() {
		return datum;
	}

	public void setDatum(String datum) {
		this.datum = datum;
	}

	public String getVreme() {
		return vreme;
	}

	public void setVreme(String vreme) {
		this.vreme = vreme;
	}

	public String getMarka() {
		return marka;
	}

	public void setMarka(String marka) {
		this.marka = marka;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getGodiste() {
		return godiste;
	}

	public void setGodiste(String godiste) {
		this.godiste = godiste;
	}

	public String getImeVlasnika() {
		return imeVlasnika;
	}

	public void setImeVlasnika(String imeVlasnika) {
		this.imeVlasnika = imeVlasnika;
	}

	public String getTelefon() {
		return telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public String getAdresa() {
		return adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	@Override
	public String toString() {
		return "Vozilo [voziloID=" + voziloID + ", datum=" + datum + ", vreme=" + vreme + ", marka=" + marka + ", tip="
				+ tip + ", godiste=" + godiste + ", imeVlasnika=" + imeVlasnika + ", telefon=" + telefon + ", adresa="
				+ adresa + "]";
	}
	
	
	
	

}
