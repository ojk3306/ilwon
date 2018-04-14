package lesson.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import lesson.model.vo.Lesson;
import lesson.model.vo.LessonDetail;
import lesson.model.vo.LessonSearch;
import lesson.model.vo.Onlesson;
import lesson.model.vo.Sidebar;


public class LessonDao {

	
	public LessonDao() {}

	public int insertlesson(Connection conn, Lesson lesson) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into lesson values((SELECT max(lesson_no) from lesson)+1"
				+ ",?,1,?,null,?,?,?,?,?,?,sysdate,null,?,?,?,?,7000,?,?,?,?,?,?)";
		
		
		try {
		System.out.println("lesson.getUser_no2()"+lesson.getUser_no2());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson.getLevel_no());
			pstmt.setInt(2, lesson.getCategory_no());
			
			pstmt.setInt(3, lesson.getUser_no2());
			pstmt.setString(4, lesson.getLesson_title());
			pstmt.setString(5, lesson.getLesson_loc());
			pstmt.setInt(6, lesson.getLesson_rad());
			pstmt.setInt(7, lesson.getLesson_price());
			pstmt.setInt(8, lesson.getLesson_count());
			pstmt.setString(9, lesson.getLesson_contop());
			pstmt.setString(10, lesson.getLesson_conmid());
			pstmt.setString(11, lesson.getLesson_conbot());
			pstmt.setString(12, lesson.getLesson_keyword());
			pstmt.setString(13, lesson.getLesson_orginal());
			pstmt.setString(14, lesson.getLesson_rename());
			pstmt.setString(15, lesson.getLesson_orginal2());
			pstmt.setString(16, lesson.getLesson_rename2());
			pstmt.setString(17, lesson.getLesson_orginal3());
			pstmt.setString(18, lesson.getLesson_rename3());
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
				+ "and l.LESSON_ENDDATE is not null "
				+ "and rownum <= 6 "
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
String sql2="select l.user_no2, l.lesson_title, lv.lessonlev, l.LESSON_LOCATION, l.LESSON_rename_PHOTO, l.LESSON_rename_PHOTO2, l.LESSON_rename_PHOTO3, l.lesson_radius, l.lesson_price, l.lesson_count, l.state_no, l.lesson_contop, l.lesson_conmid, l.lesson_conbot, l.lesson_keyword, u.user_name from lesson l, users u,lessonlev lv where l.user_no2=u.user_no and l.level_no = lv.lessonlev_no and l.lesson_no = ? and l.user_no2 = (select user_no2 from lesson where lesson_no = ?) and l.level_no = (select level_no from lesson where lesson_no = ?)";


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
				l.setLesson_rename(rset.getString("LESSON_rename_PHOTO"));
				l.setLesson_rename2(rset.getString("LESSON_rename_PHOTO2"));
				l.setLesson_rename3(rset.getString("LESSON_rename_PHOTO3"));
			l.setUser_no(rset.getInt("user_no2"));
			
			
			
			
			
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

	public ArrayList<LessonSearch> selectSearchList(Connection con, LessonSearch ls) {
		
		System.out.println("SendInfo : " + ls + " / (To.LessonDao)");
		ArrayList<LessonSearch> list = new ArrayList<LessonSearch>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from LESSON l, CATEGORYS c, USERS u, LESSONLEV lv, LESSONTYPE lt, USER_TYPE ut, STATE st "
						+ "where l.CATEGORY_NO = c.CATEGORY_NO "
						+ "and l.USER_NO2 = u.USER_NO "
						+ "and l.LEVEL_NO = lv.LESSONLEV_NO "
						+ "and l.LESSON_TYPE = lt.TYPE_NO "
						+ "and u.USER_TYPE = ut.USERTYPE_NO "
						+ "and l.STATE_NO = st.STATE_NO "
						/*+ "and l.LESSON_ENDDATE is not null "*/
						+ "and l.LESSON_LOCATION like ? "
						+ "and c.CATEGORY_SMALL like ? "
						+ "and u.USER_GENDER like ? "
						+ "and u.USER_AGE >= ? "
						+ "and u.USER_AGE <= ? "
						+ "and l.LESSON_PRICE >= ? "
						+ "and l.LESSON_PRICE <= ? "
						+ "and l.LEVEL_NO >= ? "
						+ "and l.LEVEL_NO <= ? ";		
				
		try {
			pstmt = con.prepareStatement(query);
			list = new ArrayList<LessonSearch>();
			
			if(ls.getLocationValue() != null) {
				pstmt.setString(1, ls.getLocationValue());
			} else {
				pstmt.setString(1, "%%");
			}
			
			if(ls.getLessonValue() != null) {
				pstmt.setString(2, ls.getLessonValue());
			} else {
				pstmt.setString(2, "%%");
			}
			
			if(ls.getTeacherGenderValue() != null) {
				pstmt.setString(3, ls.getTeacherGenderValue());
			} else {
				pstmt.setString(3, "%%");
			}
			
			if(ls.getTeacherAgePreValue() != 0 && ls.getTeacherAgeEndValue() != 0) {
				pstmt.setInt(4, ls.getTeacherAgePreValue());
				pstmt.setInt(5, ls.getTeacherAgeEndValue());
			} else {
				pstmt.setInt(4, 1);
				pstmt.setInt(5, 999999999);
			}
			
			if(ls.getLessonPricePreValue() != 0 && ls.getLessonPriceEndValue() != 0) {
				pstmt.setInt(6, ls.getLessonPricePreValue());
				pstmt.setInt(7, ls.getLessonPriceEndValue());
			} else {
				pstmt.setInt(6, 1);
				pstmt.setInt(7, 999999999);
			}
			
			if(ls.getLessonLevelPreValue() != 0 && ls.getLessonLevelEndValue() != 0) {
				pstmt.setInt(8, ls.getLessonLevelPreValue());
				pstmt.setInt(9, ls.getLessonLevelEndValue());
			} else {
				pstmt.setInt(8, 1);
				pstmt.setInt(9, 999999999);
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				LessonSearch search = new LessonSearch();
				search.setLocationValue(rset.getString("lesson_location"));
				search.setLessonValue(rset.getString("category_small"));
				search.setTeacherGenderValue(rset.getString("user_gender"));
				search.setTeacherAgePreValue(rset.getInt("user_age"));
				search.setTeacherAgeEndValue(rset.getInt("user_age"));
				search.setLessonPricePreValue(rset.getInt("lesson_price"));
				search.setLessonPriceEndValue(rset.getInt("lesson_price"));
				search.setLessonLevelPreValue(rset.getInt("level_no"));
				search.setLessonLevelEndValue(rset.getInt("level_no"));
				search.setLesson_no(rset.getInt("lesson_no"));
				search.setLevel_no(rset.getInt("level_no"));
				search.setLevel(rset.getString("lessonlev"));
				search.setState_no(rset.getInt("state_no"));
				search.setCategory_no(rset.getInt("category_no"));
				search.setCategory_bigName(rset.getString("category_big"));
				search.setCategory_smallName(rset.getString("category_small"));
				search.setUser_no1(rset.getInt("user_no1"));
				search.setUser_no2(rset.getInt("user_no2"));
				search.setUser_name1(rset.getString("user_name"));
				search.setUser_name2(rset.getString("user_name"));
				search.setLesson_title(rset.getString("lesson_title"));
				search.setLesson_loc(rset.getString("lesson_location"));
				search.setLesson_rad(rset.getInt("lesson_radius"));
				search.setLesson_price(rset.getInt("lesson_price"));
				search.setLesson_count(rset.getInt("lesson_count"));
				search.setLesson_startdate(rset.getDate("lesson_startdate"));				
				search.setLesson_contop(rset.getString("lesson_contop"));
				search.setLesson_conmid(rset.getString("lesson_conmid"));
				search.setLesson_conbot(rset.getString("lesson_conbot"));
				search.setLesson_keyword(rset.getString("lesson_keyword"));
				search.setLesson_type(rset.getInt("lesson_type"));
				
				list.add(search);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		System.out.println("SearchList : " + list + " / (To.LessonDao)");
		return list;		
	}
	
	

	public ArrayList<Sidebar> seachlistByKeyword(Connection con, String string) {
		ArrayList<Sidebar> list = new ArrayList<Sidebar>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql="select user_name, lesson_no , LESSON_RENAME_PHOTO, category_small from categorys , lesson , users where categorys.CATEGORY_NO=lesson.CATEGORY_NO and LESSON.user_no2=users.user_no and LESSON.LESSON_KEYWORD like  ?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+string+"%");
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Sidebar side=new Sidebar();
				side.setLesson_no(rset.getInt("lesson_no"));
				side.setUser_name(rset.getString("user_name"));
				side.setCategory_small(rset.getString("category_small"));
				side.setLESSON_RENAME_PHOTO(rset.getString("LESSON_RENAME_PHOTO"));
				

				list.add(side);			
			}		
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}

	public ArrayList<Sidebar> seachlistByKeyword2(Connection con, String string, ArrayList<Sidebar> lessonList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql="select user_name, lesson_no ,LESSON_RENAME_PHOTO, category_small from categorys , lesson , users where categorys.CATEGORY_NO=lesson.CATEGORY_NO and LESSON.user_no2=users.user_no and LESSON.LESSON_KEYWORD like  ?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+string+"%");
			rset=pstmt.executeQuery();
			while(rset.next()) {
				
				//동일한 강의가 들어가는것을 방지함.
				for(Sidebar i: lessonList) {
				 if(i.getLesson_no()==rset.getInt("lesson_no"))
				rset.next();	 
				}
				Sidebar side=new Sidebar();
				side.setLesson_no(rset.getInt("lesson_no"));
				side.setUser_name(rset.getString("user_name"));
				side.setCategory_small(rset.getString("category_small"));
				side.setLESSON_RENAME_PHOTO(rset.getString("LESSON_RENAME_PHOTO"));
				

				lessonList.add(side);			
			}		
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return lessonList;
	}

	public ArrayList<Sidebar> seachlistByKeyword2(Connection con, ArrayList<Sidebar> Sidebar) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql="select user_name, lesson_no , category_small , LESSON_RENAME_PHOTO from categorys , lesson , users where categorys.CATEGORY_NO=lesson.CATEGORY_NO and LESSON.user_no2=users.user_no order by DBMS_RANDOM.RANDOM  ";
		try {
			pstmt=con.prepareStatement(sql);
			rset=pstmt.executeQuery();
			while(rset.next() && Sidebar.size()<9 ) {
				//동일한 강의가 들어가는것을 방지함.
				for(Sidebar i: Sidebar) {
				 if(i.getLesson_no()==rset.getInt("lesson_no"))
				rset.next();	 
				}
				Sidebar side=new Sidebar();
				side.setLesson_no(rset.getInt("lesson_no"));
				side.setUser_name(rset.getString("user_name"));
				side.setCategory_small(rset.getString("category_small"));
				side.setLESSON_RENAME_PHOTO(rset.getString("LESSON_RENAME_PHOTO"));
				
				Sidebar.add(side);	
			}		
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return Sidebar;
	}

	public Lesson findLessonBylessonNo(Connection con, int parseInt) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Lesson search=new Lesson();
		
		String sql="select * from lesson,categorys,lessonlev where lesson.level_no=lessonlev.lessonlev_no and LESSON.CATEGORY_NO=CATEGORYS.category_no and lesson_no=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			rset=pstmt.executeQuery();
		
			
			if(rset.next()) {
				
				search.setLesson_no(rset.getInt("LESSON_NO"));
				search.setLevel_no(rset.getInt("LEVEL_NO"));
				search.setLevel(rset.getString("LESSONLEV"));
				search.setState_no(rset.getInt("STATE_NO"));
				search.setCategory_no(rset.getInt("CATEGORY_NO"));
				search.setCategory_bigName(rset.getString("CATEGORY_BIG"));
				search.setCategory_smallName(rset.getString("CATEGORY_SMALL"));
				search.setUser_no2(rset.getInt("USER_NO2"));
			    search.setLesson_title(rset.getString("LESSON_TITLE"));
				search.setLesson_loc(rset.getString("LESSON_LOCATION"));
				search.setLesson_rad(rset.getInt("LESSON_RADIUS"));
				search.setLesson_price(rset.getInt("LESSON_PRICE"));
				search.setLesson_count(rset.getInt("LESSON_COUNT"));
				search.setLesson_startdate(rset.getDate("LESSON_STARTDATE"));
				search.setLesson_contop(rset.getString("LESSON_CONTOP"));
				search.setLesson_conmid(rset.getString("LESSON_CONMID"));
				search.setLesson_conbot(rset.getString("LESSON_CONBOT"));
				search.setLesson_keyword(rset.getString("LESSON_KEYWORD"));
				search.setLesson_type(rset.getInt("LESSON_TYPE"));
				search.setLesson_orginal(rset.getString("LESSON_ORIGINAL_PHOTO"));
				search.setLesson_orginal2(rset.getString("LESSON_ORIGINAL_PHOTO2"));
				search.setLesson_orginal3(rset.getString("LESSON_ORIGINAL_PHOTO3"));
				search.setLesson_rename(rset.getString("LESSON_RENAME_PHOTO"));
				search.setLesson_rename2(rset.getString("LESSON_RENAME_PHOTO2"));
				search.setLesson_rename3(rset.getString("LESSON_RENAME_PHOTO3"));
				
			
				
				System.out.println(search.toString());
	
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return search;
	}

	public int updatelesson(Connection conn, Lesson lesson) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql ="update LESSON set LEVEL_NO = ?, CATEGORY_NO = ?, LESSON_TITLE = ? , LESSON_LOCATION= ?, "
				+ "LESSON_RADIUS = ?, LESSON_PRICE = ? , LESSON_COUNT = ? , LESSON_CONTOP = ? , LESSON_CONMID= ?,  "
				+ "LESSON_CONBOT = ? , LESSON_KEYWORD = ? , LESSON_ORIGINAL_PHOTO = ? , LESSON_RENAME_PHOTO = ? , LESSON_ORIGINAL_PHOTO2 = ? , LESSON_RENAME_PHOTO2 = ? , LESSON_ORIGINAL_PHOTO3 = ? , LESSON_RENAME_PHOTO3 = ? where LESSON_NO = ?";
	
		try {
		System.out.println("lesson.getUser_no2()"+lesson.getUser_no2());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson.getLevel_no());
			pstmt.setInt(2, lesson.getCategory_no());
	
			pstmt.setString(3, lesson.getLesson_title());
			pstmt.setString(4, lesson.getLesson_loc());
			pstmt.setInt(5, lesson.getLesson_rad());
			pstmt.setInt(6, lesson.getLesson_price());
			pstmt.setInt(7, lesson.getLesson_count());
			pstmt.setString(8, lesson.getLesson_contop());
			pstmt.setString(9, lesson.getLesson_conmid());
			pstmt.setString(10, lesson.getLesson_conbot());
			pstmt.setString(11, lesson.getLesson_keyword());
			pstmt.setString(12, lesson.getLesson_orginal());
			pstmt.setString(13, lesson.getLesson_rename());
			pstmt.setString(14, lesson.getLesson_orginal2());
			pstmt.setString(15, lesson.getLesson_rename2());
			pstmt.setString(16, lesson.getLesson_orginal3());
			pstmt.setString(17, lesson.getLesson_rename3());
			pstmt.setInt(18, lesson.getLesson_no());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		

	}

}
	

