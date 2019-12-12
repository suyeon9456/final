package member;

public class Param {
	String findStr;
	String oneDate;
	String twoDate;
	int rSerial=1000;
	int category=1;
	String rId;

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	int nowPage = 1;
	int totPage = 0;
	int startNo = 0;
	int endNo = 0;

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getrId() {
		return rId;
	}

	public void setrId(String rId) {
		this.rId = rId;
	}

	public int getrSerial() {
		return rSerial;
	}

	public void setrSerial(int rSerial) {
		this.rSerial = rSerial;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}

	public String getOneDate() {
		return oneDate;
	}

	public void setOneDate(String oneDate) {
		this.oneDate = oneDate;
	}

	public String getTwoDate() {
		return twoDate;
	}

	public void setTwoDate(String twoDate) {
		this.twoDate = twoDate;
	}
}
