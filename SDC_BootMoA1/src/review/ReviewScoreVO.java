package review;

public class ReviewScoreVO {
	private int score; // 총점
	private int t_score; // 강사진 만족도
	private int s_score; // 교육지원 만족도
	private int e_score; // 학습환경 만족도
	
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

}
