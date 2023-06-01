package org.jwick.notificationserviceapp.controller;
import org.jwick.notificationserviceapp.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import org.jwick.commonserviceapp.model.DataResponse;
import org.jwick.commonserviceapp.model.EmailDetails;

@RestController
public class EmailController {
	@Autowired
	private EmailService emailService;

	@Autowired
	private KafkaTemplate<String, Object> kafkaTemplate ;


	@PostMapping("/sendRegistrationMail")
	public ResponseEntity<DataResponse> sendMail(@RequestBody EmailDetails details)
	{
		emailService.sendRegistrationEmail(details);
		return ResponseEntity.ok(
				new DataResponse(true,
						"Registration mail sent succesfully")
				);
	}

	@GetMapping("/test")
	public void standpoint(){
		kafkaTemplate.send("MotaBhai", "Testghghg");
	}

}
