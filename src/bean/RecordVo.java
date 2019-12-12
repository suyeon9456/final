package bean;

import java.util.HashMap;
import java.util.List;

import com.google.gson.JsonArray;

public class RecordVo {
	int		rSerial=1000;  //내부시리얼
	String	rId;  // 유저아이다
	String	rCode; // 상품 코드들
	String	rDate;  // 상품 결제일
	String	rName;  // 상품 이름
	int		rEa;   // 상품개수
	int		rDelive;  // 배송현황
	String	rRefund;  // 반품여부
	int		rPrice;   // 상품가격
	int		rAfter;  // 최종 상품가격
	
	String fPhoto; // 구매,판매내역 사진
	
	int      rAfter1;
	int      rAfter2;
	
	int rDelter;
	
	int rDelter1; // 결제완료 변수
	int rDelter2;
	
	HashMap<String,Object> map;
	
	public String getfPhoto() {
		return fPhoto;
	}
	public void setfPhoto(String fPhoto) {
		this.fPhoto = fPhoto;
	}
	public int getrDelter() {
		return rDelter;
	}
	public void setrDelter(int rDelter) {
		this.rDelter = rDelter;
	}
	public int getrDelter1() {
		return rDelter1;
	}
	public void setrDelter1(int rDelter1) {
		this.rDelter1 = rDelter1;
	}
	public int getrDelter2() {
		return rDelter2;
	}
	public void setrDelter2(int rDelter2) {
		this.rDelter2 = rDelter2;
	}
	public HashMap<String, Object> getMap() {
		return map;
	}
	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	public int getrAfter1() {
		return rAfter1;
	}
	public void setrAfter1(int rAfter1) {
		this.rAfter1 = rAfter1;
	}
	public int getrAfter2() {
		return rAfter2;
	}
	public void setrAfter2(int rAfter2) {
		this.rAfter2 = rAfter2;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public int getrSerial() {
		return rSerial;
	}
	public void setrSerial(int rSerial) {
		this.rSerial = rSerial;
	}
	public String getrId() {
		return rId;
	}
	public void setrId(String rId) {
		this.rId = rId;
	}
	public String getrCode() {
		return rCode;
	}
	public void setrCode(String rCode) {
		this.rCode = rCode;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public int getrEa() {
		return rEa;
	}
	public void setrEa(int rEa) {
		this.rEa = rEa;
	}
	public int getrDelive() {
		return rDelive;
	}
	public void setrDelive(int rDelive) {
		this.rDelive = rDelive;
	}
	public String getrRefund() {
		return rRefund;
	}
	public void setrRefund(String rRefund) {
		this.rRefund = rRefund;
	}
	public int getrPrice() {
		return rPrice;
	}
	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}
	public int getrAfter() {
		return rAfter;
	}
	public void setrAfter(int rAfter) {
		this.rAfter = rAfter;
	}
}
