package kr.co.hospital.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Component
public class MailSend {

    @Autowired
    private JavaMailSender mailSender;

    public int setEmail(String email, String subject, String body) {
        int state = 0;
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");

            helper.setFrom("jdw1186@naver.com");
            helper.setTo(email);
            helper.setSubject(subject);
            helper.setText(body, true);

            mailSender.send(mimeMessage);
            state = 1;
        } catch (MessagingException e) {
            e.printStackTrace();
            state = 0;
        }
        return state;
    }
}
