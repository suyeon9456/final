package member;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailCheck {
	private static final int port = 465;
	private String host = "smtp.naver.com";
	private String user = "suyeon9456";
	private String tail = "@naver.com";
	private String password = "******";
	
	//getter setter
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
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
	public static int getPort() {
		return port;
	}
	
	public String getUser() {
		return user;
		
	}
	public void setUser(String user) {
		this.user = user;
	}

	private Properties props = System.getProperties();
	
	private boolean setEnv() {
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
		
		msg.setContent(text, "text/html; charset=UTF-8");
        Transport.send(msg);	
		return true;
	}
	
	private Message sendingHead() {
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			String un = user;
			String pw = password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		
		session.setDebug(true);//for debug
		Message msg = new MimeMessage(session);//MimeMessage 생성
		return msg;
	}
	
	private void sendingBody(Message msg, String receiver, String title, String text) throws Exception{
		msg.setFrom(new InternetAddress(user + tail));////발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
		
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); //수신자 세팅
		msg.setSubject(title);
	}
	
	
}
