package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.BoardDto;
import kr.co.hospital.client.service.BoardService;
import lombok.RequiredArgsConstructor;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@Qualifier("cbc")
public class BoardController {
	
	@Autowired
	BoardService service;
	private final WebApplicationContext context;
	
	@RequestMapping("/main/boardwrite")
	public String boardwrite(HttpSession session,Model model) {
		return service.boardwrite(session,model);
	}
	
	@RequestMapping("/main/boardreadnum")
	public String boardreadnum(HttpServletRequest request) {
		return service.boardreadnum(request);
	}
	
	@RequestMapping("/main/boardcontent")
	public String boardcontent(HttpServletRequest request, Model model, HttpSession session) {
		return service.boardcontent(request, model, session);
	}
	
	
	@RequestMapping("/main/boarddelete")
	public String boarddelete(HttpServletRequest request) {
		return service.boarddelete(request);
	}
	
	@RequestMapping("/main/boardupdate")
	public String boardupdate(HttpServletRequest request, Model model) {
		return service.boardupdate(request,model);
	}
	

	@RequestMapping("/main/boardlist")

	public String boardlist(HttpSession session,Model model,HttpServletResponse response, HttpServletRequest request) {
		return service.boardlist(session,model,response,request);
		
	}
	
	
	
	 @PostMapping(value = "/boardimageupload")
	 @ResponseBody
	    // @RequestParam은 자바스크립트에서 설정한 이름과 반드시 같아야합니다.
		public ResponseEntity<?> imageUpload(@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
			try {
				// 서버에 저장할 경로
				System.out.println("컨트롤러 들어왔음");
				String uploadDirectory = context.getServletContext().getRealPath("/boardfile");
				System.out.println(uploadDirectory);
				// 업로드 된 파일의 이름
				String originalFileName = file.getOriginalFilename();
				
				// 업로드 된 파일의 확장자
				String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				// 업로드 될 파일의 이름 재설정 (중복 방지를 위해 UUID 사용)
				String uuidFileName = UUID.randomUUID().toString() + fileExtension;
				
				// 위에서 설정한 서버 경로에 이미지 저장
				file.transferTo(new File(uploadDirectory, uuidFileName));
			
				System.out.println("************************ 업로드 컨트롤러 실행 ************************");
				System.out.println(uploadDirectory);
				
				// Ajax에서 업로드 된 파일의 이름을 응답 받을 수 있도록 해줍니다.
				return ResponseEntity.ok(uuidFileName);
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseEntity.badRequest().body("이미지 업로드 실패");
			}
			
		}
	 
	 
	 
	 
	 @PostMapping("/main/boardwriteOk")
	 @ResponseBody
	    public void boardwriteOk(BoardDto bdto) {
	        // postContent는 Summernote에서 작성된 HTML 코드입니다.
		 	
		 	service.boardinsert(bdto);

	        // 데이터베이스에 저장하거나, 추가 로직을 수행
	        // 예: postService.savePost(postContent);
	    }
	
	 
	 @PostMapping("/main/boardupdateOk")
	 @ResponseBody
	    public void boardupdateOk(BoardDto bdto, HttpServletRequest request) {
	        // postContent는 Summernote에서 작성된 HTML 코드입니다.
		 	service.boardupdateOk(bdto,request);
	        // 데이터베이스에 저장하거나, 추가 로직을 수행
	        // 예: postService.savePost(postContent);
	    }
	
	 
	 
	 
	
	
}
