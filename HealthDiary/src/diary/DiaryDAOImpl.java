package diary;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class DiaryDAOImpl extends DAOBase implements DiaryDAO {

	@Override
	public List<DiaryListVO> search(int page) {// 전체 리스트 받기
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		List<DiaryListVO> volist = new ArrayList<DiaryListVO>();// 받아온 데이터를 담을 객체
		try {
			stmt = conn.prepareStatement("select * from diary order by no desc limit ?,10");
			stmt.setInt(1, (page-1)*10);
			rs = stmt.executeQuery();
			while (rs.next()) {
				DiaryListVO dvo = new DiaryListVO();
				dvo.setNo(rs.getInt("no"));
				dvo.setTitle(rs.getString("title"));
				dvo.setDate(rs.getString("indate"));
				dvo.setConditions(rs.getString("conditions"));
				dvo.setExerciseVolume(rs.getInt("exercisevolume"));
				volist.add(dvo);
			}

			return volist;
		} catch (Exception e) {

		} finally {
			closeDBResources(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public DiaryListVO searchNoList(DiaryListVO vo) {// 일기 번호로 일기 내용까지 받기
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		DiaryListVO dvo = new DiaryListVO();
		try {
			stmt = conn.prepareStatement("select * from diary where no = ?");
			stmt.setInt(1, vo.getNo()); //날짜가 아닌 번호나 다른 것으로 검색하게 수정할 예정
			rs = stmt.executeQuery();
			rs.next();
			dvo.setNo(rs.getInt("no"));
			dvo.setTitle(rs.getString("title"));
			dvo.setContents(rs.getString("contents"));
			dvo.setDate(rs.getString("indate"));
			dvo.setConditions(rs.getString("conditions"));
			dvo.setExerciseVolume(rs.getInt("exercisevolume"));

			return dvo;
		} catch (Exception e) {

		} finally {
			closeDBResources(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public void update(DiaryListVO vo) {// 수정하는 매서드
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체

		try {
			stmt = conn.prepareStatement("UPDATE diary SET TITLE = ?, CONTENTS = ?,exercisevolume=?, conditions=?,indate=? WHERE no = ?");//수정예정
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContents());
			stmt.setInt(3, vo.getExerciseVolume());
			stmt.setString(4, vo.getConditions());
			stmt.setString(5, vo.getDate());
			stmt.setInt(6, vo.getNo());
			stmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			closeDBResources(null, stmt, conn);
		}

	}

	@Override
	public void delete(DiaryListVO vo) {// 삭제하는 매서드
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체

		try {
			stmt = conn.prepareStatement("delete from diary where no=?");//번호로 삭제
			stmt.setInt(1, vo.getNo()); 

			stmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			closeDBResources(null, stmt, conn);
		}
	}

	@Override
	public void insert(DiaryListVO vo) {//일기 새로 등록하는 매서드
		
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체

		try {
			stmt = conn.prepareStatement("INSERT INTO diary (`TITLE`,`CONTENTS`,`conditions`,`exercisevolume`) VALUES (?,?,?,?)");//등록
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContents());
			stmt.setString(3, vo.getConditions());
			stmt.setInt(4, vo.getExerciseVolume());
			stmt.executeUpdate();
			System.out.println("업로드완료");

		} catch (Exception e) {

		} finally {
			closeDBResources(null, stmt, conn);
		}
		
	}

	@Override
	public TotalVO total() {
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		try {
			stmt = conn.prepareStatement("select count(*) as total from diary");
			rs = stmt.executeQuery();
			TotalVO tvo = new TotalVO();
			rs.next();
			tvo.setTotal(rs.getInt("total"));
			return tvo;
		} catch (Exception e) {

		} finally {
			closeDBResources(rs, stmt, conn);
		}
		return null;
	
	}

	@Override
	public TotalVO exerciseTotal() {
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		try {
			stmt = conn.prepareStatement("select sum(exercisevolume) as exercisetotal from diary");
			rs = stmt.executeQuery();
			TotalVO tvo = new TotalVO();
			rs.next();
			tvo.setExerciseTotal(rs.getInt("exercisetotal"));
			return tvo;
		} catch (Exception e) {

		} finally {
			closeDBResources(rs, stmt, conn);
		}
		
		return null;
	}

	@Override
	public List<ExerciseVO> exerciseList(int page) {
		
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		List<ExerciseVO> exlist = new ArrayList<ExerciseVO>();// 받아온 데이터를 담을 객체
		try {
			stmt = conn.prepareStatement("select * from exercise order by eno limit ?,10");
			stmt.setInt(1, (page-1)*10);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ExerciseVO evo = new ExerciseVO();
				evo.setEno(rs.getInt("eno"));
				evo.setEmethod(rs.getString("emethod"));
				evo.setEname(rs.getString("ename"));
				
				exlist.add(evo);
			}

			return exlist;
		} catch (Exception e) {

		} finally {
			closeDBResources(rs, stmt, conn);
		}
		return null;
	
	}

	@Override
	public TotalVO exerciseListTotal() {
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		try {
			stmt = conn.prepareStatement("select count(*) as exlistcnt from exercise");
			rs = stmt.executeQuery();
			TotalVO tvo = new TotalVO();
			rs.next();
			tvo.setExercistListTotal(rs.getInt("exlistcnt"));
			return tvo;
		} catch (Exception e) {

		} finally {
			closeDBResources(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public ExerciseVO searchExercise(String exname) {
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		ExerciseVO evo = new ExerciseVO();
		try {
			stmt = conn.prepareStatement("select * from exercise where ename = ?");
			stmt.setString(1, exname); //날짜가 아닌 번호나 다른 것으로 검색하게 수정할 예정
			rs = stmt.executeQuery();
			rs.next();
			evo.setEno(rs.getInt("eno"));
			evo.setEmethod(rs.getString("emethod"));
			evo.setEname(rs.getString("ename"));
			
			return evo;
		} catch (Exception e) {

		} finally {
			closeDBResources(rs, stmt, conn);
		}
		
		return null;
	}

}
