package com.guddqs.blog.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.guddqs.blog.dao.ArticleMapper;
import com.guddqs.blog.dao.TypeMapper;
import com.guddqs.blog.entity.Article;
import com.guddqs.blog.entity.Type;

public class AddTest {

	@Test
	public void addArticle(){
		
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		
		ArticleMapper adao=ctx.getBean(ArticleMapper.class);
		
		for(int i=1;i<10;i++){
			
			Article ac=new Article();
			ac.init();
			ac.setLooktime(i);
			ac.setLove(i*10);
			ac.setContent(i+"茫茫人海里遇见一个人有多难？有时候很难，几十亿人，一生也难见一次。有时却很容易，人群中第一眼就能把他认出来。我们总在不设防的时候喜欢上一些人。没什么原因，也许只是一个温和的笑容，一句关切的问候。可能未曾谋面，可能志趣并不相投，可能不在一个高度，却牢牢地放在心上了。冥冥中该来则来，无处可逃，就好像喜欢一首歌，往往就因为一个旋律或一句打动你的歌词。喜欢或者讨厌，是让人莫名其妙的事情。");
			ac.setTitle("现在，我相信爱情_"+i+"！");
			ac.setPic("pic_"+i+".jpg");
			ac.setTypeid(i+5);
			adao.insert(ac);
		}
	}
	
	@Test
	public void addType(){
		
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		
		TypeMapper dao=ctx.getBean(TypeMapper.class);
		
		for(int i=1;i<10;i++){
			
			Type type=new Type();
			type.setName("javaEE_"+i);
			dao.insert(type);
		}
	}
	
}
