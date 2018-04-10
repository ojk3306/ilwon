package lesson.model.vo;

import java.io.Serializable;
import java.util.Arrays;

public class LessonSearch implements Serializable {
	
	private static final long serialVersionUID = 10000L;
	private String locationValue;
	private String lessonValue;
	private String teacherGenderValue;
	private String teacherAgePreValue;
	private String teacherAgeEndValue;
	private String teacherEXPValue[];
	private String lessonPricePreValue;
	private String lessonPriceEndValue;
	private String lessonLevelValue;
	
	public LessonSearch() {
		// TODO Auto-generated constructor stub
	}

	public LessonSearch(String locationValue, String lessonValue, String teacherGenderValue, String teacherAgePreValue,
			String teacherAgeEndValue, String[] teacherEXPValue, String lessonPricePreValue, String lessonPriceEndValue,
			String lessonLevelValue) {
		super();
		this.locationValue = locationValue;
		this.lessonValue = lessonValue;
		this.teacherGenderValue = teacherGenderValue;
		this.teacherAgePreValue = teacherAgePreValue;
		this.teacherAgeEndValue = teacherAgeEndValue;
		this.teacherEXPValue = teacherEXPValue;
		this.lessonPricePreValue = lessonPricePreValue;
		this.lessonPriceEndValue = lessonPriceEndValue;
		this.lessonLevelValue = lessonLevelValue;
	}

	public String getLocationValue() {
		return locationValue;
	}

	public void setLocationValue(String locationValue) {
		this.locationValue = locationValue;
	}

	public String getLessonValue() {
		return lessonValue;
	}

	public void setLessonValue(String lessonValue) {
		this.lessonValue = lessonValue;
	}

	public String getTeacherGenderValue() {
		return teacherGenderValue;
	}

	public void setTeacherGenderValue(String teacherGenderValue) {
		this.teacherGenderValue = teacherGenderValue;
	}

	public String getTeacherAgePreValue() {
		return teacherAgePreValue;
	}

	public void setTeacherAgePreValue(String teacherAgePreValue) {
		this.teacherAgePreValue = teacherAgePreValue;
	}

	public String getTeacherAgeEndValue() {
		return teacherAgeEndValue;
	}

	public void setTeacherAgeEndValue(String teacherAgeEndValue) {
		this.teacherAgeEndValue = teacherAgeEndValue;
	}

	public String[] getTeacherEXPValue() {
		return teacherEXPValue;
	}

	public void setTeacherEXPValue(String[] teacherEXPValue) {
		this.teacherEXPValue = teacherEXPValue;
	}

	public String getLessonPricePreValue() {
		return lessonPricePreValue;
	}

	public void setLessonPricePreValue(String lessonPricePreValue) {
		this.lessonPricePreValue = lessonPricePreValue;
	}

	public String getLessonPriceEndValue() {
		return lessonPriceEndValue;
	}

	public void setLessonPriceEndValue(String lessonPriceEndValue) {
		this.lessonPriceEndValue = lessonPriceEndValue;
	}

	public String getLessonLevelValue() {
		return lessonLevelValue;
	}

	public void setLessonLevelValue(String lessonLevelValue) {
		this.lessonLevelValue = lessonLevelValue;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LessonSearch [locationValue=" + locationValue + ", lessonValue=" + lessonValue + ", teacherGenderValue="
				+ teacherGenderValue + ", teacherAgePreValue=" + teacherAgePreValue + ", teacherAgeEndValue="
				+ teacherAgeEndValue + ", teacherEXPValue=" + Arrays.toString(teacherEXPValue)
				+ ", lessonPricePreValue=" + lessonPricePreValue + ", lessonPriceEndValue=" + lessonPriceEndValue
				+ ", lessonLevelValue=" + lessonLevelValue + "]";
	}	
}
