package member;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

		private static final String PREFIX_URL = "C:\\Users\\JHTA\\eclipse-workspace2\\1903_final\\WebContent\\upload/";
		
		
		//파일 저장
		public String restore(MultipartFile multipartFile) {
			String url = null;
			
			try {
				// 파일 정보
				String originFilename = multipartFile.getOriginalFilename();
				String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				// 서버에서 저장 할 파일 이름
				String hPhoto = "";
				UUID uuid = UUID.randomUUID();
				hPhoto += uuid.toString();
				hPhoto += extName;
				
				//실제 데이터 저장 로직
				byte[] data = multipartFile.getBytes();
				FileOutputStream fos = new FileOutputStream(PREFIX_URL + hPhoto);
				fos.write(data);
				fos.close();
				url = hPhoto;
			}
			catch (IOException e) {
				throw new RuntimeException(e);
			}
			return url;
		}
		
		//파일 삭제
		public boolean delFile(String fileName) {
			boolean b = false;
			
			File file = new File(PREFIX_URL + fileName);
			if(fileName != null) {
				file.delete();
				b = true;
			}
			
			return b;
		}
}
