package com.spring.javawebS.common;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

public class JavawebProvide {
	public int fileUpload(MultipartFile fName, String urlPath) {
		int res = 0;
		try {
			UUID uid = UUID.randomUUID();
			String oFileName = fName.getOriginalFilename();
			String saveFileName = uid + "_" + oFileName;
			writeFile(fName, saveFileName, urlPath);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}

	public void writeFile(MultipartFile fName, String saveFileName, String flag) throws IOException {
		byte[] data = fName.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/"+flag+"/");
		
		FileOutputStream fos = new FileOutputStream(realPath + saveFileName);
		fos.write(data);
		fos.close();
	}
}
