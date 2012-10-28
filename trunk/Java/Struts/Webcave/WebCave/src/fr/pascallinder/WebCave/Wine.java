package fr.pascallinder.WebCave;

public class Wine {
	private long wineId;
	private String strWineName;
	private String strWineType;
	private Integer wineYear;
	private String wineColor;
	private String wineProducer;
	/**
	 * @return the wineId
	 */
	public long getWineId() {
		return wineId;
	}
	/**
	 * @param wineId the wineId to set
	 */
	public void setWineId(long wineId) {
		this.wineId = wineId;
	}
	/**
	 * @return the strWineName
	 */
	public String getStrWineName() {
		return strWineName;
	}
	/**
	 * @param strWineName the strWineName to set
	 */
	public void setStrWineName(String strWineName) {
		this.strWineName = strWineName;
	}
	/**
	 * @return the wineYear
	 */
	public Integer getWineYear() {
		return wineYear;
	}
	/**
	 * @param wineYear the wineYear to set
	 */
	public void setWineYear(Integer wineYear) {
		this.wineYear = wineYear;
	}
	/**
	 * @return the wineColor
	 */
	public String getWineColor() {
		return wineColor;
	}
	/**
	 * @param wineColor the wineColor to set
	 */
	public void setWineColor(String wineColor) {
		this.wineColor = wineColor;
	}
	/**
	 * @return the wineProducer
	 */
	public String getWineProducer() {
		return wineProducer;
	}
	/**
	 * @param wineProducer the wineProducer to set
	 */
	public void setWineProducer(String wineProducer) {
		this.wineProducer = wineProducer;
	}

	/**
	 * @return the strWineType
	 */
	public String getStrWineType() {
		return strWineType;
	}
	/**
	 * @param strWineType the strWineType to set
	 */
	public void setStrWineType(String strWineType) {
		this.strWineType = strWineType;
	}
	
	// Constructor
	public Wine(){
	}
	
	// Constructor to inititate the properties
	public Wine(long wineId, String strWineName, Integer wineYear,
			String wineColor, String wineProducer){
		this.wineId = wineId;
		this.strWineName = strWineName;
		this.wineYear = wineYear;
		this.wineColor = wineColor;
		this.wineProducer = wineProducer; 
	}

	

}
