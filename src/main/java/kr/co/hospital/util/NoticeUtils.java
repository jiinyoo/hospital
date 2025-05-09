package kr.co.hospital.util;

import java.io.File;

import org.springframework.util.ResourceUtils;

public class NoticeUtils {
	public static String getFileName(String fname,String str) throws Exception
	{
		File ff=new File(str);
		while(ff.exists()) 
		{
			String code=""; 
			for(int i=1;i<=4;i++)
			{
				int num=(int)(Math.random()*62);
				
				if(num>=0 && num<=9)
					num=num+48;  // num 48~57
				else if(num>=10 && num<=35)
					     num=num+55; //num 65~90
				     else
				    	 num=num+61; //num 97~122
				
				code=code+(char)num;	
			}                
			String[] imsi=fname.split("[.]"); 
			String newFname=imsi[0]+code+"."+imsi[1];  
			
			str=ResourceUtils.getFile("classpath:static/client/notice").toPath().toString()+"/"+newFname;
			
			ff=new File(str);
		}

		return str;
	}
	

}
