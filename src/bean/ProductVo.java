package bean;

import java.util.List;

public class ProductVo {
	
	//------------------
	//insert에서 받아올 값	
	String	pCode;
	String	pName;
	String	pDate;
	String	pSize;
	String	Tcolor;
	String	pContent;
	String 	pColor;
	
	int		pPoint;
	int		pStock;
	int		pPrice;
	int 	pPromotion;
	int		sPrice;
	int 	Psaleck;
	int 	Tcode;
	int 	Tgender;
	int 	Tbig;
	int 	Tsmall;
	int		pLike=0; //customer_view
	int		pCategory; //category
	int		pSale;
	
	//사진정보 Tbig
		String attFileB;
		String attOriB;
	
	List<FileVo> pList;
	List<String> delFile;
	List<String> rgb;
	List<ProductSAttVo> list;
	List<String> likeList;
	List<String> size;
	List<ProductSAttVo> Mlist;
	String attfile;
	
	
	
	
	public List<ProductSAttVo> getMlist() {
		return Mlist;
	}
	public void setMlist(List<ProductSAttVo> mlist) {
		Mlist = mlist;
	}
	public List<String> getSize() {
		return size;
	}
	public void setSize(List<String> size) {
		this.size = size;
	}
	public List<String> getLikeList() {
		return likeList;
	}
	public void setLikeList(List<String> likeList) {
		this.likeList = likeList;
	}
	public List<String> getRgb() {
		return rgb;
	}
	public void setRgb(List<String> rgb) {
		this.rgb = rgb;
	}
	public String getpColor() {
		return pColor;
	}
	public void setpColor(String pColor) {
		this.pColor = pColor;
	}
	public String getAttFileB() {
		return attFileB;
	}
	public void setAttFileB(String attFileB) {
		this.attFileB = attFileB;
	}
	public String getAttOriB() {
		return attOriB;
	}
	public void setAttOriB(String attOriB) {
		this.attOriB = attOriB;
	}
	public List<ProductSAttVo> getList() {
		return list;
	}
	public void setList(List<ProductSAttVo> list) {
		this.list = list;
	}
	public String getAttfile() {
		return attfile;
	}
	public void setAttfile(String attfile) {
		this.attfile = attfile;
	}
	public int getpSale() {
		return pSale;
	}
	public void setpSale(int pSale) {
		this.pSale = pSale;
	}
	public int getTcode() {
		return Tcode;
	}
	public void setTcode(int tcode) {
		Tcode = tcode;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpStock() {
		return pStock;
	}
	public void setpStock(int pStock) {
		this.pStock = pStock;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public int getpPoint() {
		return pPoint;
	}
	public void setpPoint(int pPoint) {
		this.pPoint = pPoint;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}

	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public int getpPromotion() {
		return pPromotion;
	}
	public void setpPromotion(int pPromotion) {
		this.pPromotion = pPromotion;
	}
	public int getsPrice() {
		return sPrice;
	}
	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}
	
	public int getTgender() {
		return Tgender;
	}
	public void setTgender(int tgender) {
		Tgender = tgender;
	}
	public int getTbig() {
		return Tbig;
	}
	public void setTbig(int tbig) {
		Tbig = tbig;
	}
	public int getTsmall() {
		return Tsmall;
	}
	public void setTsmall(int tsmall) {
		Tsmall = tsmall;
	}
	public int getpLike() {
		return pLike;
	}
	public void setpLike(int pLike) {
		this.pLike = pLike;
	}
	public int getpCategory() {
		return pCategory;
	}
	public void setpCategory(int pCategory) {
		this.pCategory = pCategory;
	}
	public List<FileVo> getpList() {
		return pList;
	}
	public void setpList(List<FileVo> pList) {
		this.pList = pList;
	}
	public List<String> getDelFile() {
		return delFile;
	}
	public void setDelFile(List<String> delFile) {
		this.delFile = delFile;
	}
	public String getTcolor() {
		return Tcolor;
	}
	public void setTcolor(String tcolor) {
		Tcolor = tcolor;
	}
	public int getPsaleck() {
		return Psaleck;
	}
	public void setPsaleck(int psaleck) {
		Psaleck = psaleck;
	}
	

	
	
}
