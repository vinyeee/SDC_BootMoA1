package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import db.ConnectDB;
import member.MemberVO;

public class ReviewDAO {
		//전체 리뷰 불러오기
		public List<ReviewVO> listAll(){
			Connection conn = ConnectDB.connect();
			Statement stmt = null;
			ResultSet rs = null;
			List<ReviewVO> list = new ArrayList<>();
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(
						"select rnum,goodcom,badcom,bscope,instsat,edusat,learnsat,bnum,mnum from reviews");
				ReviewVO vo = null;
				while (rs.next()) {
					vo = new ReviewVO();
					vo.setGood(rs.getString("goodcom"));
					vo.setBad(rs.getString("badcom"));
					vo.setScore(rs.getInt("bscope"));
					vo.setT_score(rs.getInt("instsat"));
					vo.setS_score(rs.getInt("edusat"));
					vo.setE_score(rs.getInt("learnsat"));
					vo.setB_id(rs.getInt("bnum"));
					vo.setM_id(rs.getInt("mnum"));
				
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDB.close(conn);
			}
			return list;
		}
		
		//특정 회원이 쓴 리뷰 불러오기
		public ReviewVO listOne(int id){
			Connection conn = ConnectDB.connect();
			Statement stmt = null;
			ResultSet rs = null;
			ReviewVO vo = null;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(
						"select rnum,goodcom,badcom,bscope,instsat,edusat,learnsat,bnum,mnum from reviews where rnum = "+id);
				while (rs.next()) {
					vo = new ReviewVO();
					vo.setId(rs.getInt("rnum"));
					vo.setGood(rs.getString("goodcom"));
					vo.setBad(rs.getString("badcom"));
					vo.setScore(rs.getInt("bscope"));
					vo.setT_score(rs.getInt("instsat"));
					vo.setS_score(rs.getInt("edusat"));
					vo.setE_score(rs.getInt("learnsat"));
					vo.setB_id(rs.getInt("bnum"));
					vo.setM_id(rs.getInt("mnum"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDB.close(conn);
			}
			return vo;
		}
		
		//특정 회원이 쓴 리뷰 불러오기 (리뷰 수정용)
		public List<ReviewVO> listOnelist(int mnum){
			Connection conn = ConnectDB.connect();
			Statement stmt = null;
			ResultSet rs = null;
			ReviewVO vo = null;
			List<ReviewVO> list = new ArrayList<>();
			System.out.println("1차");
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(
						"select rnum,goodcom,badcom,bscope,instsat,edusat,learnsat,bnum,mnum from reviews where mnum = "+mnum);
				System.out.println("2차");
				while (rs.next()) {
					vo = new ReviewVO();
					vo.setId(rs.getInt("rnum"));
					vo.setGood(rs.getString("goodcom"));
					vo.setBad(rs.getString("badcom"));
					vo.setScore(rs.getInt("bscope"));
					vo.setT_score(rs.getInt("instsat"));
					vo.setS_score(rs.getInt("edusat"));
					vo.setE_score(rs.getInt("learnsat"));
					vo.setB_id(rs.getInt("bnum"));
					vo.setM_id(rs.getInt("mnum"));
					list.add(vo);
					System.out.println("list생성완료");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDB.close(conn);
			}
			return list;
		}
		
		//특정 부트캠프의 리뷰 불러오기
		public List<ReviewVO> TheBootcampList(int bnum){
			Connection conn = ConnectDB.connect();
			Statement stmt = null;
			ResultSet rs = null;
			ReviewVO vo = null;
			List<ReviewVO> list = new ArrayList<>();
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select rnum,goodcom,badcom,bscope,instsat,edusat,learnsat,bnum,mnum,rdate from reviews"
						+ " where bnum = "+bnum);
				while (rs.next()) {
					vo = new ReviewVO();
					vo.setId(rs.getInt("rnum"));
					vo.setGood(rs.getString("goodcom"));
					vo.setBad(rs.getString("badcom"));
					vo.setScore(rs.getInt("bscope"));
					vo.setT_score(rs.getInt("instsat"));
					vo.setS_score(rs.getInt("edusat"));
					vo.setE_score(rs.getInt("learnsat"));
					vo.setB_id(rs.getInt("bnum"));
					vo.setM_id(rs.getInt("mnum"));
					vo.setWriteDate(rs.getString("rdate"));
								
					list.add(vo);
				}
			} catch (SQLException e) {
					e.printStackTrace();
			} finally {
						ConnectDB.close(conn);
					}
			return  list;
			}
		
