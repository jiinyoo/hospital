package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.ManagementDto;
import kr.co.hospital.admin.mapper.ManagementMapper;
import java.util.List;

@Service
@Qualifier("manager")
public class ManagementServiceImpl implements ManagementService {
	
	@Autowired
	private ManagementMapper mapper;
	
	 @Override
	    public String List(HttpServletRequest request,
	    		Model model) 
	    {
		 int page=request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
	        String search=request.getParameter("search")==null ? "" : request.getParameter("search").trim();
	        int limit=10;  // 페이지당 보여줄 사용자 수
	        int offset=(page-1)*limit;

	        // 유저 수와 페이징 계산
	        int totalUsers;
	        List<ManagementDto> mdto;

	        if (!search.isEmpty()) 
	        {
	            // 검색 조건에 맞는 전체 유저 수 가져오기
	            totalUsers=mapper.getTotalUsersBySearch(search);
	            // 검색 조건에 맞는 유저 목록 가져오기
	            mdto=mapper.getUsersBySearch(search,offset,limit);
	        } else {
	            // 전체 유저 수 가져오기
	            totalUsers=mapper.getTotalUsers();
	            // 페이징 처리된 유저 목록 가져오기
	            mdto = mapper.getUsersByPage(offset,limit);
	        }

	        int totalPage=(int) Math.ceil((double)totalUsers/limit);

	        // 모델에 필요한 정보 추가
	        model.addAttribute("mdto",mdto);
	        model.addAttribute("page",page);
	        model.addAttribute("totalPage", totalPage);
	        model.addAttribute("search", search);

	        return "/admin/user/list";
	    }

	    @Override
	    public String updateState(ManagementDto mdto,
	    		HttpSession session, HttpServletRequest request) 
	    {
	    	 Integer state=(Integer)session.getAttribute("state");
	    	 String user_id=(String)session.getAttribute("user_id");
	    	 String id=request.getParameter("user_id");
	    	 
	         if ("admin".equals(user_id)) 
	         {
	        	// 상태가 4로 변경되는 경우 해당 회원을 삭제
	             if (mdto.getState() == 4) 
	             {
	                 if (mapper.isDoctor(id)) 
	                 {
	                     mapper.delWorkday(mapper.getDocId(id));  // 의사와 관련된 정보 삭제
	                     mapper.delDoctor(mapper.getDocId(id));   // 의사 정보 삭제
	                 }
	                 // 회원 정보 삭제
	                 mapper.deleteUser(id);
	             } 
	             else 
	             {
	                 // 의사일 경우 의사 정보 삭제
	                 if (mapper.isDoctor(id)) 
	                 {
	                     mapper.delWorkday(mapper.getDocId(id));
	                     mapper.delDoctor(mapper.getDocId(id));
	                 }
	                 // 상태 업데이트
	                 mapper.updateState(mdto);
	             }
	             return "redirect:/admin/user/list";
	         } 
	         else 
	         {
	             return "redirect:/admin/user/list?error=1";
	         }
	    }

}
