package com.ongraph.notificationserviceapp.model;

import lombok.Getter;

@Getter
public enum EmailTemplates {

	REGISTRATION("registration-template");
	private String value;
	
	private EmailTemplates(String value) {
		this.value=value;
	}
}