		//리뷰 등록하기
		public boolean insert(ReviewVO vo) {
			Connection conn = ConnectDB.connect();
			boolean result = true;
			try {
				PreparedStatement pstmt = conn.prepareStatement("insert into reviews values(reviewsseq.nextval,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, vo.getGood());
				pstmt.setString(2, vo.getBad());
				pstmt.setInt(3, vo.getScore());
				pstmt.setInt(4,vo.getT_score());
				pstmt.setInt(5, vo.getS_score());
				pstmt.setInt(6, vo.getE_score());
				pstmt.setInt(7, vo.getB_id());
				pstmt.setInt(8, vo.getM_id());
				pstmt.setString(9, vo.getWriteDate());
				pstmt.executeUpdate();
				
			}catch(SQLException e) {
				result = false;
				e.printStackTrace();
			}finally {
				ConnectDB.close(conn);
			}
			return result;
		}
		
		//리뷰 수정
		public boolean updateReview(ReviewVO vo) {
			Connection conn = ConnectDB.connect();
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(
						"update reviews "  
						+  "set goodcom = ?, "
						+ 	   "badcom = ?, "
						+      "bscope = ?, "
						+      "instsat = ?,"  
						+      "edusat = ?, "
						+      "learnsat = ?, "
						+      "rdate = to_char(sysdate, 'YYYY.MM.DD'),"
						+      "bnum = ?, "
						+      "mnum = ?" 
					   +" where rnum = ? "
						+  "and bnum = ? "
						+  "and mnum = ?");
				
				pstmt.setString(1, vo.getGood());
				pstmt.setString(2, vo.getBad());
				pstmt.setInt(3, vo.getScore());
				pstmt.setInt(4,vo.getT_score()); //강사진
				pstmt.setInt(5, vo.getS_score()); //교육지원
				pstmt.setInt(6, vo.getE_score()); //학습환경
				pstmt.setInt(7, vo.getB_id());
				pstmt.setInt(8, vo.getM_id());
				pstmt.setInt(9, vo.getId());
				pstmt.setInt(10, vo.getB_id());
				pstmt.setInt(11, vo.getM_id());
				pstmt.executeUpdate();
				return true;
			} catch (SQLException e) {
				System.err.println("update 과정에서 오류 발생 " + e);
				return false;
			} finally {
				ConnectDB.close(conn);
			}
		}
		
		//삭제
		public boolean delete(int id) {
			Connection conn = ConnectDB.connect();
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement("delete from reviews where rnum = " + id);
				if (pstmt.executeUpdate() != 0)
					return true;
				else
					return false;
			} catch (SQLException e) {
				System.err.println("delete 과정에서 오류 발생 " + e);
				return false;
			} finally {
				ConnectDB.close(conn);
			}
		}
		
		// 각 부트캠프에 대한 (bnum) sum값이 
		public List<ReviewScoreVO>sumScoreList(){
			Connection conn = ConnectDB.connect();
			Statement stmt = null;
			ResultSet rs = null;
			ReviewScoreVO vo = null;
			List<ReviewScoreVO> list = new ArrayList<>();
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select sum(bscope)/count(bnum),sum(instsat)/count(bnum),sum(edusat)/count(bnum),sum(learnsat)/count(bnum) from reviews group by bnum");
				while (rs.next()) {
					vo = new ReviewScoreVO();
					vo.setScore(rs.getInt("sum(bscope)/count(bnum)"));
					vo.setT_score(rs.getInt("sum(instsat)/count(bnum)"));
					vo.setS_score(rs.getInt("sum(edusat)/count(bnum)"));
					vo.setE_score(rs.getInt("sum(learnsat)/count(bnum)"));
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDB.close(conn);
			}
			return list;
		}
		
}
