package com.example.demo.board.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
public class BoardConfig {
	 @Bean
	 public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{	        
		 SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();	        
		 sessionFactory.setDataSource(dataSource);
		 PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		 sessionFactory.setMapperLocations(resolver.getResources("classpath:mapper/*.xml"));
		 return sessionFactory.getObject();	        
    }

}