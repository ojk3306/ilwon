package seach_log.model.vo;

public class Seach_log implements java.io.Serializable{
	private static final long serialVersionUID = 122L;
	private int SEARCH_NO;
	private int SEARCH_DATE;
	private String SEACH_CONTENT; 
	private Integer USER_NO;
	
	public Seach_log() {}

	public int getSEARCH_NO() {
		return SEARCH_NO;
	}





	public void setSEARCH_NO(int sEARCH_NO) {
		SEARCH_NO = sEARCH_NO;
	}





	public int getSEARCH_DATE() {
		return SEARCH_DATE;
	}





	public void setSEARCH_DATE(int sEARCH_DATE) {
		SEARCH_DATE = sEARCH_DATE;
	}





	public String getSEACH_CONTENT() {
		return SEACH_CONTENT;
	}





	public void setSEACH_CONTENT(String sEACH_CONTENT) {
		SEACH_CONTENT = sEACH_CONTENT;
	}





	public Integer getUSER_NO() {
		return USER_NO;
	}





	public void setUSER_NO(Integer uSER_NO) {
		USER_NO = uSER_NO;
	}





	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	public Seach_log(int sEARCH_NO, int sEARCH_DATE, String sEACH_CONTENT, Integer uSER_NO) {
		super();
		SEARCH_NO = sEARCH_NO;
		SEARCH_DATE = sEARCH_DATE;
		SEACH_CONTENT = sEACH_CONTENT;
		USER_NO = uSER_NO;
	}
	
	
	
	
}
