package com.dogcompany.dogapp.web;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dogcompany.dogapp.service.AndroidService;

@RestController
public class AndroidController {
	@Autowired
	private AndroidService service;
	
	//안드로이드 앱에 데이터 제공용 추가 
	@CrossOrigin
	@GetMapping("/member")
	public Map join(@RequestParam Map map) {
		Map member = service.selectOneMember(map);
		
		if(member == null) {
			member = new HashMap();
		}
		else {
			if(Integer.parseInt(member.get("POWER").toString()) == 1 || 
					Integer.parseInt(member.get("POWER").toString()) == 3 || 
					Integer.parseInt(member.get("POWER").toString()) == 0)
				member.put("T_NO", -1);
				
		}
		
		return member;
	}
	@CrossOrigin
	@GetMapping("/care1")
	public List<Map> care1(@RequestParam Map map) {
		List<Map> listCare1 = service.selectListCare1();
		
		return listCare1;
	}
	@CrossOrigin
	@GetMapping("/care1/view")
	public Map care1View(@RequestParam Map map) {
		Map care1 = service.selectOneCare1(map);
		if(care1 == null) {
			care1 = new HashMap();
		}
		return care1;
	}
	@CrossOrigin
	@GetMapping("/chat")
	public List<Map> chat(@RequestParam Map map) {
		List<Map> cnoList = service.selectCnoList(map);
		List<Map> tnoList = service.selecttnoList(map);
		for(Map chat:tnoList) {
			cnoList.add(chat);
		}
		Collections.sort(cnoList, new Comparator<Map>() {
			@Override
			public int compare(Map o1, Map o2) {
				return Integer.parseInt(o2.get("CHAT_NO").toString()) - Integer.parseInt(o1.get("CHAT_NO").toString());
			}
		});
		return cnoList;
	}
	/*
	 * POST http://localhost:9090/member1
	 * :key = value의 형태로 전송
	 * :jackson-databind가 작동하지 않음
	 * 
	 * - form 태그를 이용해서 전송하거나
	 * - jQuery ajax로 전송시에는 data 속성에 key=value 형태로
	 * - postman으로 전송시에는 Body탭의 x-www-form-urlencoded 선택 후 key, value 입력
	 */
	/*
	@CrossOrigin
	@PostMapping(value="/member1", produces = "text/plain;charset=UTF-8")
	public String insert1(MemberDTO member) {
		int affected = dao.insert(member);
		if(affected == 1) return "(key=value데이터)1행이 입력되었습니다.";
		else return "(key=value데이터)입력을 실패하였습니다.";
		
	}
	*/
	/*
	 * POST http://localhost:9090/member2
	 * :json으로 데이터 받을 때
	 * :jackson-databind가 작동해서 json으로 받은 데이터를 DTO로 컨버팅
	 * 
	 * - jQuery ajax로 전송시에는 data 속성에 자바스크립트의 객체 형태로
	 * - postman으로 전송시에는 Body탭의 raw 선택 후 json 선택, json형태로 데이터 작성
	 */
	/*
	@PostMapping(value="/member2", produces = "text/plain;charset=UTF-8")
	public String insert2(@RequestBody MemberDTO member) {
		int affected = dao.insert(member);
		if(affected == 1) return "(json데이터)1행이 입력되었습니다.";
		else return "(json데이터)입력을 실패하였습니다.";
	}
	*/
	/*
	 * GET http://localhost:9090/members
	 * :JSON으로 반환
	 * :jackson-databind가 작동해서 DTO를 JSON으로 컨버팅해서 반환
	 * - form태그 혹은 a 태그
	 * - jQuery ajax
	 * - postman은 GET방식으로 요청
	 */
	/*
	@CrossOrigin
	@GetMapping("/members")
	public List<MemberDTO> selectList(){
		List<MemberDTO> members = dao.selectList();
		return members;
	}
	*/
	/*
	@CrossOrigin
	@GetMapping("/members/{username}")
	public MemberDTO selectOne(@PathVariable String username){
		MemberDTO member = dao.selectOne(username);
		return member;
	}
	*/
	//PUT이나 DELETE도 데이터는 요청바디에 싣는다
	//반드시 JSON으로 데이터 받을 때는 @RequestBody MemberDTO dto
	/*
	@CrossOrigin
	@PutMapping("/members/{username}")
	public MemberDTO update(@PathVariable String username, @RequestBody MemberDTO dto){
		dto.setUsername(username);
		dto.setPostdate(dao.selectOne(username).getPostdate());//날짜가 null 반환되지 않도록
		dao.update(dto);
		return dto;
	}
	*/
	/*
	@CrossOrigin
	@DeleteMapping("/members/{username}")
	public MemberDTO delete(@PathVariable String username){
		//삭제 전 반환할 DTO 얻기
		MemberDTO dto = dao.selectOne(username);
		dao.delete(username);
		
		return dto;
	}
	*/
	/*
	@CrossOrigin
	@PostMapping(value = "/file", produces = "text/plain;charset=UTF-8")
	public String upload(@RequestPart MultipartFile attachFile, HttpServletRequest req) throws IllegalStateException, IOException {
		//서버의 물리적 경로 얻기
		String path = req.getSession().getServletContext().getRealPath("/uploads");
		//File 객체 생성
		File file = new File(path+File.separator+attachFile.getOriginalFilename());
		//업로드
		attachFile.transferTo(file);
		
		System.out.println("1111111111:"+req.getParameter("title"));
		return "파일 업로드 성공";
	}
	*/
	

	/*
	@CrossOrigin
	@PostMapping("/member/join")
	public MemberDTO joinPost(@RequestParam Map map) {
		MemberDTO dto = dao.join(map);
		if(dto == null) {
			dto = new MemberDTO(null,null,null,null);
		}
		return dto;
	}
	*/
	/*
	@CrossOrigin
	@GetMapping("/photos")
	public List<PhotoDTO> photos(){
		//데이터 베이스 연동하지 않고 하드 코딩하자
		List<PhotoDTO> photos = new Vector<PhotoDTO>();
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/92c952.png", "1번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/154612.png", "2번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/861234.png", "3번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/134685.png", "4번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/643152.png", "5번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/212523.png", "6번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/559977.png", "7번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/778899.png", "8번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/4a1b25.png", "9번째 이미지"));
		photos.add(new PhotoDTO("http://192.168.0.33:9090/uploads/1a2a36.png", "10번째 이미지"));
		return photos;
	}
	*/
	/*
	@CrossOrigin
	@PostMapping(value = "/photo/upload",produces = "text/plain;charset=UTF-8" )
	public String upload_photo(@RequestPart MultipartFile attachFile, HttpServletRequest req) throws IllegalStateException, IOException {
		//서버의 물리적 경로 얻기
		String path = req.getSession().getServletContext().getRealPath("/uploads");
		//File 객체 생성
		File file = new File(path+File.separator+attachFile.getOriginalFilename());
		//업로드
		attachFile.transferTo(file);
		
		System.out.println("기타 파라미터 받기:"+req.getParameter("title"));
		return "파일 업로드 성공";
	}
	*/
}
