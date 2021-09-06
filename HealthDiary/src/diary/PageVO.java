package diary;

public class PageVO {
	private int page;
	private int startPage;
	private int endPage;
	private boolean prev,next;
	

	private int amount = 10;
	
	public int getAmount() {
		return amount;
	}
	public int getPage() {
		return page;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	
	public PageVO(int page, TotalVO tvo) {
		if(tvo.getTotal()!=0) {
			this.page = page;
			endPage = (int)(Math.ceil(page/10.0)*10);//Math.ceil 올림 함수
			startPage = endPage-9;
			
			int realEnd = (int)Math.ceil((double)tvo.getTotal()/amount);//실제 끝페이지
			if(realEnd<endPage) {
				endPage = realEnd;
			}
			prev = startPage >1;
			next = endPage<realEnd;
		} else {
			this.page = page;
			endPage = (int)(Math.ceil(page/10.0)*10);//Math.ceil 올림 함수
			startPage = endPage-9;
			
			int realEnd = (int)Math.ceil((double)tvo.getExercistListTotal()/amount);//실제 끝페이지
			if(realEnd<endPage) {
				endPage = realEnd;
			}
			prev = startPage >1;
			next = endPage<realEnd;
		}
		
	}
	
	
	
	
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev
				+ ", next=" + next + ", amount=" + amount + "]";
	}
	
	
	
	
	
	
	
	
	
}
