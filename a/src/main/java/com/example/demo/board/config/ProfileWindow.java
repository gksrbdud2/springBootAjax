package com.example.demo.board.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;

@Configuration
@Profile(value="window")
@PropertySource({"classpath:window/application.properties"})
public class ProfileWindow {

}
