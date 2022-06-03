package mybeans;

import java.net.URL;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;

public class TransEmailReport {
	
	String userid;
	String walletid;
	
	public TransEmailReport(){
		userid=null;
		walletid=null;
	}
	
	public static void main(String[] args) {
		try {
			 // Create the attachment
			 // Create the email message
			  HtmlEmail email = new HtmlEmail();
			  email.setHostName("mail.myserver.com");
			  email.addTo("jdoe@somewhere.org", "John Doe");
			  email.setFrom("me@apache.org", "Me");
			  email.setSubject("Test email with inline image");
			  
			  // embed the image and get the content id
			  URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");
			  String cid = email.embed(url, "Apache logo");
			  
			  // set the html message
			  email.setHtmlMsg("<html>The apache logo - <img src=\"cid:"+cid+"\"></html>");

			  // set the alternative message
			  email.setTextMsg("Your email client does not support HTML messages");

			  // send the email
			  email.send();
		}
		catch(Exception ex) {
			
		}
	}

}
