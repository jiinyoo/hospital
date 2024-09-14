package kr.co.hospital.admin.service;

import java.io.File;
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
import kr.co.hospital.admin.dto.ProgramdaysDto;

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
	public String programwrite() {
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
		mapper.insertprogram(pdto);
		int proId = mapper.selectrecentid();
		if (pdto.getDay_of_week() != null) {
	        // 기존 데이터를 삭제하지 않고 새로운 데이터를 삽입
	        mapper.deleteProgramDays(proId); // 선택적으로 기존 데이터 삭제
	        for (Integer day : pdto.getDay_of_week()) {
	            mapper.insertProgramDay(proId, day);
	        }
	    }
		
		return "redirect:/admin/program/program";
		
		
	}

	@Override
	public String programdelete(HttpServletRequest request) throws Exception {
		int pro_id=Integer.parseInt(request.getParameter("pro_id"));
		ProgramDto pdto=mapper.getContent(pro_id);
		String path=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString();
		File file=new File(path,pdto.getPro_img());
		if(file.exists()) {
			file.delete();
		}
		mapper.deleteProgram(pro_id);
		mapper.deleteProgramDays(pro_id);
		return "redirect:/admin/program/program";
	}

	@Override
	public String programupdate(HttpServletRequest request,Model model) {
		int pro_id=Integer.parseInt(request.getParameter("pro_id"));
		ProgramDto pdto=mapper.getContent(pro_id);
		ArrayList<ProgramdaysDto> pdlist=mapper.getProgramdays(pro_id);
		model.addAttribute("pdto",pdto);
		model.addAttribute("pdlist",pdlist);
		return "/admin/program/programupdate";
	}

	@Override
	public String programupdateOk(MultipartHttpServletRequest multi,ProgramDto pdto, HttpServletRequest request, Model model, HttpSession session) throws Exception {
		MultipartFile file=multi.getFile("file");
		String fname=file.getOriginalFilename();
		String originimg=request.getParameter("originimg");
		int pro_id=Integer.parseInt(request.getParameter("pro_id"));
		if(!file.isEmpty()) {
			String str=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+fname;
			//System.out.println("되는가"+str.substring(0,str.lastIndexOf("/")));
			str=FileUtils.getFileName(fname, str);
			String saveFname=str.substring(str.lastIndexOf("/")+1);
			Path path=Paths.get(str);
			Files.copy(file.getInputStream(),path,StandardCopyOption.REPLACE_EXISTING);
			System.out.println("파일 저장됨");
			pdto.setPro_img(saveFname);
			
			String fororiginPath=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString();
			File originfile = new File(fororiginPath,originimg);
			if(originfile.exists()) {
				originfile.delete();
			}
			
		} else {
			pdto.setPro_img(originimg);
		}
		mapper.updateProgram(pdto);
		
		int proId = pro_id;
		if (pdto.getDay_of_week() != null) {
	        // 기존 데이터를 삭제하지 않고 새로운 데이터를 삽입
	        mapper.deleteProgramDays(proId); // 선택적으로 기존 데이터 삭제
	        for (Integer day : pdto.getDay_of_week()) {
	            mapper.insertProgramDay(proId, day);
	        }
	    }
		return "redirect:/admin/program/program";
	}
	

}
