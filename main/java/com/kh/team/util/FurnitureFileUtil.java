package com.kh.team.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.util.IOUtils;

public class FurnitureFileUtil {

	private static String uploadFileDirectory = "C:/Temp/auctionImg";
	
	public static String uploadFile(MultipartFile file, String categoryName) throws Exception {
		//카테고리에 해당하는 디렉토리를 만든다
		String directoryPath = uploadFileDirectory + "/" +  categoryName;
		mkDirectory(directoryPath);
		//기존 파일 이름 xxx.jpg
		String originalName = file.getOriginalFilename();
		//새로만들 파일 이름
		String saveFileName = makeFileName(originalName);
		
		//(저장할 파일,(저장할 디렉토리,새로 저장할 파일이름))
		IOUtils.copy(file.getInputStream(), new FileOutputStream(new File(directoryPath,saveFileName)));
		
		
		return directoryPath+"/"+saveFileName;
	}
	
	private static void mkDirectory(String directoryPath) {
		
		File file = new File(directoryPath);
		//uploadFileDirectory 에 furniture 디렉토리를 만든다
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	
	public static boolean chkDirecotry(String folderName) { // 폴더 이름을 받아서
		String directoryPath = uploadFileDirectory + "/" +  folderName; //폴더 경로를 붙인다
		//System.out.println("FurnitureFileUtil chkDirecotry:"+ directoryPath);
		File file = new File(directoryPath);
		
		boolean result = false;
		if(!file.exists()) {
			result = true;
		}
		
		return result;
	}
	
	private static String makeFileName(String originalName) {
		
		//System.out.println("FurnitureFileUpload originalName:"+originalName);
		int length = originalName.length();
		int dot = originalName.lastIndexOf(".");
		
		//파일 이름 앞부분 가져오기
		String firstName = originalName.substring(0,dot);
		//System.out.println("FurnitureFileUpload firstName:"+firstName);
		
		//파일 앞부분에 날짜와 UUID추가
		String uuidFileName = addFileName(firstName);
		
		//확장 가져오기
		String expandName = originalName.substring(dot+1, length);
		
		String saveFileName = uuidFileName + "." + expandName;
		return saveFileName;
	}
	
	private static String addFileName(String firstName) {
		UUID uuid = UUID.randomUUID();
		String uuidFileName = firstName + "_" + uuid;
		return uuidFileName;
	}
	
	public static boolean checkImage(String fileName) {
		
		int length = fileName.length();
		int lastLen = fileName.lastIndexOf(".");
		String expandName = fileName.substring(lastLen+1, length);
		
		String upperExpandName = expandName.toUpperCase();
		//System.out.println("FurnitureFileUpload upperExpandName:"+upperExpandName);
		
		boolean result = false;
		if(upperExpandName.equals("JPG") || upperExpandName.equals("GIF") || upperExpandName.equals("PNG")) {
			result = true;
		}
		return result;
	}
	
	public static boolean deleteImage(String fileName) {
		System.out.println("FurntureFileUpload deleteImage에서 fileName:"+fileName);
		File f = new File(fileName);
		if(f.exists()) {
			f.delete();
		}
		
		return true;
	}
	
	public static boolean deleteFolder(String folderName) {
		System.out.println("FurntureFileUpload deleteFolder에서 folderName:"+folderName);
		String folderPath = uploadFileDirectory + "/" +  folderName;
		File f = new File(folderPath);
		
		while(f.exists()) {
			File[] files = f.listFiles();
			
			for(int i=0 ; i<files.length ; i++) {
				files[i].delete();
				System.out.println(folderName+"폴더안에 파일이 삭제 됨");
			}
			
			if(files.length == 0 && f.isDirectory()) {
				f.delete();
				System.out.println(folderName+"폴더가 삭제 됨");
			}
		}
		return true;
	}
}
