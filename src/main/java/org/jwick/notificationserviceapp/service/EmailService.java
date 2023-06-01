package org.jwick.notificationserviceapp.service;
import org.jwick.commonserviceapp.model.EmailDetails;


public interface EmailService {
	void sendRegistrationEmail(EmailDetails details);

}
