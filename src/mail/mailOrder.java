package mail;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class mailOrder 
{
	private final static String fromMail = "theestore2020@gmail.com";
	/*private final static String adminmailid = "krishnarmakwana7312@gmail.com";*/
	private final static String pass = "Estore@12345";	
	
	static char[] UserOrderID(int len)
	{
		String num="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random1 = new Random();		
		char[] userorderid = new char[len];		
		for(int i = 0 ; i < len ; i++)
		{
			userorderid[i] = num.charAt(random1.nextInt(num.length()));
		}
		return userorderid;
	}
	
	public static String sendMail(String to , String subject , String body, String unm)
	{
		
		String userorderid = new String (UserOrderID(6));
		Properties props = new Properties();
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");		
		Authentication auth = new Authentication();		
		Session session = Session.getInstance(props, auth);
		try
		{
			Message message = new MimeMessage(session);			
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			body = body+" "+userorderid;
			body += "\n\nDear "+unm+",\nThank you for shopping on E-store.";
			message.setText(body);			
			Transport.send(message);
			return userorderid;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	static class Authentication extends Authenticator
	{
		@Override
		protected PasswordAuthentication getPasswordAuthentication()
		{
			return new PasswordAuthentication(fromMail,pass);
		}
	}
		
	public static void sendCancelOrderViaMail(String to , String subject , String body)
	{		
		Properties props = new Properties();
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");		
		Authentication auth = new Authentication();		
		Session session = Session.getInstance(props, auth);		
		try
		{
			Message message = new MimeMessage(session);			
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);			
			Transport.send(message);		
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public static String sendPasswordViaMail(String to , String subject , String body)
	{
		String newpwd = new String (genPassword(8));
		String body1 = "\nNote: for security reason, "
                + "you must change your password after logging in.";
		Properties props = new Properties();
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		Authentication auth = new Authentication();
		
		Session session = Session.getInstance(props, auth);
		
		try
		{
			Message message = new MimeMessage(session);			
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body+" "+newpwd+body1);
			
			Transport.send(message);
			return newpwd;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	static char[] genPassword(int len)
	{
		String num="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random1 = new Random();		
		char[] userorderid = new char[len];		
		for(int i = 0 ; i < len ; i++)
		{
			userorderid[i] = num.charAt(random1.nextInt(num.length()));
		}
		return userorderid;
	}
	
	public static void ResponseTodealerStock(String to , String subject , String body)
	{
		Properties props = new Properties();
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		Authentication auth = new Authentication();
		
		Session session = Session.getInstance(props, auth);
		
		try
		{
			Message message = new MimeMessage(session);			
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);
			
			Transport.send(message);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
/*	public static String sendStockInfoTOAdminViaDealer(String to , String subject , String body)
	{					
		Properties props = new Properties();
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		Authentication auth = new Authentication();
		
		Session session = Session.getInstance(props, auth);
		
		try
		{
			Message message = new MimeMessage(session);			
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);	
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	
		System.out.println("mail sent. success");
		return body;
	}*/
}	
	
	
	
	
	

	/*static class Authentication extends Authenticator
	{
		@Override
		protected PasswordAuthentication getPasswordAuthentication()
		{
			return new PasswordAuthentication(fromMail,pass);
		}
	}*/
	
	/*public static String sendMailOrder(String to , String subject , String body)
	{
		String otp = new String (OTP(4));
		System.out.println(" OTP is : "+otp);
		Properties props = new Properties();
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.port","587");
		
		Authentication auth = new Authentication();
		
		Session session = Session.getInstance(props, auth);
		
		try
		{
			Message message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipieats(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);
			
			Transport.send(message);
			return otp;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}*/















/*
HtmlEmail email = new HtmlEmail();
email.setHostName("smtp.gmail.com");
email.setSmtpPort(465);
email.setAuthenticator(new DefaultAuthenticator("sendersEmailAddress", "password"));
email.setSSLOnConnect(true);
email.setFrom("Senders' email");
email.setSubject("TestMail- Alternative message");
email.setHtmlMsg("<html>\n" +
       "<body>\n" +
       "\n" +
       "<a href=\"http://pushpalankajaya.blogspot.com\">\n" +
       "This is a link</a>\n" +
       "\n" +
       "</body>\n" +
       "</html>");
// set the alternative message
email.setTextMsg("This is a link: http://pushpalankajaya.blogspot.com");
email.addTo("lanka@wso2.com");
email.send();
*/