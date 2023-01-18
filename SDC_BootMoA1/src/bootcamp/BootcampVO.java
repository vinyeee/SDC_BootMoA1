package bootcamp;

import java.sql.Blob;

public class BootcampVO {

	private int id;			// 부트캠프 번호
	private String b_name;	// 부트캠프 이름
	private String a_name;	// 학원이 름
	private String rogo;	// 학원로고
	private String realimg;	// 실제 학원이미지
	private String site; // 사이트 링크
	private int m_id; // 회원 id
	private String address;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getRogo() {
		return rogo;
	}
	public void setRogo(String rogo) {
		this.rogo = rogo;
	}
	public String getRealimg() {
		return realimg;
	}
	public void setRealimg(String realimg) {
		this.realimg = realimg;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "BootcampVO [id=" + id + ", b_name=" + b_name + ", a_name=" + a_name + 
				", rogo=" + rogo + 
				", realimg=" + realimg +
				", site=" + site +
				", m_id=" + m_id +"]";
	}
}
