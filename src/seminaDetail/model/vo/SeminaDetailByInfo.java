package seminaDetail.model.vo;
public class SeminaDetailByInfo {
public SeminaDetailByInfo() {
	// TODO Auto-generated constructor stub
}
private int SEMINA_NO; //세미나 전화번호
private int USER_NO; //
private String SEMINA_TITLE;
private String SEMINA_LOCATION; //세미나 강의위치
private String SEMINA_ENDDATE; //세미나 강의날.
private int SEMINA_NOW; //세미나 현재 신청인원
private int SEMINA_DETAIL_STATE; //세미나를 정상적으로 신청했는지, 취소했는지.
private int SEMINA_DETAIL_NO; 
private int SEMINA_STATE; //현 세미나 상태 
private String USER_PHONE; //세미나 진행자 전화번호


public int getSEMINA_NO() {
	return SEMINA_NO;
}
public void setSEMINA_NO(int sEMINA_NO) {
	SEMINA_NO = sEMINA_NO;
}
public int getUSER_NO() {
	return USER_NO;
}
public void setUSER_NO(int uSER_NO) {
	USER_NO = uSER_NO;
}
public String getSEMINA_TITLE() {
	return SEMINA_TITLE;
}
public void setSEMINA_TITLE(String sEMINA_TITLE) {
	SEMINA_TITLE = sEMINA_TITLE;
}
public String getSEMINA_LOCATION() {
	return SEMINA_LOCATION;
}
public void setSEMINA_LOCATION(String sEMINA_LOCATION) {
	SEMINA_LOCATION = sEMINA_LOCATION;
}
public String getSEMINA_ENDDATE() {
	return SEMINA_ENDDATE;
}
public void setSEMINA_ENDDATE(String sEMINA_ENDDATE) {
	SEMINA_ENDDATE = sEMINA_ENDDATE;
}
public int getSEMINA_NOW() {
	return SEMINA_NOW;
}
public void setSEMINA_NOW(int sEMINA_NOW) {
	SEMINA_NOW = sEMINA_NOW;
}
public int getSEMINA_DETAIL_STATE() {
	return SEMINA_DETAIL_STATE;
}
public void setSEMINA_DETAIL_STATE(int sEMINA_DETAIL_STATE) {
	SEMINA_DETAIL_STATE = sEMINA_DETAIL_STATE;
}
public int getSEMINA_DETAIL_NO() {
	return SEMINA_DETAIL_NO;
}
public void setSEMINA_DETAIL_NO(int sEMINA_DETAIL_NO) {
	SEMINA_DETAIL_NO = sEMINA_DETAIL_NO;
}
public int getSEMINA_STATE() {
	return SEMINA_STATE;
}
public void setSEMINA_STATE(int sEMINA_STATE) {
	SEMINA_STATE = sEMINA_STATE;
}
public String getUSER_PHONE() {
	return USER_PHONE;
}
public void setUSER_PHONE(String uSER_PHONE) {
	USER_PHONE = uSER_PHONE;
}
public SeminaDetailByInfo(int sEMINA_NO, int uSER_NO, String sEMINA_TITLE, String sEMINA_LOCATION,
		String sEMINA_ENDDATE, int sEMINA_NOW, int sEMINA_DETAIL_STATE, int sEMINA_DETAIL_NO, int sEMINA_STATE,
		String uSER_PHONE) {
	super();
	SEMINA_NO = sEMINA_NO;
	USER_NO = uSER_NO;
	SEMINA_TITLE = sEMINA_TITLE;
	SEMINA_LOCATION = sEMINA_LOCATION;
	SEMINA_ENDDATE = sEMINA_ENDDATE;
	SEMINA_NOW = sEMINA_NOW;
	SEMINA_DETAIL_STATE = sEMINA_DETAIL_STATE;
	SEMINA_DETAIL_NO = sEMINA_DETAIL_NO;
	SEMINA_STATE = sEMINA_STATE;
	USER_PHONE = uSER_PHONE;
}
@Override
public String toString() {
	return "SeminaDetailByInfo [SEMINA_NO=" + SEMINA_NO + ", USER_NO=" + USER_NO + ", SEMINA_TITLE=" + SEMINA_TITLE
			+ ", SEMINA_LOCATION=" + SEMINA_LOCATION + ", SEMINA_ENDDATE=" + SEMINA_ENDDATE + ", SEMINA_NOW="
			+ SEMINA_NOW + ", SEMINA_DETAIL_STATE=" + SEMINA_DETAIL_STATE + ", SEMINA_DETAIL_NO=" + SEMINA_DETAIL_NO
			+ ", SEMINA_STATE=" + SEMINA_STATE + ", USER_PHONE=" + USER_PHONE + "]";
}




}
