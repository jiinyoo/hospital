package kr.co.hospital.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 이 경로는 운영 환경에 맞게 수정해야 합니다.
        // 예를 들어, 애플리케이션의 루트 경로를 사용하거나 외부 경로를 사용할 수 있습니다.
        String uploadPath = "file:src/main/webapp/boardfile/";

        registry.addResourceHandler("/boardfile/**")
                .addResourceLocations(uploadPath);
        
   
        
    }
}