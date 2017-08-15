package com.flowingsand.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * HMAC算法类
 * @author yyt
 *
 */
public class MessageDigestTools {
	
	public static String encryptMD5(byte[] data) throws NoSuchAlgorithmException{
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		md5.update(data);
		byte[] resultBytes = md5.digest();
		String resultString = BytesToHex.fromBytesToHex(resultBytes);
		return resultString;
	}
	
	public static String encryptSHA(byte[] data) throws NoSuchAlgorithmException{
		MessageDigest sha = MessageDigest.getInstance("SHA-512");
		sha.update(data);
		byte[] resultBytes = sha.digest();
		String resultString = BytesToHex.fromBytesToHex(resultBytes);
		return resultString;
	}
	
}
