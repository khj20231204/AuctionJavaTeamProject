package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.util.IOUtils;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.service.FurnitureService;
import com.kh.team.util.FurnitureFileUtil;

@Controller
@RequestMapping(value="/furniture")
public class FurnitureController {
	
	@Inject
	private FurnitureService furnitureService;
	//인테리어
	@RequestMapping(value = "/202", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{	
		List<FurnitureInteriorVo> list = furnitureService.getFurnitureInteriorList();
		model.addAttribute("list", list);
		return "furnitureCategory/interior";
	}
	//생활
	@RequestMapping(value = "/201", method = RequestMethod.GET)
	public String joinForm() {	
		return "furnitureCategory/life";
	}	
	
	@RequestMapping(value = "/writeForm", method = {RequestMethod.POST, RequestMethod.GET})
	public String writeForm() {	
		return "furnitureCategory/writeForm";
	}	
	
	@RequestMapping(value = "/uploadAjax/{num}", method = RequestMethod.POST)
	@ResponseBody
	public String uploadAjax(MultipartFile file, @PathVariable("num") int num) throws Exception {
		
		String fileName = file.getOriginalFilename();
		boolean result = FurnitureFileUtil.checkImage(fileName);
		String returnFileResult = "false";
		
		if(result) {
		String filePathAndName = FurnitureFileUtil.uploadFile(file, String.valueOf(num));
		returnFileResult = filePathAndName;
		}
		
		return returnFileResult;
	}	
	
	//등록에서 이미지 삭제는 db와 s2에 없는 상태기 때문에 그냥 폴더에서 파일만 지우면 된다
	@RequestMapping(value="/deleteAjax", method=RequestMethod.GET)
	@ResponseBody
	public String deleteAjax(String fileName) throws Exception{
		
		String result = "false";
		
		if(FurnitureFileUtil.deleteImage(fileName)) {
			result = "success";
		}
		
		return result;
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String imageName) throws Exception{
		
		byte[] bytes = null;
		
		if(imageName != null) {
			FileInputStream fis = new FileInputStream(imageName);
			bytes = IOUtils.toByteArray(fis);
		}
		return bytes;
	}
	
	@RequestMapping(value = "/jusoPopup", method = RequestMethod.POST)
	public String jusoPopup() {	
		return "furnitureCategory/jusoPopup";
	}
	
	@RequestMapping(value="/getFurnitureInteriorAddList", method=RequestMethod.GET)
	@ResponseBody
	public List<FurnitureInteriorVo> getFurnitureInteriorAddList(int num, Model model) throws Exception{
		List<FurnitureInteriorVo> list = furnitureService.getFurnitureInteriorAddList(num);
		model.addAttribute("list", list);
		return list;
	}
}
