package mail;
	
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class TestMailer {
	private static final int port= 465;  //어짜피 포트번호는 99.9999%가 465를 사용한다.
	private String host = "smtp.naver.com";
	private String user = "jju08297";
	private String tail = "@naver.com";
	private String password = "******";
    //하단 setter, getter를 활용한 정보 주입
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getTail() {
		return tail;
	}
	public void setTail(String tail) {
		this.tail = tail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	private Properties props = System.getProperties();
	private boolean setEnv(){
		props.put("mail.smtp.host", host);  
		props.put("mail.smtp.port", port);  
		props.put("mail.smtp.auth", "true");  
		props.put("mail.smtp.ssl.enable", "true");  
		props.put("mail.smtp.ssl.trust", host);  
		return true;
	}
	
    //파일 없이 전송
	public boolean sendMail(String receiver,String title, String text) throws Exception{
		setEnv();
		Message msg = sendingHead();
		sendingBody(msg, receiver, title, text);
		
		msg.setText(text);
        Transport.send(msg);	
		return true;
	}

	//파일과 함께 전송
	public boolean sendMail(String receiver,String title, String text, String filePath, String fileName) throws Exception{
		
		setEnv();
		Message msg = sendingHead();
		sendingBody(msg, receiver, title, text);
		
		if(filePath != null && filePath.length() > 0){  
	        Multipart multipart = new MimeMultipart();
	        MimeBodyPart textBodyPart = new MimeBodyPart();
	        textBodyPart.setText(text,"UTF-8");
	        MimeBodyPart attachmentBodyPart= new MimeBodyPart();
	        DataSource source = new FileDataSource(filePath); 
	        attachmentBodyPart.setDataHandler(new DataHandler(source));
	        attachmentBodyPart.setFileName(MimeUtility.encodeText(fileName, "UTF-8", null));
	        multipart.addBodyPart(textBodyPart);  // add the text part
	        multipart.addBodyPart(attachmentBodyPart); // add the attachement part
	        msg.setContent(multipart);			
		}	
		Transport.send(msg);	
        return true;
	}
	
	private Message sendingHead(){
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = user;
			String pw = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //for debug  
		Message msg = new MimeMessage(session); //MimeMessage 생성 
		return msg;
	}

	private void sendingBody(Message msg, String receiver, String title, String text) throws Exception{
		msg.setFrom(new InternetAddress(user + tail)); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.  
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); //수신자셋팅  
		msg.setSubject(title); //제목셋팅  
	}
}
