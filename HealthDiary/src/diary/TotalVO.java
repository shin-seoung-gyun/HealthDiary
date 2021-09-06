package diary;

public class TotalVO {
	private int total;
	private int exerciseTotal;
	private int exercistListTotal;

	@Override
	public String toString() {
		return "TotalVO [total=" + total + ", exerciseTotal=" + exerciseTotal + ", exercistListTotal="
				+ exercistListTotal + "]";
	}

	public int getExercistListTotal() {
		return exercistListTotal;
	}

	public void setExercistListTotal(int exercistListTotal) {
		this.exercistListTotal = exercistListTotal;
	}

	public int getExerciseTotal() {
		return exerciseTotal;
	}

	public void setExerciseTotal(int exerciseTotal) {
		this.exerciseTotal = exerciseTotal;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
}
