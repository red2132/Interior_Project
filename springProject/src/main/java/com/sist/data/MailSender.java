package com.sist.data;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sist.vo.*;

public class MailSender {
	
	public static void gmailMailSend(CartVO vo, String id, String email)
	{ 		
		String host = "smtp.gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
	    String user = "java.or.die@gmail.com"; // 패스워드 
	    String password = "hazelnut0127";      // SMTP 서버 정보를 설정한다. 
	    
	    Properties props = new Properties(); 
	    props.put("mail.smtp.host", host); 
	    props.put("mail.smtp.port", 587); 
	    props.put("mail.smtp.auth", "true"); 
	    props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
	    
	    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator()
	    { 
	    	protected PasswordAuthentication getPasswordAuthentication() 
	    	{ 
	    		return new PasswordAuthentication(user, password); 
	    	} 
	    });
	    
	    try
	    { 
	    	MimeMessage message = new MimeMessage(session); 
	        message.setFrom(new InternetAddress(user)); 
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	        message.setSubject(id + "님, 인테리어 소품 구매 내역입니다. (SIST1 Shop)");
	              
	        String html = "===========================================================" + "\n"
	        		    + "구매하신 상품명 : " + vo.getProduct_name() + "\n"
	          		    + "구매하신 수량 : " + vo.getAmount() + " EA" + "\n"
	            		+ "가격 : " + vo.getProduct_price() + " 원" + "\n"
	            		+ "결제 금액 : " + (Integer.parseInt(vo.getProduct_price()) * vo.getAmount()+3000) + " 원" + "\n"
	            		+ "===========================================================" + "\n"
	            		+ " * 정상 처리되었습니다. 항상 이용해주셔서 감사드립니다." + "\n"
	            		+ "	                         From. SIST1 Shop";
	            		     
	        message.setText(html);
	        Transport.send(message); 
	        System.out.println("메일 정상 발송 완료"); 
	    }
	    catch (MessagingException e) 
	    {
	    	e.printStackTrace();
	    }
	    
	}
	
}

	

