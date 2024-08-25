package com.kh.team.util;

import java.io.File;
import java.util.UUID;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class UploadFileUtils implements Codes, Access{

	// s3 버킷 이름
		private static String BUCKET = "teamptbucket";
		
		// s3 엑세스
		private static AmazonS3 access() {
			AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
			ClientConfiguration clientConfig = new ClientConfiguration();
			clientConfig.setProtocol(Protocol.HTTP);
			
			// 대희 계정에 접속? 오라클 접속이랑 비슷
			final AmazonS3 s3 = new AmazonS3Client(credentials, clientConfig);
			s3.setEndpoint("s3.ap-northeast-2.amazonaws.com");
			
			return s3;
		}
		
		// 이미지 파일인지 확인하기
		// 예시 FileUploadUtil.isImage(fileName);
		public static boolean isImage(String fileName) {
			int dotIndex = fileName.lastIndexOf(".");
			String extName = fileName.substring(dotIndex+1);
			String upper = extName.toUpperCase();
			if(!upper.equals("JPG") && !upper.equals("PNG") && !upper.equals("GIF")) {
				return false;
			} else {
				return true;
			}
		}
		
		// 파일 업로드
		// 예시 FileUploadUtil.upload(file, FileUploadUtil.DLVR_IMG);
		public static String upload(File file, String fileName) {
			AmazonS3 s3 = access();
			UUID uuid = UUID.randomUUID();
			String fileNames = uuid + "_" + fileName;
			PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET + "/goods", fileNames, file);
			putObjectRequest.setCannedAcl(CannedAccessControlList.PublicReadWrite);
			s3.putObject(putObjectRequest);
			return fileNames;
		}
		
		// 파일 삭제
		// 예시 FileUploadUtil.delete("dog.jpg", FileUploadUtil.DLVR_IMG);
		public static void delete(String fileName) {
			AmazonS3 s3 = access();
			s3.deleteObject(BUCKET + "/goods", fileName);
		}
}
