package com.example.myframe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class MyframeApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyframeApplication.class, args);
	}

}
