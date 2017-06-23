package com.sist.movie;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements; 
/*
 * 	Collection : �ڷᱸ��
 * ============
 * List						Set(���� 				Map:HashMap(key-value)
 * =======											Ŭ���� ����� �� ���� ���(mapping ����)
 * ArrayList : DataBase(������ �ִµ� ,�ߺ� ���X,�񵿱�ȭ)
 * Vector : NetWork(����ȭ)
 * LinkedList
 * 
 * ����ó��
 * 	 =���� : ������ ���Ḧ �����ϰ� ������� ����
 * 	 =üũ, ��üũ 
 * 		Object
 * 			|
 *		Throwble
 *			|
 *		---------
 *		|		|
 *	  Error		Exception
 *				 	|
 *				------------
 *				|		   |				
 *				Check	nonCheck
 *						RuntimeException
 *							|
 *							ArrayIndexOutOfBoundsException
 *							NumberFormatException
 *							NullPointerException
 *							ClassCastException
 *							ArithmeticException
 *				IOException
 *				SQLException
 *				ClassNotFoundException
 * =����ó��
 * 	try{
 * 	���� ������ �� �ִ� �ڵ�
 * }catch(����ó�� ����){
 * 	
 * }finally{
 * }
 * =����ó��
 * =���ǹ߻�
 * =���������
 * */
public class MovieManager {
	public static void main(String[] args) {
		MovieManager mm=new MovieManager();
		mm.movieMainDate();
	}
	/*
	 *   <div class="box-image" >
                        <strong class="rank">No.1</strong>	
                        <a href="/movies/detail-view/?midx=79598">
                            <span class="thumb-image">
                                <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79598/79598_185.jpg" alt="ĳ������� ����: ���� �ڴ� ���� ���� ������" onerror="errorImage(this)"/>
                                <span class="ico-grade grade-12">12�� �̻�</span>
                            </span>
		��ũ�Ѹ�
	 * */
	public List<MovieVO> movieMainDate()
	{
		List<MovieVO> list=new ArrayList<MovieVO>();
		try{
			//�ҽ� �б�
			Document doc=Jsoup.connect("http://www.cgv.co.kr/movies/?ft=0").get();
			//System.out.println(doc);
			Elements poster=doc.select("div.box-image a span.thumb-image img");
			Elements grade=doc.select("div.box-image span.ico-grade");
			Elements link=doc.select("div.box-contents a");
			int j=0;
			for(int i=0; i<7; i++){
				Element pelem=poster.get(i);
				String image=pelem.attr("src"); 
				Element gelem=grade.get(i);
				Element lelem=link.get(j);
				String link_data=lelem.attr("href");
				System.out.println(image+" "+gelem.text()+" "+link_data);
				j+=2;
				/*
				 * attr() <a href=""> �±��� �Ӽ��� �����
				 * text() <a>aaa</a> �±׿� �±� ���� ��(�±� ���� ���ڿ���)
				 * 		  <a><span>aaaa</span><b>bbb</b></a>
				 * html()  <a><span>aaaa</span><b>bbb</b></a>-���� html�±ױ��� �� �����
				 */
				MovieVO vo=new MovieVO();
				vo.setPoster(image);
				
				vo.setGrade(gelem.text());
				//http://www.cgv.co.kr/movies/detail-view/?midx=79598
				link_data=link_data.substring(link_data.lastIndexOf("=")+1); //��ȭ��ȣ �̾Ƴ���
				vo.setLink(link_data);
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
}
