package lesson.model.vo;

import java.io.Serializable;

/**
 * @author user1
 *
 */
public class Sidebar implements Serializable {
	private static final long serialVersionUID = 1033200L;
	private String user_name;
	private int lesson_no;
	private String category_small;
	private String LESSON_RENAME_PHOTO;
	public Sidebar() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Sidebar [user_name=" + user_name + ", lesson_no=" + lesson_no + ", category_small=" + category_small
				+ ", LESSON_RENAME_PHOTO=" + LESSON_RENAME_PHOTO + "]";
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getLesson_no() {
		return lesson_no;
	}
	public void setLesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}
	public String getCategory_small() {
		return category_small;
	}
	public void setCategory_small(String category_small) {
		this.category_small = category_small;
	}
	public String getLESSON_RENAME_PHOTO() {
		return LESSON_RENAME_PHOTO;
	}
	public void setLESSON_RENAME_PHOTO(String lESSON_RENAME_PHOTO) {
		LESSON_RENAME_PHOTO = lESSON_RENAME_PHOTO;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
