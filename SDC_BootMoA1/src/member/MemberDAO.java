package member;

import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import member.MemberVO;
import db.ConnectDB;

public class MemberDAO {
	//회원가입 정보 저장
	public boolean insertM(MemberVO vo) {
		Connection conn = ConnectDB.connect();
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO members VALUES(membersseq.NEXTVAL,?,?,?,?,?,?,?,?,NULL)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getid());
			pstmt.setString(2,vo.getpwd());
			pstmt.setString(3,vo.getname());
			pstmt.setString(4,vo.getemail());
			pstmt.setString(5,vo.getpnum());
			pstmt.setString(6,vo.getnname());
			pstmt.setString(7,vo.getquestion());
			pstmt.setString(8,vo.getanswer());
			pstmt.executeUpdate();
			return true;
		} catch(SQLException e) {
			System.err.println("회원정보 insert과정에서 오류 발생"+e);
			e.printStackTrace();
			
		}finally {
			close(pstmt,null,conn);
		}
		return false;
	}
	
	//close 함수
	private void close(Statement s, ResultSet r, Connection conn) {
		try {
			if (r != null)
				r.close();
			if (s != null)
				s.close();
			ConnectDB.close(conn);
		} catch (SQLException e) {
			System.err.println("객체 close 과정에서 문제 발생" + e);
		}
	}
	
	//id중복 확인
	 public boolean duplicateIdCheck(String id)
	    {
		 	Connection conn = ConnectDB.connect();
	        PreparedStatement pstm = null;
	        ResultSet rs = null;

	        try {
	            // 쿼리
	            StringBuffer query = new StringBuffer();
	            query.append("SELECT ID FROM members WHERE ID=?");
	                        
	            pstm = conn.prepareStatement(query.toString());
	            pstm.setString(1, id);
	            rs = pstm.executeQuery();
	            
	            if(rs.next()) {
	            	return true; //해당 아이디 존재
	            }
	                
	            
	        } catch (Exception e) {
	        	System.err.println("아이디 중복 확인 과정에서 오류 발생"+e);
	        } finally {
	        	close(pstm,null,conn);
	        }
	        return false;
	    }
	 
	 public boolean duplicateNicknameCheck(String nickname)
	    {
		 	Connection conn = ConnectDB.connect();
	        PreparedStatement pstm = null;
	        ResultSet rs = null;
	        
	        try {
	            // 쿼리
	            StringBuffer query = new StringBuffer();
	            query.append("SELECT nname FROM members WHERE nname=?");
	                        
	            pstm = conn.prepareStatement(query.toString());
	            pstm.setString(1, nickname);
	            rs = pstm.executeQuery();
	            
	            if(rs.next()) {
	            	return true; //해당 닉네임 존재
	            }
	                
	            
	        } catch (Exception e) {
	        	System.err.println("닉네임 중복 확인 과정에서 오류 발생"+e);
	        } finally {
	        	close(pstm,null,conn);
	        }
	        return false;
	    }
	
	 public List<MemberVO> getMemberlist(String id){
		 List<MemberVO> list = new ArrayList<>();
		 Connection conn = ConnectDB.connect();
		 PreparedStatement pstm = null;
		 ResultSet rs = null;
		 
		 try {
			 	pstm = conn.prepareStatement("SELECT * FROM members WHERE ID=?");
			 	pstm.setString(1, id);
				 rs = pstm.executeQuery(); 
				 MemberVO vo = null;
				 while(rs.next()) {
					 vo = new MemberVO();
					 vo.setmnum(rs.getInt("mnum"));
					 vo.setid(rs.getString("id"));
					 vo.setpwd(rs.getString("pwd"));
					 vo.setname(rs.getString("name"));
					 vo.setemail(rs.getString("email"));
					 vo.setpnum(rs.getString("pnum"));
					 vo.setnname(rs.getString("nname"));
					 vo.setquestion(rs.getString("question"));
					 vo.setanswer(rs.getString("answer"));
					 list.add(vo);
				 }
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			 close(pstm,null,conn);
		 }
		 return list;
	 }
	 
	 public MemberVO getMember(String id){
		 Connection conn = ConnectDB.connect();
		 PreparedStatement pstm = null;
		 ResultSet rs = null;
		 MemberVO vo = null;
		 try {
			 	pstm = conn.prepareStatement("SELECT * FROM members WHERE ID=?");
			 	pstm.setString(1, id);
				rs = pstm.executeQuery(); 
				 
				 while(rs.next()) {
					 vo = new MemberVO();
					 vo.setmnum(rs.getInt("mnum"));
					 vo.setid(rs.getString("id"));
					 vo.setpwd(rs.getString("pwd"));
					 vo.setname(rs.getString("name"));
					 vo.setemail(rs.getString("email"));
					 vo.setpnum(rs.getString("pnum"));
					 vo.setnname(rs.getString("nname"));
				 }
				 
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			 close(pstm,null,conn);
		 }
		 return vo;
	 }
	 
	 public MemberVO getMember(int mnum){
		 Connection conn = ConnectDB.connect();
		 PreparedStatement pstm = null;
		 ResultSet rs = null;
		 MemberVO vo = null;
		 try {
			 	pstm = conn.prepareStatement("SELECT * FROM members WHERE mnum=?");
			 	pstm.setInt(1, mnum);
				rs = pstm.executeQuery(); 
				 
				 while(rs.next()) {
					 vo = new MemberVO();
					 vo.setmnum(rs.getInt("mnum"));
					 vo.setid(rs.getString("id"));
					 vo.setpwd(rs.getString("pwd"));
					 vo.setname(rs.getString("name"));
					 vo.setemail(rs.getString("email"));
					 vo.setpnum(rs.getString("pnum"));
					 vo.setnname(rs.getString("nname"));
				 }
				 
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			 close(pstm,null,conn);
		 }
		 return vo;
	 }
	 
	 public int infoUpdate(String mid, String mpwd, String mname, String memail, String mpnum, String mnname, String mquestion, String manswer, String mnum) {
		 Connection conn = ConnectDB.connect();
		 int value = 0;
			PreparedStatement pstmt = null;
			try {
				String sql = "UPDATE members SET id=?, pwd=?, name=?, email=?, pnum=?, nname=?, question=?, answer=? WHERE mnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mid);
				pstmt.setString(2,mpwd);
				pstmt.setString(3,mname);
				pstmt.setString(4,memail);
				pstmt.setString(5,mpnum);
				pstmt.setString(6,mnname);
				pstmt.setString(7,mquestion);
				pstmt.setString(8,manswer);
				pstmt.setString(9,mnum);
				pstmt.executeUpdate();
			} catch(SQLException e) {
				System.err.println("회원정보 수정 과정에서 오류 발생"+e);
				value = 1;
			}finally {
				close(pstmt,null,conn);
			}
			return value;
		}
	 }

