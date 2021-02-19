 package com.spring.AtoZ.security;

import java.util.List;

import org.springframework.context.ApplicationListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;

import com.spring.AtoZ.vo.ClientVO;

public class SessionDestroyListener implements ApplicationListener<SessionDestroyedEvent>{
	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
		
		List<SecurityContext> contexts = event.getSecurityContexts();
		if(!contexts.isEmpty()) {
			for(SecurityContext ctx : contexts) {
				Authentication auth = ctx.getAuthentication();
				
				if(auth != null && auth.getDetails() != null) {
					try {
						User user = (User) auth.getDetails();
						
						ClientVO client = user.getClientVO();
						
						System.out.println("user invalid session : " + client);
						
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
			
		}
		
	}
}
