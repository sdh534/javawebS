package com.spring.javawebS;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javawebS.pagination.PageProcess;
import com.spring.javawebS.pagination.PageVO;
import com.spring.javawebS.service.GuestService;
import com.spring.javawebS.vo.GuestVO;

@Controller
@RequestMapping("/guest")
public class GuestController {
	@Autowired
	GuestService guestService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value = "/guestList", method = RequestMethod.GET)
	public String guestListGet(
			@RequestParam(name = "pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name = "pageSize", defaultValue = "3", required = false) int pageSize,
			Model model) {
//		int totRecCnt = guestService.totRecCnt();
//		int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1 ;
//		int startIndexNo = (pag - 1) * pageSize;
//		int curScrStartNo = totRecCnt - startIndexNo;
//		
//		int blockSize = 3;
//		int curBlock = (pag - 1) / blockSize;
//		int lastBlock = (totPage - 1) / blockSize;
//		
//		model.addAttribute("pag",pag);
//		model.addAttribute("pageSize",pageSize);
//		model.addAttribute("totRecCnt",totRecCnt);
//		model.addAttribute("blockSize",blockSize);
//		model.addAttribute("totPage",totPage);
//		model.addAttribute("curScrStartNo",curScrStartNo);
//		model.addAttribute("curBlock",curBlock);
//		model.addAttribute("lastBlock",lastBlock);
//		
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "guest", "", "");
		ArrayList<GuestVO> vos = guestService.getGuestList(pageVO.getStartIndexNo(), pageSize);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("vos", vos);
		
		return "guest/guestList";
	}
	
	@RequestMapping(value = "/guestInput", method = RequestMethod.GET)
	public String guestInputGet() {
		return "guest/guestInput";
	}
	@RequestMapping(value = "/guestInput", method = RequestMethod.POST)
	public String guestInputPost(GuestVO vo, Model model) {
		int res = guestService.setGuestInput(vo);
		
		if(res == 1) return "redirect:/message/guestInputOk";
		else return "redirect:/message/guestInputNo";
	}
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLoginGet() {
		return "guest/adminLogin";
	}
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLoginPost(
			HttpServletRequest request,
			@RequestParam(value = "mid", defaultValue = "", required = false) String mid, 
			@RequestParam(value = "pwd", defaultValue = "", required = false) String pwd) {
		int res = guestService.getAdminCheck(mid, pwd);
		
		if(res==1) {
			HttpSession session = request.getSession();
			session.setAttribute("sAdmin", "adminOk");
			return "redirect:/message/guestAdminOk";
		}
		else return "redirect:/message/guestAdminNo";
		
	}
	
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String adminLogoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/message/adminLogout";
	}
	
	//방명록 글삭제
	@RequestMapping(value = "/guestDelete", method = RequestMethod.GET)
	public String guestDeleteGet(	@RequestParam(value = "idx", defaultValue = "0", required = false) int idx) {
		int res = guestService.setGuestDelete(idx);
		
		if(res==1) 
			return "redirect:/message/guestDeleteOk";
		else
			return "redirect:/message/guestDeleteNo";
	}
}
