package member;

import java.util.List;

import member.FileVo;

public class QuestionVo {
	int qSerial = 0;
	String qId;
	String qSubject;
	String qContent;
	String qDate;
	int qPserial = 0;
	String qOrder;
	String seq;
	
	List<FileVo> qList;
	List<String> delFile;

	
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public List<FileVo> getqList() {
		return qList;
	}

	public void setqList(List<FileVo> qList) {
		this.qList = qList;
	}

	public List<String> getDelFile() {
		return delFile;
	}

	public void setDelFile(List<String> delFile) {
		this.delFile = delFile;
	}

	public int getqSerial() {
		return qSerial;
	}

	public void setqSerial(int qSerial) {
		this.qSerial = qSerial;
	}

	public String getqId() {
		return qId;
	}

	public void setqId(String qId) {
		this.qId = qId;
	}

	public String getqSubject() {
		return qSubject;
	}

	public void setqSubject(String qSubject) {
		this.qSubject = qSubject;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqDate() {
		return qDate;
	}

	public void setqDate(String qDate) {
		this.qDate = qDate;
	}

	public int getqPserial() {
		return qPserial;
	}

	public void setqPserial(int qPserial) {
		this.qPserial = qPserial;
	}

	public String getqOrder() {
		return qOrder;
	}

	public void setqOrder(String qOrder) {
		this.qOrder = qOrder;
	}
}
