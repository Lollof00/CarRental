package ForgetPassword;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtility {
    private static final String SSL_FACTORY="javax.net.ssl.SSLSocketFactory";
    private static Properties properties = new Properties();
    static {
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.debug", "true");
        properties.put("mail.smtp.port", 465);
        properties.put("mail.smtp.socketFactory.port",465);
        properties.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        properties.put("mail.smtp.socketFactory.fallback", "false");
        properties.put("mail.smtp.starttls.enable", "true");
    }

    public static void sendMail(EmailMessage emailMessage){
        String sender_email="carrentalSapienza@gmail.com";
        String sender_email_pass = "xogshhydmxlyvrpv";
        try {
            Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return  new PasswordAuthentication(sender_email,sender_email_pass);
                }
            });
            session.setDebug(true);
            Message msg = new MimeMessage(session);
            InternetAddress addressFrom = new InternetAddress(sender_email);
            msg.setFrom(addressFrom);
            String[] emailIds = new String[0];
            if(emailMessage.getTo()!=null){
                emailIds = emailMessage.getTo().split(",");
            }
            String[] emailIdsCc = new String[0];
            if (emailMessage.getCc() != null) {
                emailIdsCc = emailMessage.getCc().split(",");
            }
            // Set BCC addresses
            String[] emailIdsBcc = new String[0];
            if (emailMessage.getBcc() != null) {
                emailIdsBcc = emailMessage.getBcc().split(",");
            }
            InternetAddress[] addressTo = new InternetAddress[emailIds.length];
            for (int i = 0; i < emailIds.length; i++) {
                addressTo[i] = new InternetAddress(emailIds[i]);
            }
            InternetAddress[] addressCc = new InternetAddress[emailIdsCc.length];
            for (int i = 0; i < emailIdsCc.length; i++) {
                addressCc[i] = new InternetAddress(emailIdsCc[i]);
            }
            InternetAddress[] addressBcc = new InternetAddress[emailIdsBcc.length];
            for (int i = 0; i < emailIdsBcc.length; i++) {
                addressBcc[i] = new InternetAddress(emailIdsBcc[i]);
            }
            if (addressTo.length > 0) {
                msg.setRecipients(Message.RecipientType.TO, addressTo);
            }
            if (addressCc.length > 0) {
                msg.setRecipients(Message.RecipientType.CC, addressCc);
            }
            if (addressBcc.length > 0) {
                msg.setRecipients(Message.RecipientType.BCC, addressBcc);
            }
            msg.setSubject(emailMessage.getSubject());

            switch (emailMessage.getMessageType()){
                case EmailMessage.HTML_MSG:
                    msg.setContent(emailMessage.getMessage(),"text/html");
                    break;
                case EmailMessage.TEXT_MSG:
                    msg.setContent(emailMessage.getMessage(),"text/plain");
                    break;

            }

            Transport.send(msg);

        } catch (AddressException e) {
            throw new RuntimeException(e);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
