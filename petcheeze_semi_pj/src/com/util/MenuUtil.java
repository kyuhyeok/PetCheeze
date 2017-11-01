package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MenuUtil {
	// 총페이지 수
	public int pageCount(int numPerPage, int dataCount) {
		int pageCount=0;
		
		if(dataCount > 0) {
			if(dataCount % numPerPage == 0)
				pageCount=dataCount/numPerPage;
			else
				pageCount=dataCount/numPerPage+1;
		}
		
		return pageCount;
	}
	
	// 페이징 처리
	public String paging(int current_page, int total_page, String list_url) {
		StringBuffer sb=new StringBuffer();
		
		int numPerBlock=16;
		int currentPageSetup;
		int n, page;
		
		if(current_page<1 || total_page < 1)
			return "";
		
		list_url+="&";
		
		// currentPageSetup : 표시할첫페이지-1
		currentPageSetup=(current_page/numPerBlock)*numPerBlock;
		if(current_page%numPerBlock==0)
			currentPageSetup=currentPageSetup-numPerBlock;
		
		// 처음페이지
		if(current_page > 1) {
			sb.append("<ol><li><a href='"+list_url+"page=1'>처음</a></li></ol>");
		}
		
		// 이전(16페이지 전)
		n=current_page-numPerBlock;
		if(total_page > numPerBlock && currentPageSetup > 0) {
			sb.append("<ol><li><a href='"+list_url+"page="+n+"'>이전</a></li></ol>");
		}
		
		// 바로가기
		page=currentPageSetup+1;
		while(page<=total_page && page <=(currentPageSetup+numPerBlock)) {
			if(page==current_page) {
				sb.append("<ol><li><a href='#'>"+page+"</a></li></ol>");
			} else {
				sb.append("<ol><li><a href='"+list_url+"page="+page+"'>"+page+"</a></li></ol>");
			}
			page++;
		}
		
		// 다음(16페이지 후)
		n=current_page+numPerBlock;
		if(n>total_page) n=total_page;
		if(total_page-currentPageSetup>numPerBlock) {
			sb.append("<ol><li><a href='"+list_url+"page="+n+"'>다음</a></li></ol>");
		}
		
		// 마지막페이지
		if(current_page<total_page) {
			sb.append("<ol><li><a href='"+list_url+"page="+total_page+"'>다음</a></li></ol>");
		}
	
		return sb.toString();
	}
    
    // 특수문자를 HTML 문자로 변경
	public String escape(String str) {
		if(str==null||str.length()==0)
			return "";
		
		StringBuilder builder = new StringBuilder((int)(str.length() * 1.2f));

		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);
			switch (c) {
			case '<':
				builder.append("&lt;");
				break;
			case '>':
				builder.append("&gt;");
				break;
			case '&':
				builder.append("&amp;");
				break;
			case '\"':
				builder.append("&quot;");
				break;
			default:
				builder.append(c);
			}
		}
		return builder.toString();
	}

    // 특수문자를 HTML 문자로 변경 및 엔터를 <br>로 변경 
     public String htmlSymbols(String str) {
		if(str==null||str.length()==0)
			return "";

    	 str=str.replaceAll("&", "&amp;");
    	 str=str.replaceAll("\"", "&quot;");
    	 str=str.replaceAll(">", "&gt;");
    	 str=str.replaceAll("<", "&lt;");
    	 
    	 str=str.replaceAll(" ", "&nbsp;");
    	 str=str.replaceAll("\n", "<br>");
    	 
    	 return str;
     }

 	// 문자열의 내용중 원하는 문자열을 다른 문자열로 변환
 	// String str = replaceAll(str, "\n", "<br>"); // 엔터를 <br>로 변환
 	public String replaceAll(String str, String oldStr, String newStr) throws Exception {
 		if(str == null)
 			return "";

         Pattern p = Pattern.compile(oldStr);
         
         // 입력 문자열과 함께 매쳐 클래스 생성
         Matcher m = p.matcher(str);

         StringBuffer sb = new StringBuffer();
         // 패턴과 일치하는 문자열을 newStr 로 교체해가며 새로운 문자열을 만든다.
         while(m.find()) {
             m.appendReplacement(sb, newStr);
         }

         // 나머지 부분을 새로운 문자열 끝에 덫 붙인다.
         m.appendTail(sb);

 		return sb.toString();
 	}

 	// NULL 인 경우 ""로 
     public String checkNull(String str) {
         String strTmp;
         if (str == null)
             strTmp = "";
         else
             strTmp = str;
         return strTmp;
     }
}
