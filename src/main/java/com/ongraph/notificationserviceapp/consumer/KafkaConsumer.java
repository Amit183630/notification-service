package com.ongraph.notificationserviceapp.consumer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import com.ongraph.commonserviceapp.model.EmailDetails;
import com.ongraph.notificationserviceapp.service.EmailService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class KafkaConsumer {

	@Autowired
	EmailService emailService;
	
    @KafkaListener(topics = "${ongraph.kafka.topics.registrationEmail}",groupId = "reg.email",
    		concurrency = "3")
    public void listen(@Payload EmailDetails details,Acknowledgment ack,
    		@Header(name = KafkaHeaders.OFFSET) String offset){
		log.info("consumed data:{} on offset:{}",details,offset);
        emailService.sendRegistrationEmail(details);
        ack.acknowledge();
    }

}
