package com.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class BoardDAO {
	private Connection conn=DBConn.getConnection();
	
	// 데이터 추가
	public int insertBoard(BoardDTO dto) {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("INSERT INTO ALLAMLIST(ALNUM, ALSUBJECT, ALCONTENT) ");
			sb.append(" VALUES (ALLAMLIST_seq.NEXTVAL, ?, ?)");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		
		return result;
	}
	// 데이터 개수
	public int dataCount() {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT NVL(COUNT(*), 0) FROM bbs";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
	}

	// 검색에서의 데이터 개수
	public int dataCount(String searchKey, String searchValue) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = null;
		
		try {
			//날짜 검색
			if(searchKey.equals("created")) {
				searchValue=searchValue.replaceAll("-", "");
				sql+="  WHERE TO_CHAR(created, 'YYYYMMDD') = ? ";
			//내용 검색
			} else{
				sql+="  WHERE INSTR(" + searchKey+ ", ?) >= 1 ";
			}
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
	}
	
	// 게시물 리스트
	public List<BoardDTO> listBoard(int start, int end) {
		List<BoardDTO> list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("        SELECT num, userName, SUBJECT ,TO_CHAR(created, 'YYYY-MM-DD') created");
			sb.append("            ,hitCount");
			sb.append("	       ORDER BY num DESC");
			sb.append("    ) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return list;
	}
	
	// 검색에서의 게시물 리스트
	public List<BoardDTO> listBoard(int start, int end, String searchKey, String searchValue) {
		List<BoardDTO> list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("        SELECT NUM, userName, SUBJECT");
			sb.append("            ,TO_CHAR(created, 'YYYY-MM-DD') created, hitCount");
			
			
			if(searchKey.equals("created")) {
				searchValue=searchValue.replaceAll("-", "");
				sb.append("        WHERE TO_CHAR(created, 'YYYYMMDD') = ?  ");
			} else {
				sb.append("        WHERE INSTR(" + searchKey + ", ?) >= 1 ");
			}
			sb.append("	       ORDER BY num DESC");
			sb.append("    ) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return list;
	}
	
	// 조회수 증가하기
	public int updateHitCount(int num)  {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql="UPDATE ALLAMLIST SET hitCount=hitCount+1  WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		
		return result;
	}
	
	// 해당 게시물 보기
	public BoardDTO readBoard(int num) {
		BoardDTO dto=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT num, userName, subject, content");
			sb.append("   ,created, hitCount ");
			sb.append("   WHERE num = ? ");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, num);

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return dto;
	}
	
    // 이전글
    public BoardDTO preReadBoard(int num, String searchKey, String searchValue) {
        BoardDTO dto=null;

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        StringBuffer sb = new StringBuffer();

        try {
            if(searchValue!=null && searchValue.length() != 0) {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs b JOIN member1 m ON b.userId=m.userId ");
                if(searchKey.equals("userName")) {
                	sb.append("     WHERE (INSTR(userName, ?) = 1)  ");
                } else if(searchKey.equals("created")) {
                	searchValue=searchValue.replaceAll("-", "");
                	sb.append("     WHERE (TO_CHAR(created, 'YYYYMMDD') = ?) ");
                } else {
                	sb.append("     WHERE (INSTR(" + searchKey + ", ?) >= 1) ");
                }
                sb.append("         AND (num > ? ) ");
                sb.append("         ORDER BY num ASC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setString(1, searchValue);
                pstmt.setInt(2, num);
			} else {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs b JOIN member1 m ON b.userId=m.userId ");
                sb.append("     WHERE num > ? ");
                sb.append("         ORDER BY num ASC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setInt(1, num);
			}

            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto=new BoardDTO();
                dto.setNum(rs.getInt("num"));
                dto.setSubject(rs.getString("subject"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
    
        return dto;
    }

    // 다음글
    public BoardDTO nextReadBoard(int num, String searchKey, String searchValue) {
        BoardDTO dto=null;

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        StringBuffer sb = new StringBuffer();

        try {
            if(searchValue!=null && searchValue.length() != 0) {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs b JOIN member1 m ON b.userId=m.userId ");
                if(searchKey.equals("userName")) {
                	sb.append("     WHERE (INSTR(userName, ?) = 1)  ");
                } else if(searchKey.equals("created")) {
                	searchValue=searchValue.replaceAll("-", "");
                	sb.append("     WHERE (TO_CHAR(created, 'YYYYMMDD') = ?) ");
                } else {
                	sb.append("     WHERE (INSTR(" + searchKey + ", ?) >= 1) ");
                }
                sb.append("         AND (num < ? ) ");
                sb.append("         ORDER BY num DESC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setString(1, searchValue);
                pstmt.setInt(2, num);
			} else {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs b JOIN member1 m ON b.userId=m.userId ");
                sb.append("     WHERE num < ? ");
                sb.append("         ORDER BY num DESC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setInt(1, num);
            }

            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto=new BoardDTO();
                dto.setNum(rs.getInt("num"));
                dto.setSubject(rs.getString("subject"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}

        return dto;
    }
	
	// 게시물 수정
	public int updateBoard(BoardDTO dto, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql="UPDATE bbs SET subject=?, content=? WHERE num=? AND userId=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, userId);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}		
		return result;
	}
	
	// 게시물 삭제
	public int deleteBoard(int num, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			if(userId.equals("admin")) {
				sql="DELETE FROM bbs WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
			}else {
				sql="DELETE FROM bbs WHERE num=? AND userId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, userId);
				result = pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}		
		return result;
	}
	
	// 게시물의 공감 추가
	public int insertLikeBoard(int num, String userId) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql="INSERT INTO bbsLike(num, userId) VALUES (?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}		
		return result;
	}
	
	// 게시물의 공감 개수
	public int countLikeBoard(int num) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT NVL(COUNT(*), 0) FROM bbsLike WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
	}

	// 게시물의 댓글 및 답글 추가
	public int insertReply(ReplyDTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("INSERT INTO bbsReply(replyNum, num, userId, content, answer) ");
			sb.append(" VALUES (bbsReply_seq.NEXTVAL, ?, ?, ?, ?)");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getAnswer());
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		
		return result;
	}

	// 게시물의 댓글 개수
	public int dataCountReply(int num) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT NVL(COUNT(*), 0) FROM bbsReply WHERE num=? AND answer=0";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
	}

	// 게시물 댓글 리스트
	public List<ReplyDTO> listReply(int num, int start, int end) {
		List<ReplyDTO> list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("        SELECT tbreply.replyNum, num, userId, userName, content");
			sb.append("            ,created, tbreply.answer");
			sb.append("            ,NVL(answerCount, 0) answerCount");
			sb.append("            ,NVL(likeCount, 0) likeCount");
			sb.append("            ,NVL(disLikeCount, 0) disLikeCount");
			sb.append("            FROM");
			sb.append("            (      ");
			sb.append("                (  ");
			sb.append("                    SELECT replyNum, r.num, r.userId, userName, r.content, r.created, answer  ");
			sb.append("                        FROM bbsReply r   ");
			sb.append("                        JOIN bbs b ON r.num=b.num  ");
			sb.append("                        JOIN member1 m ON r.userId=m.userId  ");
			sb.append("                        WHERE r.num=? AND answer=0  ");
			sb.append("                ) tbreply  ");
			sb.append("                LEFT OUTER JOIN  ");
			sb.append("                (   ");
			sb.append("                    SELECT answer, COUNT(*) answerCount  ");
			sb.append("                       FROM bbsReply GROUP BY answer  ");
			sb.append("                 ) tbanswer ON tbreply.replyNum = tbanswer.answer  ");
			sb.append("                LEFT OUTER JOIN  ");
			sb.append("                (   ");
			sb.append("                    SELECT replyNum,   ");
			sb.append("                                COUNT(DECODE(replyLike, 1, 1)) likeCount,  ");
			sb.append("                                COUNT(DECODE(replyLike, 0, 1)) disLikeCount  ");
			sb.append("                       FROM bbsReplyLike GROUP BY replyNum  ");
			sb.append("                 ) tblike ON tbreply.replyNum = tblike.replyNum  ");
			sb.append("            )    ");
			sb.append("	         ORDER BY replyNum DESC");
			sb.append("    ) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto=new ReplyDTO();
				
				dto.setReplyNum(rs.getInt("replyNum"));
				dto.setNum(rs.getInt("num"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				dto.setAnswer(rs.getInt("answer"));
				dto.setAnswerCount(rs.getInt("answerCount"));
				dto.setLikeCount(rs.getInt("likeCount"));
				dto.setDisLikeCount(rs.getInt("disLikeCount"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return list;
	}

	// 게시물의 댓글 삭제
	public int deleteReply(int replyNum, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql="DELETE FROM bbsReply ";
		sql+="  WHERE replyNum IN  ";
		sql+="  (SELECT replyNum FROM bbsReply START WITH replyNum = ?";
		sql+="    CONNECT BY PRIOR replyNum = answer)";
		if(! userId.equals("admin"))
			sql+=" AND userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNum);
			if(! userId.equals("admin"))
				pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}		
		return result;
	}

	// 댓글의 답글 리스트
	public List<ReplyDTO> listReplyAnswer(int answer) {
		List<ReplyDTO> list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT replyNum, num, tbreply.userId, userName, content, created, answer");
			sb.append("    FROM bbsReply tbreply ");
			sb.append("    JOIN member1 m ON tbreply.userId=m.userId");
			sb.append("    WHERE answer=?");
			sb.append("    ORDER BY replyNum DESC");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, answer);

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto=new ReplyDTO();
				
				dto.setReplyNum(rs.getInt("replyNum"));
				dto.setNum(rs.getInt("num"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				dto.setAnswer(rs.getInt("answer"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return list;
	}
	
	// 댓글의 답글 개수
	public int dataCountReplyAnswer(int answer) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT NVL(COUNT(*), 0) FROM bbsReply WHERE answer=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, answer);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
	}

	// 댓글의 답글 삭제
	public int deleteReplyAnswer(int replyNum, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql="DELETE FROM bbsReply WHERE replyNum=?";
		if(! userId.equals("admin"))
			sql+=" AND userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNum);
			if(! userId.equals("admin"))
				pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}		
		return result;
	}
}
