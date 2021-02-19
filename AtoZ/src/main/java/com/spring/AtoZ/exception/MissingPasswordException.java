package com.spring.AtoZ.exception;

public class MissingPasswordException extends Exception{
	public MissingPasswordException() {
		super("비밀번호가 틀렸습니다.");
	}
}
