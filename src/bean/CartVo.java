package bean;

import java.util.HashMap;

public class CartVo {

	String cid;
	String ccode;
	String cname;
	int cprice;
	int cea = 0;
	int cpromotion;
	String cpoint;
	String cphoto;
	HashMap<String,Object> map;
	
	

	public HashMap<String, Object> getMap() {
		return map;
	}
	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public int getCea() {
		return cea;
	}
	public void setCea(int cea) {
		this.cea = cea;
	}
	public int getCpromotion() {
		return cpromotion;
	}
	public void setCpromotion(int cpromotion) {
		this.cpromotion = cpromotion;
	}
	
	public String getCpoint() {
		return cpoint;
	}
	public void setCpoint(String cpoint) {
		this.cpoint = cpoint;
	}
	public String getCphoto() {
		return cphoto;
	}
	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}

}
