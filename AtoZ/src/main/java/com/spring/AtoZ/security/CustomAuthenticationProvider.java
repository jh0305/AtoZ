package com.spring.AtoZ.security;

import java.sql.SQLException;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.spring.AtoZ.serviceUse.dao.ServiceUseDAO;
import com.spring.AtoZ.vo.ClientVO;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	private ServiceUseDAO serviceUseDAO;
	public void setServiceUseDAO(ServiceUseDAO serviceUseDAO) {
		this.serviceUseDAO = serviceUseDAO;
	}
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String) auth.getPrincipal();
		String login_pwd = (String) auth.getCredentials();
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		ClientVO client = null;
		try {
			client = serviceUseDAO.selectClientById(login_id);
		} catch (SQLException e) {
			throw new AuthenticationServiceException("Internal server error!");
		}
		if(client != null && passwordEncoder.matches(login_pwd, client.getPwd())) {
			if(client.getAct_yn() != 1 ){
				throw new BadCredentialsException("이용신청 심사중입니다. \\n문의사항은 042-222-8202으로 연락부탁드립니다.");
			}
			User authUser = new User(client);
			UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(), authUser.getAuthorities());
			result.setDetails(authUser);
			return result;
		}
		else {
			throw new BadCredentialsException("아이디 혹은 비밀번호가 일치하지 않습니다.");
		}
		
	}
	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	
}
