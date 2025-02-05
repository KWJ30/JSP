package model1.board;

import jakarta.servlet.ServletContext;
import common.JDBConnect;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM board";
		if (map.get("searchWord") != null) {
			if ("both".equals(map.get("searchField"))) {
	            query += " WHERE title LIKE '%" + map.get("searchWord") + "%' OR content LIKE '%" + map.get("searchWord") + "%'";
	        } else {
	            query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
	        }
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM board ";
		if (map.get("searchWord") != null) {
			
			if (map.get("searchField").equals("both")) {
	            query += " WHERE title LIKE '%" + map.get("searchWord") + "%' OR content LIKE '%" + map.get("searchWord") + "%'";
	        }
			else {
			query += " WHERE " + map.get("searchField") +" "
					+ " LIKE '%" + map.get("searchWord") + "%'"; }
		} 
		query += " ORDER BY num DESC ";
		//System.out.println("query: "+ query);
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM ( "
					 + "	SELECT Tb.*, ROWNUM rNum FROM ( "
					 + "		SELECT * FROM board ";
		
		if (map.get("searchWord") != null) {
			
			if (map.get("searchField").equals("both")) {
	            query += " WHERE title LIKE '%" + map.get("searchWord") + "%' OR content LIKE '%" + map.get("searchWord") + "%'";
	        }
			else {
			query += " WHERE " + map.get("searchField") +" "
					+ " LIKE '%" + map.get("searchWord") + "%'"; }
		} 
		query += " ORDER BY num DESC "
			   + " ) Tb "
			   + " ) "
			   + " WHERE rNum BETWEEN ? AND ?";
		//System.out.println("query: "+ query);
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			
			String query = "INSERT INTO board ( "
						+ " num, title, content, id, visitcount) "
						+ " VALUES ( "
						+ "seq_board_num.NEXTVAL, ?, ?, ?, 0)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
		    psmt.setString(3, dto.getId());
		    
		    result = psmt.executeUpdate();  //영향을 받은 행의수를 반환
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "SELECT B.*, M.name "
					 + " FROM member M INNER JOIN board B "
					 + " ON M.id=B.id "
					 + " WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
				//System.out.println("Num: " + rs.getString("num"));
			    //System.out.println("Name: " + rs.getString("name"));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		//System.out.println("query: "+ query);
		return dto;
	}
	
	public void updateVisitCount(String num) {
		String query = " UPDATE board SET "
					 + " visitcount = visitcount+1 "
					 + " WHERE num=? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
		  //psmt.executeQuery();  //영향을 받은 행의수를 알 필요없다면 update 를 쓰지 않아도 됨
			psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE board SET"
						 + " title=?, content=?"
						 + "WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "DELETE FROM board WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getNum());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}	
	