package diary;

import java.util.List;

public interface DiaryDAO {

	List<DiaryListVO> search(int page);//전체검색
	
	DiaryListVO searchNoList(DiaryListVO vo); //��¥,�ð��� �Է¹޾� �˻��ϴ� �ż���
	
	void update(DiaryListVO vo);//�˻��� �� ������ ������ db�� ������ �ż���
	
	void delete(DiaryListVO vo);//�˻��� �� �����ϴ�  �ż���
	
	void insert(DiaryListVO vo);//����
	
	TotalVO total();//일기 총 갯수
	
}



