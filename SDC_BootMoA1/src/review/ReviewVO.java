package review;

public class ReviewVO {
	
	private int id; // 리뷰아이디
	private String good; //장점
	private String bad; //단점
	private int score; // 총점
	private int t_score; // 강사진 만족도
	private int s_score; // 교육지원 만족도
	private int e_score; // 학습환경 만족도
	private int b_id; // 부트캠프정보 fk
	private int m_id; // 회원정보 fk
	private String writeDate; // 작성 날짜
	
	
	
	
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getBad() {
		return bad;
	}
	public void setBad(String bad) {
		this.bad = bad;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getT_score() {
		return t_score;
	}
	public void setT_score(int t_score) {
		this.t_score = t_score;
	}
	public int getS_score() {
		return s_score;
	}
	public void setS_score(int s_score) {
		this.s_score = s_score;
	}
	public int getE_score() {
		return e_score;
	}
	public void setE_score(int e_score) {
		this.e_score = e_score;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
}
