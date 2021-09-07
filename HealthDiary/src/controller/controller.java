package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
			vo.setConditions(request.getParameter("conditions"));
			vo.setExerciseVolume(Integer.parseInt(request.getParameter("exercisevolume")));
			
			// 등록
			DiaryDAOImpl dd = new DiaryDAOImpl();
			dd.insert(vo);
			// 다시 등록화면
			response.sendRedirect("main.do");
		} else if (action.equals("diary.do")) {
			
			response.sendRedirect("diary.jsp");
			
		} else if (action.equals("main.do")) {//일기 리스트 가져오기
			DiaryDAOImpl dd = new DiaryDAOImpl();
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				if (page < 1) {
					page = 1;
				}
			}
			PageVO pvo = new PageVO(page, dd.total());

			request.setAttribute("list", dd.search(page));
			request.setAttribute("total", dd.total());
			request.setAttribute("extotal", dd.exerciseTotal());
			request.setAttribute("page", pvo);
			System.out.println(pvo.getEndPage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
			dispatcher.forward(request, response);

		} else if (action.equals("search.do")) {// 일기번호로 내용까지 가져오기-수정 예정
			DiaryDAOImpl dd = new DiaryDAOImpl();
			DiaryListVO vo = new DiaryListVO();
			int a = Integer.parseInt(request.getParameter("no"));
			System.out.println(a);
			vo.setNo(a);
			
			request.setAttribute("list", dd.searchNoList(vo));
			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.forward(request, response);

		} else if (action.equals("delete.do")) {// 삭제하기
			DiaryDAOImpl dd = new DiaryDAOImpl();
			DiaryListVO vo = new DiaryListVO();
			vo.setNo(Integer.parseInt(request.getParameter("no")));

			dd.delete(vo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.do");
			dispatcher.forward(request, response);
		} else if (action.equals("update.do")) {// 수정하는 매서드
			DiaryListVO vo = new DiaryListVO();
			vo.setTitle(request.getParameter("title"));
			vo.setExerciseVolume(Integer.parseInt(request.getParameter("exercisevolume")));
			vo.setContents(request.getParameter("contents"));
			vo.setConditions(request.getParameter("conditions"));
			vo.setNo(Integer.parseInt(request.getParameter("no")));
			vo.setDate(request.getParameter("date"));
			System.out.println(vo.getDate());
			// 등록
			DiaryDAOImpl dd = new DiaryDAOImpl();
			dd.update(vo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.do");
			dispatcher.forward(request, response);
		} else if (action.equals("updatepage.do")) {
			DiaryListVO vo = new DiaryListVO();
			vo.setNo(Integer.parseInt(request.getParameter("no")));
			vo.setDate(request.getParameter("date"));
			
			request.setAttribute("list", vo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("updatepage.jsp");
			dispatcher.forward(request, response);
		
		}  else if (action.equals("findexercise.do")) {// 유사운동 찾는 jsp 외부 restapi사용
			if(request.getParameter("exercisename")!=null) {
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				
				String exercisename = request.getParameter("exercisename");// url인코딩해야함
				String exName = URLEncoder.encode(exercisename, "UTF-8").replace("+", "%20");
				System.out.println(exName);
				String addr = "http://192.168.0.89:8082/exercise/";
				addr = addr + exName;
				URL url = new URL(addr);

				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET"); // 기본적으로 조회 시 사용되는 GET

				int status = con.getResponseCode();
				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				
				Gson gson = new Gson();
				
				String re = in.readLine();
				System.out.println(re);
				NameVO[] nvo  =gson.fromJson(re, NameVO[].class);
				
				for(NameVO temp: nvo) {
					System.out.println("받아온값"+temp);
				}
				
				in.close();
				con.disconnect();
				
				System.out.println("Response status: " + status);
				
				request.setAttribute("nvo", nvo);
			} 
			DiaryDAOImpl dd = new DiaryDAOImpl();
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				if (page < 1) {
					page = 1;
				}
			}
			
			PageVO pvo = new PageVO(page, dd.exerciseListTotal());
			System.out.println("페이지 관련 데이터"+pvo);
			System.out.println("가져온 데이터 개수"+dd.exerciseListTotal());
			request.setAttribute("exlist", dd.exerciseList(page));
			request.setAttribute("page", pvo);
			request.setAttribute("total", dd.exerciseListTotal());
			RequestDispatcher dispatcher = request.getRequestDispatcher("exercise.jsp");
			dispatcher.forward(request, response);

		} else if (action.equals("searchexercise.do")) {
			DiaryDAOImpl dd = new DiaryDAOImpl();
			String exname = request.getParameter("exname");
			request.setAttribute("exercise", dd.searchExercise(exname));
			System.out.println(dd.searchExercise(exname));
			RequestDispatcher dispatcher = request.getRequestDispatcher("searchexercise.jsp");
			dispatcher.forward(request, response);
		}

	}

}
