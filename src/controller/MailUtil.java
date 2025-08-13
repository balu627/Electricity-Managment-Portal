package controller;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailUtil {

    public static void sendEmail(String toEmail, String subject, String messageText) {
        final String fromEmail = "abc@gmail.com";
        //THANK YOU FOR THE MAIL RECTIFIED 
        final String password = "somecodegivenbyapp"; // Not your Gmail password. Use App Password.

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "587"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.starttls.enable", "true"); 

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "Electricty Portal"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(messageText);

            Transport.send(message);
            System.out.println("Email Sent Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
