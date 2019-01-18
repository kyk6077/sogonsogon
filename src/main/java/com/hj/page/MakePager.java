package com.hj.page;


public class MakePager {
	private int curPage;
	private int perPage;
	private RowNumber rowNumber;
	private String search;
	private String kind;
	
	public MakePager(int curPage, String search, String kind) {
		this.curPage = curPage;
		this.perPage = 5;
		this.search = search;
		this.kind = kind;
	}
	
	public MakePager(int curPage, int perPage, String search, String kind) {
		this.curPage = curPage;
		this.perPage = perPage;
		this.search = search;
		this.kind = kind;
	}
	
	//DB 검색 조건
	public RowNumber MakeRow() {
		rowNumber = new RowNumber();
		if(this.kind.equals("")||this.kind==null) {
			kind="contents";
		}
		rowNumber.setKind(this.kind);
		if(this.search==null) {
			this.search ="";
		}
		rowNumber.setSearch(this.search);
		rowNumber.setStartRow((this.curPage-1)*this.perPage+1);
		rowNumber.setLastRow(this.curPage*this.perPage);
		return rowNumber;
	}
	
	//화면에서 페이지처리용
	public Pager MakePage(int totalCount) {
		Pager pager = new Pager();
		//1. totalPage
		int totalPage = totalCount/this.perPage;
		if(totalCount%this.perPage > 0) {
			totalPage++;
		}
		//2. totalblock
		int perBlock = 3;
		int totalBlock = totalPage/perBlock;
		if(totalPage%perBlock > 0) {
			totalBlock++;
		}
		//3. curblock
		int curBlock = this.curPage/perBlock;
		if(this.curPage%perBlock > 0) {
			curBlock += 1;
		}
	
		//4. startNum lastNum
		int startNum = (curBlock-1)*perBlock+1;
		int lastNum = curBlock*perBlock;
		
		//5. 마지막블럭일때
		if(curBlock >= totalBlock) {
			lastNum = totalPage;
		}
		
		
		
		pager.setKind(this.kind);
		pager.setSearch(this.search);
		pager.setStartNum(startNum);
		pager.setLastNum(lastNum);
		pager.setTotalBlock(totalBlock);
		pager.setCurBlock(curBlock);
		pager.setTotalPage(totalPage);
		
		
		return pager;
	}
	
}

