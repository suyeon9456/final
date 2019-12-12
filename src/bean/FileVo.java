package bean;

public class FileVo {
   String fCode;
   String fPhoto;
   
   int hSerial;
   int hPserial;
   String hPhoto;
   
   String attFileB;
   
   int      eSerial;
   String   ePhoto;
   
   public String getAttFileB() {
	return attFileB;
}
public void setAttFileB(String attFileB) {
	this.attFileB = attFileB;
}
public int geteSerial() {
      return eSerial;
   }
   public void seteSerial(int eSerial) {
      this.eSerial = eSerial;
   }
   public String getePhoto() {
      return ePhoto;
   }
   public void setePhoto(String ePhoto) {
      this.ePhoto = ePhoto;
   }
   public String getfCode() {
      return fCode;
   }
   public void setfCode(String fCode) {
      this.fCode = fCode;
   }
   public String getfPhoto() {
      return fPhoto;
   }
   public void setfPhoto(String fPhoto) {
      this.fPhoto = fPhoto;
   }
   public int gethSerial() {
      return hSerial;
   }
   public void sethSerial(int hSerial) {
      this.hSerial = hSerial;
   }
   public int gethPserial() {
      return hPserial;
   }
   public void sethPserial(int hPserial) {
      this.hPserial = hPserial;
   }
   public String gethPhoto() {
      return hPhoto;
   }
   public void sethPhoto(String hPhoto) {
      this.hPhoto = hPhoto;
   }
}