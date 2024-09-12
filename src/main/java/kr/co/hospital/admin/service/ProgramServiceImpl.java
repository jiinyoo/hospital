package kr.co.hospital.admin.service;

import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.mapper.ProgramMapper;
import kr.co.hospital.util.FileUtils;
import kr.co.hospital.admin.dto.ProgramDto;

@Service
@Qualifier("pc")
public class ProgramServiceImpl implements ProgramService {
	@Autowired
	ProgramMapper mapper;

	@Override
	public String program(HttpServletRequest request, Model model, HttpSession session) {
		
		ArrayList<ProgramDto> plist=mapper.programs();
		model.addAttribute("plist",plist);
		return "/admin/program/program";
	}

	@Override
	public String programwrite(HttpServletRequest request, Model model, HttpSession session) {
		// TODO Auto-generated method stub
		String pro_ju=request.getParameter("pro_ju");
		model.addAttribute("pro_ju",pro_ju);
		
		return "/admin/program/programwrite";
	}

	@Override
	public String programwriteOk(ProgramDto pdto,MultipartHttpServletRequest multi,HttpServletRequest request, Model model, HttpSession session) throws Exception {
		MultipartFile file=multi.getFile("file");
		String fname=file.getOriginalFilename();
		
		if(!file.isEmpty()) {
			String str=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+fname;
			//System.out.println("되는가"+str.substring(0,str.lastIndexOf("/")));
			str=FileUtils.getFileName(fname, str);
			String saveFname=str.substring(str.lastIndexOf("/")+1);
			
			Path path=Paths.get(str);
			Files.copy(file.getInputStream(),path,StandardCopyOption.REPLACE_EXISTING);
			
			System.out.println("파일 저장됨");
			
			pdto.setPro_img(saveFname);
			
		}
		
		
		int jucheck=mapper.juisnullcheck(pdto.getPro_ju());
		if(jucheck!=0) {
			mapper.programupdate(pdto);
		} else {
			mapper.insertprogram(pdto);
		}
		
		
		
		return "redirect:/admin/program/program";
		
		
	}
	

}
