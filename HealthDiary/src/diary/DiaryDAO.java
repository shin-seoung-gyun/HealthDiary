package diary;

import java.util.List;

public interface DiaryDAO {

	List<DiaryListVO> search();//전체검색
	
	DiaryListVO searchDateTime(DiaryListVO vo); //��¥,�ð��� �Է¹޾� �˻��ϴ� �ż���
	
	void update(DiaryListVO vo);//�˻��� �� ������ ������ db�� ������ �ż���
	
	void delete(DiaryListVO vo);//�˻��� �� �����ϴ�  �ż���
	
	void insert(DiaryListVO vo);//����
	
}



