package categorys.model.vo;

import java.io.Serializable;

public class Categorys implements Serializable{
	
	private static final long serialVersionUID = 2348L; 
public Categorys() {
	// TODO Auto-generated constructor stub
}
private int CATEGORY_NO;
private String cATEGORY_BIG;
private String CATEGORY_SMALL;
private int CATEGORY_HIT;
public int getCATEGORY_NO() {
	return CATEGORY_NO;
}
public void setCATEGORY_NO(int cATEGORY_NO) {
	CATEGORY_NO = cATEGORY_NO;
}
public String getcATEGORY_BIG() {
	return cATEGORY_BIG;
}
public void setcATEGORY_BIG(String cATEGORY_BIG) {
	this.cATEGORY_BIG = cATEGORY_BIG;
}
public String getCATEGORY_SMALL() {
	return CATEGORY_SMALL;
}
public void setCATEGORY_SMALL(String cATEGORY_SMALL) {
	CATEGORY_SMALL = cATEGORY_SMALL;
}
public int getCATEGORY_HIT() {
	return CATEGORY_HIT;
}
public void setCATEGORY_HIT(int cATEGORY_HIT) {
	CATEGORY_HIT = cATEGORY_HIT;
}
public static long getSerialversionuid() {
	return serialVersionUID;
}
public Categorys(int cATEGORY_NO, String cATEGORY_BIG, String cATEGORY_SMALL, int cATEGORY_HIT) {
	super();
	CATEGORY_NO = cATEGORY_NO;
	this.cATEGORY_BIG = cATEGORY_BIG;
	CATEGORY_SMALL = cATEGORY_SMALL;
	CATEGORY_HIT = cATEGORY_HIT;
}

@Override
public String toString() {
	return "Categorys [CATEGORY_NO=" + CATEGORY_NO + ", cATEGORY_BIG=" + cATEGORY_BIG + ", CATEGORY_SMALL="
			+ CATEGORY_SMALL + ", CATEGORY_HIT=" + CATEGORY_HIT + "]";
}
	
}
