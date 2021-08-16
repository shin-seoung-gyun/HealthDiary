package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.ProcessBuilder.Redirect;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import diary.DiaryDAOImpl;
import diary.DiaryListVO;
import diary.NameVO;
import diary.PageVO;

@WebServlet("*.do")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public controller() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doWork(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doWork(request, response);
	}

	protected void doWork(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		System.out.println("요청action은:" + action);
		request.setCharacterEncoding("utf-8");

		if (action.equals("write.do")) {// 일기 등록
			// 전송된 값 읽기 등록
			DiaryListVO vo = new DiaryListVO();
			vo.setTitle(request.getParameter("title"));
			vo.setContents(request.getParameter("contents"));
			// 등록
			DiaryDAOImpl dd = new DiaryDAOImpl();
			dd.insert(vo);
			// 다시 등록화면
			response.sendRedirect("diary.jsp");
			
		}else if (action.equals("main.do")) {//일기 리스트 가져오기
			DiaryDAOImpl dd = new DiaryDAOImpl();
			int page=1;
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				if(page<1){
					page=1;
				}
			}
			PageVO pvo = new PageVO(page, dd.total());
			
			request.setAttribute("list", dd.search(page));
			request.setAttribute("total", dd.total());
			request.setAttribute("page", pvo);
			System.out.println(pvo.getEndPage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
			dispatcher.forward(request, response);
			
		}else if (action.equals("search2.do")) {//날자 시간으로 내용까지 가져오기-수정 예정
			DiaryDAOImpl dd = new DiaryDAOImpl();
			DiaryListVO vo = new DiaryListVO();
			
			request.setAttribute("list", dd.searchDateTime(vo));
			RequestDispatcher dispatcher = request.getRequestDispatcher("search2.jsp");
			dispatcher.forward(request, response);
			
		}else if (action.equals("delete.do")) {// 삭제하기-수정예정
			DiaryDAOImpl dd = new DiaryDAOImpl();
			DiaryListVO vo = new DiaryListVO();
			
			dd.delete(vo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.forward(request, response);
		}else if (action.equals("update.do")) {// 수정하는 매서드 - 수정예정
			DiaryListVO vo = new DiaryListVO();
			vo.setTitle(request.getParameter("title"));
			
			vo.setContents(request.getParameter("contents"));
			System.out.println(vo.getDate());
			// 등록
			DiaryDAOImpl dd = new DiaryDAOImpl();
			dd.update(vo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("search2.do");
			dispatcher.forward(request, response);
		}else if (action.equals("findexercise.do")) {//유사운동 찾는 jsp 외부 restapi사용
//			request.setCharacterEncoding("utf-8");
//	        response.setContentType("text/html; charset=utf-8");
//			String exercisename = request.getParameter("exercisename");
//			String addr = "http://192.168.0.89:8082/exercise/";
//			addr = addr + exercisename;
//			URL url = new URL(addr);
//			 
//		        HttpURLConnection con = (HttpURLConnection) url.openConnection();
//		        con.setRequestMethod("GET"); //기본적으로 조회 시 사용되는 GET
//
//		        int status = con.getResponseCode();
//		        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
//		        List<NameVO> nameList = new ArrayList<NameVO>();
//		        NameVO nvo = new NameVO();
//		        String re;
//		        
//		        while((re = in.readLine()) != null) 
//		        	nvo.setName(re);
//		        	nameList.add(nvo);
//		        
//		        in.close();
//		        con.disconnect();
//		        
//		        System.out.println("Response status: " + status);
//		        System.out.println(nameList.toString());
	        
	        
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("exercise.jsp");
			dispatcher.forward(request, response);
			
		}
			
			
			
			
			
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
