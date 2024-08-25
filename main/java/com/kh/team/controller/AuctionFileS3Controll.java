package com.kh.team.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

public class AuctionFileS3Controll implements AuctionS3Key{

	private String filePathName;
	private int status;
	private final int FILEDOWN = 0;
	private final int INSERT = 1;
	private final int DELETE_FILE = 2;
	

	public AuctionFileS3Controll(String filePathName, int status) {
		this.filePathName = filePathName;
		this.status = status;
	}

	public void fileS3Controll() throws Exception {
		AWSCredentials credential = new BasicAWSCredentials(accesskey, secretkey);
		AmazonS3 s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credential))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
		String bucketName = "sdk-new-bucket"; //버킷(디렉토리) 이름
		/*
		filePathNameArray[0]:C:
		filePathNameArray[1]:Temp
		filePathNameArray[2]:auctionImg
		filePathNameArray[3]:15
		filePathNameArray[4]:2_5b68f941-1b63-486e-be6e-a19f119bab0b.jpg
		*/
		String[] filePathNameArray = filePathName.split("/");
		System.out.println("filePathNameArray:"+filePathNameArray.length);
		String folderName = filePathNameArray[3];
		String fileName = filePathNameArray[4];
		
		String bucketKey = folderName + "/" + fileName; //버킷안에 저장 될 폴더와 파일이름
	
		/*String downFileName = "C:/Temp/auctionImg/"+folderName+"/"+fileName; 다운로드 받을 폴더와 파일명 <- 이게 filePathName이다
		filePathNameArray.length가 3이하일 때 넘겨받아서 실행되는 건 DELETE_FOLDER 밖에 없다
		그 외는 전부 3이상의 filePathName을 가진다
		*/
		switch(status) {
		case FILEDOWN :
			//파일 다운로드
			System.out.println("AuctionFileS3Controll FILEDOWN에서 bucketKey:"+bucketKey+" ,filePathName:"+filePathName);
			S3Object s3Object = s3Client.getObject(new GetObjectRequest(bucketName, bucketKey));
			S3ObjectInputStream inputStream = s3Object.getObjectContent();
			FileUtils.copyInputStreamToFile(inputStream, new File(filePathName));
			break;
		case INSERT :
			//s3에 입력
			System.out.println("AuctionFileS3Controll INSERT에서 bucketKey:"+bucketKey+" ,filePathName:"+filePathName);
			s3Client.putObject(bucketName,bucketKey,new File(filePathName));
			break;
		case DELETE_FILE :
			System.out.println("AuctionFileS3Controll DELETE_FILE에서 bucketKey:"+bucketKey+" ,filePathName:"+filePathName);
			s3Client.deleteObject(new DeleteObjectRequest(bucketName, bucketKey));
			break;
		}
	}
}
