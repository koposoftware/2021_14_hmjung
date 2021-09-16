package gc.co.kr.chating.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import gc.co.kr.chating.handler.SocketHandler;




@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

   @Autowired
   SocketHandler socketHandler;
   
   @Override
   public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
      registry.addHandler(new SocketHandler(), "/chatting")
      .setAllowedOrigins("*");
   }
}