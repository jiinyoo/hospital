package kr.co.hospital.util;

public class UserUtils {

	public static String ranPwd()
	{
		String ran="qwerasdfzxcvtyuighjkbnmoplQWERASDFZXCVTYUIOPGHJKLBNM1234567890!@#$%^&*";
		String ranPwd="";
		for(int i=0;i<6;i++)
		{
			int index=(int)(Math.random()*ran.length());
			ranPwd=ranPwd+ran.substring(index,index+1);
		}
		
		return ranPwd;
	}

}
