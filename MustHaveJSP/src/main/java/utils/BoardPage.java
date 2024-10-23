package utils;

public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
		String pagingStr = "";
		
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
		//pageTemp: 현재 페이지가 속한 블록의 첫 페이지를 계산
		int pageTemp = (((pageNum -1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
						 + "'>[이전 블록]</a>";
		}
		
		int blockCount = 1;
		//blockCount <= blockPage: 한 블록에 표시할 페이지 번호의 개수가 blockPage를 넘지 않도록 제한
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
						 + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		if (pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
						 + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
						 + "'>[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}
}
