package com.sist.movie;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements; 
/*
 * 	Collection : 자료구조
 * ============
 * List						Set(순서 				Map:HashMap(key-value)
 * =======											클래스 등록할 때 많이 사용(mapping 생각)
 * ArrayList : DataBase(순서는 있는데 ,중복 허용X,비동기화)
 * Vector : NetWork(동기화)
 * LinkedList
 * 
 * 예외처리
 * 	 =목적 : 비정상 종료를 방지하고 정상상태 유지
 * 	 =체크, 언체크 
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
 * =직접처리
 * 	try{
 * 	정상 수행할 수 있는 코드
 * }catch(예외처리 종류){
 * 	
 * }finally{
 * }
 * =간접처리
 * =임의발생
 * =사용자정의
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
                                <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79598/79598_185.jpg" alt="캐리비안의 해적: 죽은 자는 말이 없다 포스터" onerror="errorImage(this)"/>
                                <span class="ico-grade grade-12">12세 이상</span>
                            </span>
		웹크롤링
	 * */
	public List<MovieVO> movieMainDate()
	{
		List<MovieVO> list=new ArrayList<MovieVO>();
		try{
			//소스 읽기
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
				 * attr() <a href=""> 태그의 속성값 갖고옴
				 * text() <a>aaa</a> 태그와 태그 사이 값(태그 말고 문자열만)
				 * 		  <a><span>aaaa</span><b>bbb</b></a>
				 * html()  <a><span>aaaa</span><b>bbb</b></a>-안의 html태그까지 다 갖고옴
				 */
				MovieVO vo=new MovieVO();
				vo.setPoster(image);
				
				vo.setGrade(gelem.text());
				//http://www.cgv.co.kr/movies/detail-view/?midx=79598
				link_data=link_data.substring(link_data.lastIndexOf("=")+1); //영화번호 뽑아내기
				vo.setLink(link_data);
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
}
