package com.bae.haram;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.bae.haram")
public class HaramApplication {

	public static void main(String[] args) {
		SpringApplication.run(HaramApplication.class, args);
	}

}
