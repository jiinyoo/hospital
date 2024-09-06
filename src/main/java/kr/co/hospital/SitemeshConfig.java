package kr.co.hospital;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshConfig extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder)
	{
	 
		builder.addDecoratorPath("*", "/default.jsp");		
		builder.addDecoratorPath("/admin/*", "/admindefault.jsp");
		//builder.addExcludedPath("/main/login");
		//builder.addExcludedPath("/main/loginOk");
		//builder.addExcludedPath("/main/user");
		//builder.addExcludedPath("/main/userOk");
		
		// 제외할 폴더와 문서
		//builder.addExcludedPath("/test/*");
		
        super.applyCustomConfiguration(builder);
        
	}
}
