package seminaDetail.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SeminaDetail implements Serializable {
	
	private static final long serialVersionUID = 3001L;
	private int seminaDetailNo;
	private int seminaNo;
	private int userNo;
	private Date seminaDetailDate;
	private String seminaState;
	
	public SeminaDetail() {
		
	}

	public SeminaDetail(int seminaDetailNo, int seminaNo, int userNo, Date seminaDetailDate, String seminaState) {
		super();
		this.seminaDetailNo = seminaDetailNo;
		this.seminaNo = seminaNo;
		this.userNo = userNo;
		this.seminaDetailDate = seminaDetailDate;
		this.seminaState = seminaState;
	}

	public int getSeminaDetailNo() {
		return seminaDetailNo;
	}

	public void setSeminaDetailNo(int seminaDetailNo) {
		this.seminaDetailNo = seminaDetailNo;
	}

	public int getSeminaNo() {
		return seminaNo;
	}

	public void setSeminaNo(int seminaNo) {
		this.seminaNo = seminaNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getSeminaDetailDate() {
		return seminaDetailDate;
	}

	public void setSeminaDetailDate(Date seminaDetailDate) {
		this.seminaDetailDate = seminaDetailDate;
	}

	public String getSeminaState() {
		return seminaState;
	}

	public void setSeminaState(String seminaState) {
		this.seminaState = seminaState;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SeminaDetail [seminaDetailNo=" + seminaDetailNo + ", seminaNo=" + seminaNo + ", userNo=" + userNo
				+ ", seminaDetailDate=" + seminaDetailDate + ", seminaState=" + seminaState + "]";
	}
}
