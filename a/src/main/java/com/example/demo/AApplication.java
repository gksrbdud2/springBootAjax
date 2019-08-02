package com.example.demo;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication

@MapperScan(value={"com.example.demo.board.mapper"})
public class AApplication {
	

	public static void main(String[] args) {
		
		SpringApplication.run(AApplication.class, args);
	
		/*
		Logger logger = LoggerFactory.getLogger(AApplication.class);
	     
	    logger.debug("debug");
	    logger.info("info");
	    logger.warn("warn");
	    logger.error("error");
	    */

	}

	/*
     * SqlSessionFactory 설정
     */
   
}