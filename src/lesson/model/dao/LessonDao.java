package lesson.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import lesson.model.vo.Lesson;
import lesson.model.vo.LessonDetail;
import lesson.model.vo.Onlesson;


public class LessonDao {

	
	public LessonDao() {}

	public int insertlesson(Connection conn, Lesson lesson) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into lesson values((SELECT max(lesson_no) from lesson)+1"
				+ ",?,1,5513,null,?,?,?,?,?,?,sysdate,null,?,?,?,?,7000,null,null)";
		
		
		try {
		System.out.println("lesson.getUser_no2()"+lesson.getUser_no2());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson.getLevel_no());
			pstmt.setInt(2, lesson.getUser_no2());
			pstmt.setString(3, lesson.getLesson_title());
			pstmt.setString(4, lesson.getLesson_loc());
			pstmt.setInt(5, lesson.getLesson_rad());
			pstmt.setInt(6, lesson.getLesson_price());
			pstmt.setInt(7, lesson.getLesson_count());
			pstmt.setString(8, lesson.getLesson_contop());
			pstmt.setString(9, lesson.getLesson_conmid());
			pstmt.setString(10, lesson.getLesson_conbot());
			pstmt.setString(11, lesson.getLesson_keyword());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateLesson(Connection conn, Lesson lesson) {
		
		return 0;
	}

	public int deleteLesson(Connection conn, Lesson lesson) {
		
		return 0;
	}

	public ArrayList<Lesson> selectLessonList(Connection con) {
		
		ArrayList<Lesson> list = new ArrayList<Lesson>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * "
				+ "from lesson l, users u, lessonlev lv, lessontype lt, categorys c "
				+ "where l.USER_NO1 = u.user_no "
				+ "and l.LEVEL_NO = lv.LESSONLEV_NO "
				+ "and l.LESSON_TYPE = lt.TYPE_NO "
				+ "and l.category_no = c.category_no "
				+ "and rownum <= 5 "
				+ "order by lesson_startdate desc";
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Lesson lesson = new Lesson();				
				lesson.setLesson_no(rset.getInt("lesson_no"));
				lesson.setLevel_no(rset.getInt("level_no"));
				lesson.setLevel(rset.getString("lessonlev"));
				lesson.setState_no(rset.getInt("state_no"));
				lesson.setCategory_no(rset.getInt("category_no"));
				lesson.setCategory_bigName(rset.getString("category_big"));
				lesson.setCategory_smallName(rset.getString("category_small"));
				lesson.setUser_no1(rset.getInt("user_no1"));
				lesson.setUser_no2(rset.getInt("user_no2"));
				lesson.setUser_name1(rset.getString("user_name"));
				lesson.setUser_name2(rset.getString("user_name"));
				lesson.setLesson_title(rset.getString("lesson_title"));
				lesson.setLesson_loc(rset.getString("lesson_location"));
				lesson.setLesson_rad(rset.getInt("lesson_radius"));
				lesson.setLesson_price(rset.getInt("lesson_price"));
				lesson.setLesson_count(rset.getInt("lesson_count"));
				lesson.setLesson_startdate(rset.getDate("lesson_startdate"));
				lesson.setLesson_enddate(rset.getDate("lesson_enddate"));
				lesson.setLesson_contop(rset.getString("lesson_contop"));
				lesson.setLesson_conmid(rset.getString("lesson_conmid"));
				lesson.setLesson_conbot(rset.getString("lesson_conbot"));
				lesson.setLesson_keyword(rset.getString("lesson_keyword"));
				lesson.setLesson_type(rset.getInt("lesson_type"));				
				
				list.add(lesson);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Onlesson> onlesson(Connection conn, int user) {
		ArrayList<Onlesson> onlesson = new ArrayList<Onlesson>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = 
				"select l.lesson_title, u.user_name, s.state, l.lesson_no, l.lesson_enddate from lesson l, users u,state s where l.user_no2 = u.user_no and l.state_no=s.state_no and " + 
				"l.user_no2 = ? order by l.lesson_no desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			Onlesson l = new Onlesson();
			l.setLesson_title(rset.getString("lesson_title"));
			l.setState(rset.getString("state"));
			l.setUser_name(rset.getString("user_name"));
			l.setLesson_no(rset.getInt("lesson_no"));
			l.setLesson_enddate(rset.getDate("lesson_enddate"));
			System.out.println(l.toString());
			onlesson.add(l);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return onlesson;
	}

	public int stopLesson(Connection conn, int lesson_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "update lesson set state_no = 2, lesson_enddate = sysdate where lesson_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson_no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public LessonDetail lessonView(Connection conn, int lesson_no) {
		LessonDetail l = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//String sql= "select l.lesson_title, lv.lessonlev, l.LESSON_LOCATION, l.lesson_radius, l.lesson_price, l.lesson_count, l.state_no, l.lesson_contop, l.lesson_conmid, l.lesson_conbot, l.lesson_keyword, u.user_name, r.review_prepare, r.review_sincerity, r.review_delivery, r.review_no, r.review_content from lesson l, review r,users u,lessonlev lv where l.lesson_no = r.lesson_no and l.user_no2=u.user_no and l.level_no = lv.lessonlev_no and l.lesson_no = ? and l.user_no2 = (select user_no2 from lesson where lesson_no = ?) and l.level_no = (select level_no from lesson where lesson_no = ?)";
		String sql2="select l.lesson_title, lv.lessonlev, l.LESSON_LOCATION, l.lesson_radius, l.lesson_price, l.lesson_count, l.state_no, l.lesson_contop, l.lesson_conmid, l.lesson_conbot, l.lesson_keyword, u.user_name from lesson l, users u,lessonlev lv where l.user_no2=u.user_no and l.level_no = lv.lessonlev_no and l.lesson_no = ? and l.user_no2 = (select user_no2 from lesson where lesson_no = ?) and l.level_no = (select level_no from lesson where lesson_no = ?)";
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, lesson_no);
			pstmt.setInt(2, lesson_no);
			pstmt.setInt(3, lesson_no);
			rset = pstmt.executeQuery();
			
			//리뷰 있을시
				if(rset.next()) {
				l = new LessonDetail();	
				l.setLesson_no(lesson_no);
				l.setLesson_title(rset.getString("lesson_title"));
				l.setLevel(rset.getString("lessonlev"));
				l.setLesson_loc(rset.getString("lesson_location"));
				l.setLesson_rad(rset.getInt("lesson_radius"));
				l.setLesson_price(rset.getInt("lesson_price"));
				l.setLesson_count(rset.getInt("lesson_count"));
				l.setState_no(rset.getInt("state_no"));
				l.setLesson_contop(rset.getString("lesson_contop"));
				l.setLesson_conmid(rset.getString("lesson_conmid"));
				l.setLesson_conbot(rset.getString("lesson_conbot"));
				l.setLesson_keyword(rset.getString("lesson_keyword"));
				l.setUser_name(rset.getString("user_name"));
		/*		l.setReviewPrepare(rset.getInt("review_prepare"));
				l.setReviewSincerity(rset.getInt("review_sincerity"));
				l.setReviewDelivery(rset.getInt("review_delivery"));
				l.setReviewNo(rset.getInt("review_no"));
				l.setReviewContent(rset.getString("review_content"));*/
				
				System.out.println(l.toString());
				
				}/*else {
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, lesson_no);
					pstmt.setInt(2, lesson_no);
					pstmt.setInt(3, lesson_no);
					rset = pstmt.executeQuery();
					rset.next();
					l = new LessonDetail();	
					l.setLesson_no(lesson_no);
					l.setLesson_title(rset.getString("lesson_title"));
					l.setlevel(rset.getString("lessonlev"));
					l.setLesson_loc(rset.getString("lesson_location"));
					l.setLesson_rad(rset.getInt("lesson_radius"));
					l.setLesson_price(rset.getInt("lesson_price"));
					l.setLesson_count(rset.getInt("lesson_count"));
					l.setState_no(rset.getInt("state_no"));
					l.setLesson_contop(rset.getString("lesson_contop"));
					l.setLesson_conmid(rset.getString("lesson_conmid"));
					l.setLesson_conbot(rset.getString("lesson_conbot"));
					l.setLesson_keyword(rset.getString("lesson_keyword"));
					l.setUser_name(rset.getString("user_name"));
					
					
				}*/
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		return l;
	}

	public ArrayList<Lesson> selectSearchList(Connection con, String locationValue, String lessonValue, String teacherGenderValue, 
			String teacherAgePreValue, String teacherAgeEndValue, String[] teacherEXPValue, String lessonPricePreValue, 
			String lessonPriceEndValue, String lessonLevelValue) {
		
		return null;
		
	}

	public ArrayList<Lesson> seachlistByKeyword(Connection con, String string) {
		ArrayList<Lesson> list = new ArrayList<Lesson>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql="select * from LESSON where LESSON_KEYWORD like ?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,string);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Lesson lesson = new Lesson();				
				lesson.setLesson_no(rset.getInt("lesson_no"));
				lesson.setLevel_no(rset.getInt("level_no"));
				lesson.setLevel(rset.getString("lessonlev"));
				lesson.setState_no(rset.getInt("state_no"));
				lesson.setCategory_no(rset.getInt("category_no"));
				lesson.setCategory_bigName(rset.getString("category_big"));
				lesson.setCategory_smallName(rset.getString("category_small"));
				lesson.setUser_no1(rset.getInt("user_no1"));
				lesson.setUser_no2(rset.getInt("user_no2"));
				lesson.setUser_name1(rset.getString("user_name"));
				lesson.setUser_name2(rset.getString("user_name"));
				lesson.setLesson_title(rset.getString("lesson_title"));
				lesson.setLesson_loc(rset.getString("lesson_location"));
				lesson.setLesson_rad(rset.getInt("lesson_radius"));
				lesson.setLesson_price(rset.getInt("lesson_price"));
				lesson.setLesson_count(rset.getInt("lesson_count"));
				lesson.setLesson_startdate(rset.getDate("lesson_startdate"));
				lesson.setLesson_enddate(rset.getDate("lesson_enddate"));
				lesson.setLesson_contop(rset.getString("lesson_contop"));
				lesson.setLesson_conmid(rset.getString("lesson_conmid"));
				lesson.setLesson_conbot(rset.getString("lesson_conbot"));
				lesson.setLesson_keyword(rset.getString("lesson_keyword"));
				lesson.setLesson_type(rset.getInt("lesson_type"));	
				lesson.setLESSON_ORIGINAL_PHOTO(rset.getString("LESSON_ORIGINAL_PHOTO"));
				lesson.setLESSON_RENAME_PHOTO(rset.getString("LESSON_RENAME_PHOTO"));
				list.add(lesson);			
			}		
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}
	
}
	

