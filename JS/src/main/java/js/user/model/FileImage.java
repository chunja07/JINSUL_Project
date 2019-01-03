package js.user.model;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileImage {

	private MultipartFile file;



	public MultipartFile getFile() {
		return file;
	}



	public void setFile(MultipartFile file) {
		this.file = file;
	}



	public boolean fileImage(String path,String fileName) {

		System.out.println("접속완료1");
		boolean flag = true;
		File dir = new File(path);
		if (!dir.exists()) {
			System.out.println("새로운 폴더 생성");
			dir.mkdirs();
		}

		
		// 파일이 저장되는 방식		// Multipart로 파일 변경후 추가
		File fileStore = new File(dir, fileName);
		// input 에서 받아온 파일정보를 fileStore 형태로 (경로,파일이름)
		try {
			file.transferTo(fileStore);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}

		return flag;

	}

}
