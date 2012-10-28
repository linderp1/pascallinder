package fr.pascallinder.webcave;
import java.util.Date;

public class Wine {
	private long id;
	private String name; //e.g. Château Marcadis
	private String appellation; //e.g. Lalande-De-Pomerol
	private String type; //e.g. Bordeaux rouge
	private Integer year; //e.g. 1997
	private Integer volume; //e.g. 75 (cl)
	private Float alcohol; //e.g. 12.5 (%)
	boolean available; 
	/**
	 * @return Returns the alcohol.
	 */
	public Float getAlcohol() {
		return alcohol;
	}
	/**
	 * @param alcohol The alcohol to set.
	 */
	public void setAlcohol(Float alcohol) {
		this.alcohol = alcohol;
	}
	/**
	 * @return Returns the appellation.
	 */
	public String getAppellation() {
		return appellation;
	}
	/**
	 * @param appellation The appellation to set.
	 */
	public void setAppellation(String appellation) {
		this.appellation = appellation;
	}
	/**
	 * @return Returns the id.
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id The id to set.
	 */
	public void setId(long id) {
		this.id = id;
	}
	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return Returns the type.
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type The type to set.
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return Returns the volume.
	 */
	public Integer getVolume() {
		return volume;
	}
	/**
	 * @param volume The volume to set.
	 */
	public void setVolume(Integer volume) {
		this.volume = volume;
	}
	/**
	 * @return Returns the year.
	 */
	public Integer getYear() {
		return year;
	}
	/**
	 * @param year The year to set.
	 */
	public void setYear(Integer year) {
		this.year = year;
	}
	/**
	 * @return Returns the available.
	 */
	public boolean isAvailable() {
		return available;
	}
	/**
	 * @param available The available to set.
	 */
	public void setAvailable(boolean available) {
		this.available = available;
	}
	//	 Contructor
	public Wine(){}
	//  Contructor to initial the properties
	
	public Wine(long id, String name, String appellation, String type,
			Integer year, Integer volume, Float alcohol, boolean available) {
		this.id = id;
		this.name = name;
		this.appellation = appellation;
		this.type = type;
		this.year = year;
		this.volume = volume;
		this.alcohol = alcohol;
		this.available = available;
	}


}
