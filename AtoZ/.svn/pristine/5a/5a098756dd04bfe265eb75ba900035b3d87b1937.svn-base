<%@page import="com.spring.AtoZ.vo.ClientVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	var filter="win16|win32|win64|mac|macintel";
	
	if(navigator.platform){
		if(filter.indexOf(navigator.platform.toLowerCase())<0){
			// mobile page go
			location.href="m.loginForm";
		} else {
			// pc page go
			location.href="homepage/home";
		}
	}
</script>