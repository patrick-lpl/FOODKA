package com.atguigu.crud;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
@MapperScan("com.**.dao")
public class HuoguoApplication {

    public static void main(String[] args) {
        SpringApplication.run(HuoguoApplication.class, args);
    }

}
