package com.github.wenqiglantz.service.demo.functions;

import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.function.Consumer;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class LambdaFunctions {

    @Bean
    public Consumer<APIGatewayProxyRequestEvent> demo() {
        return (request) -> {
            log.debug(">>> request " + request.getBody());
        };
    }
}
