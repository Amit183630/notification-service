// Java Program to Illustrate Creation Of
// Service implementation class

package com.ongraph.notificationserviceapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import com.ongraph.commonserviceapp.exception.CustomException;
import com.ongraph.commonserviceapp.model.EmailDetails;
import com.ongraph.commonserviceapp.model.ErrorCodes;
import com.ongraph.notificationserviceapp.model.EmailTemplates;
import com.ongraph.notificationserviceapp.service.EmailService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private TemplateEngine templateEngine;
	@Value("${spring.mail.username}")
	private String sender;

	public void sendRegistrationEmail(EmailDetails details) {
		Context context = new Context();
		context.setVariables(details.getVariables());
		String html = templateEngine.process(EmailTemplates.REGISTRATION.getValue(), context);
		MimeMessage message = javaMailSender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setFrom(sender);
			helper.setTo(details.getRecipient());
			helper.setSubject("Registration Confirmation");
			helper.setText(html, true);
			javaMailSender.send(message);
		} catch (MessagingException e) {
			throw new CustomException(ErrorCodes.E_ISE500, e.getMessage());
		}
	}
}
