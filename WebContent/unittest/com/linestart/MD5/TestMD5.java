package com.linestart.MD5;

import java.security.NoSuchAlgorithmException;

import util.SecurityMD5;

public class TestMD5 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		SecurityMD5 s = new SecurityMD5();
		try {
			System.out.println(s.MD5Encode("90ffc9deb3683f9d18914b6e42dc3e89"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
