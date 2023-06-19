package com.spring.javawebS.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javawebS.dao.BoardDAO;
import com.spring.javawebS.dao.GuestDAO;
import com.spring.javawebS.dao.MemberDAO;

@Service
public class PageProcess {

	@Autowired
	GuestDAO guestDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	BoardDAO boardDAO;
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		String search="";
		int totRecCnt = 0;
		
		if(section.equals("guest"))	totRecCnt = guestDAO.totRecCnt();
		else if(section.equals("member"))	totRecCnt = memberDAO.totRecCnt(searchString);
		else if(section.equals("board")) {
			if(part.equals("")) totRecCnt = boardDAO.totRecCnt();
			else {
				search = part;
				totRecCnt = boardDAO.totRecCntSearch(search, searchString);
			}
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt /pageSize : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setCurBlock(curBlock);
		pageVO.setBlockSize(blockSize);
		pageVO.setLastBlock(lastBlock);
		pageVO.setPart(part);
		pageVO.setSearch(search);
		pageVO.setSearchString(searchString);
		
		return pageVO;
	}

}
