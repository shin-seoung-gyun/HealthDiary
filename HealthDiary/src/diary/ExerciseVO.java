package diary;

public class ExerciseVO {
	private int eno;
	private String emethod;
	private String ename;
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	@Override
	public String toString() {
		return "ExerciseVO [eno=" + eno + ", emethod=" + emethod + ", ename=" + ename + "]";
	}
	public String getEmethod() {
		return emethod;
	}
	public void setEmethod(String emethod) {
		this.emethod = emethod;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
}
