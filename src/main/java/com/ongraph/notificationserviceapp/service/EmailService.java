package com.ongraph.notificationserviceapp.service;
import com.ongraph.commonserviceapp.model.EmailDetails;


public interface EmailService {
	void sendRegistrationEmail(EmailDetails details);

}
