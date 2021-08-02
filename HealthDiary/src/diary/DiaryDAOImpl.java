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
	public DiaryListVO searchDateTime(DiaryListVO vo) {// 날자 시간으로 일기 내용까지 받기
		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체
		ResultSet rs = null;// 결과값 받는 객체
		DiaryListVO dvo = new DiaryListVO();
		try {
			stmt = conn.prepareStatement("select * from diary where indate = ?");
//			stmt.setDate(1, vo.getDate()); 날짜가 아닌 번호나 다른 것으로 검색하게 수정할 예정
			rs = stmt.executeQuery();
			rs.next();
			dvo.setTitle(rs.getString("title"));
			dvo.setContents(rs.getString("contents"));
			dvo.setDate(rs.getString("indate"));

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
			stmt = conn.prepareStatement("UPDATE DIARY SET TITLE = ?, CONTENTS = ? WHERE ??");//수정예정
			
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContents());
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
			stmt = conn.prepareStatement("delete from diary where indate=?");//여기도 수정
//			stmt.setDate(1, vo.getDate()); 번호로 삭제할 예정

			stmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			closeDBResources(null, stmt, conn);
		}
	}

	@Override
	public void insert(DiaryListVO vo) {//일기 새로 등록하는 매서드
		// TODO Auto-generated method stub

		Connection conn = getConnection();// db연결
		PreparedStatement stmt = null; // 쿼리 보내는 객체

		try {
			stmt = conn.prepareStatement("INSERT INTO diary (`TITLE`,`CONTENTS`) VALUES (?,?)");
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContents());
			stmt.executeUpdate();

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

}
