package com.spring.AtoZ.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	public static void sendMail(String title, String emailAddress, String mailContent) {
		String host = "smtp.naver.com";
		String seneder = "leeys9423@naver.com";
		String password = "sub153426!";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(seneder, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(seneder));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAddress));
			
			message.setSubject(title);
			message.setText(mailContent);
			
			Transport.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
}
