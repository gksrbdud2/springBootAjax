package com.example.demo.board.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Import({ ProfileLinux.class, ProfileWindow.class})
@Configuration
public class ProfileConfig {

}
