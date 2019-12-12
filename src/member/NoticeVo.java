package member;

import java.util.List;

public class NoticeVo {
   int nSerial=0;
   String nSubject;
   String nContent;
   String nDate;
   int nHit=0;
   String nId;
   
   List<FileVo> nList;
   List<String> delFile;
   
   public List<FileVo> getnList() {
      return nList;
   }
   public void setnList(List<FileVo> nList) {
      this.nList = nList;
   }
   public List<String> getDelFile() {
      return delFile;
   }
   public void setDelFile(List<String> delFile) {
      this.delFile = delFile;
   }
   
   public int getnSerial() {
      return nSerial;
   }
   public void setnSerial(int nSerial) {
      this.nSerial = nSerial;
   }
   public String getnSubject() {
      return nSubject;
   }
   public void setnSubject(String nSubject) {
      this.nSubject = nSubject;
   }
   public String getnContent() {
      return nContent;
   }
   public void setnContent(String nContent) {
      this.nContent = nContent;
   }
   public String getnDate() {
      return nDate;
   }
   public void setnDate(String nDate) {
      this.nDate = nDate;
   }
   public int getnHit() {
      return nHit;
   }
   public void setnHit(int nHit) {
      this.nHit = nHit;
   }
   public String getnId() {
      return nId;
   }
   public void setnId(String nId) {
      this.nId = nId;
   }
}