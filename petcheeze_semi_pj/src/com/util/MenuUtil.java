package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MenuUtil {
	// �������� ��
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
	
	// ����¡ ó��
	public String paging(int current_page, int total_page, String list_url) {
		StringBuffer sb=new StringBuffer();
		
		int numPerBlock=16;
		int currentPageSetup;
		int n, page;
		
		if(current_page<1 || total_page < 1)
			return "";
		
		list_url+="&";
		
		// currentPageSetup : ǥ����ù������-1
		currentPageSetup=(current_page/numPerBlock)*numPerBlock;
		if(current_page%numPerBlock==0)
			currentPageSetup=currentPageSetup-numPerBlock;
		
		// ó��������
		if(current_page > 1) {
			sb.append("<ol><li><a href='"+list_url+"page=1'>ó��</a></li></ol>");
		}
		
		// ����(16������ ��)
		n=current_page-numPerBlock;
		if(total_page > numPerBlock && currentPageSetup > 0) {
			sb.append("<ol><li><a href='"+list_url+"page="+n+"'>����</a></li></ol>");
		}
		
		// �ٷΰ���
		page=currentPageSetup+1;
		while(page<=total_page && page <=(currentPageSetup+numPerBlock)) {
			if(page==current_page) {
				sb.append("<ol><li><a href='#'>"+page+"</a></li></ol>");
			} else {
				sb.append("<ol><li><a href='"+list_url+"page="+page+"'>"+page+"</a></li></ol>");
			}
			page++;
		}
		
		// ����(16������ ��)
		n=current_page+numPerBlock;
		if(n>total_page) n=total_page;
		if(total_page-currentPageSetup>numPerBlock) {
			sb.append("<ol><li><a href='"+list_url+"page="+n+"'>����</a></li></ol>");
		}
		
		// ������������
		if(current_page<total_page) {
			sb.append("<ol><li><a href='"+list_url+"page="+total_page+"'>����</a></li></ol>");
		}
	
		return sb.toString();
	}
    
    // Ư�����ڸ� HTML ���ڷ� ����
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

    // Ư�����ڸ� HTML ���ڷ� ���� �� ���͸� <br>�� ���� 
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

 	// ���ڿ��� ������ ���ϴ� ���ڿ��� �ٸ� ���ڿ��� ��ȯ
 	// String str = replaceAll(str, "\n", "<br>"); // ���͸� <br>�� ��ȯ
 	public String replaceAll(String str, String oldStr, String newStr) throws Exception {
 		if(str == null)
 			return "";

         Pattern p = Pattern.compile(oldStr);
         
         // �Է� ���ڿ��� �Բ� ���� Ŭ���� ����
         Matcher m = p.matcher(str);

         StringBuffer sb = new StringBuffer();
         // ���ϰ� ��ġ�ϴ� ���ڿ��� newStr �� ��ü�ذ��� ���ο� ���ڿ��� �����.
         while(m.find()) {
             m.appendReplacement(sb, newStr);
         }

         // ������ �κ��� ���ο� ���ڿ� ���� �� ���δ�.
         m.appendTail(sb);

 		return sb.toString();
 	}

 	// NULL �� ��� ""�� 
     public String checkNull(String str) {
         String strTmp;
         if (str == null)
             strTmp = "";
         else
             strTmp = str;
         return strTmp;
     }
}
