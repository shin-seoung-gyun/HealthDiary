package diary;


public class DiaryListVO {// ���ڷ� �˻��ؼ� ���� ����� ����� ����, ���ڸ� �ű�� ������
	private String title;
	private String contents;
	private String date;
	private String conditions;
	private int no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getConditions() {
		return conditions;
	}
	public void setConditions(String conditions) {
		this.conditions = conditions;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "DiaryListVO [title=" + title + ", contents=" + contents + "]";
	}
	
	
}
