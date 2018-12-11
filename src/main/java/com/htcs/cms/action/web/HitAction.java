package com.htcs.cms.action.web;

import com.htcs.cms.biz.IArticleBiz;
import com.htcs.cms.common.EhcacheUtil;
import com.htcs.cms.entity.ArticleEntity;
import com.mingsoft.basic.action.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 缓存
 *
 * @author Dragon
 * @create 2017-09-21 16:23
 **/
@Controller
@RequestMapping("/hit")
public class HitAction extends BaseAction {

	@Autowired
	private IArticleBiz articleBiz;

	/**
	 * 缓存点击量
	 *
	 * @param key
	 * @param response
	 */
	@RequestMapping("/hitsCache")
	@ResponseBody
	public void hitsCache(Integer key, HttpServletResponse response) {
		Integer count;
		synchronized (this) {
			count = (Integer) EhcacheUtil.getInstance().get(EhcacheUtil.HITS_CACHE, String.valueOf(key));
			if (count == null) {
				ArticleEntity articleEntity = (ArticleEntity) articleBiz.getEntity(key);
				count = articleEntity.getBasicHit() + 1;
			} else {
				count++;
			}
			EhcacheUtil.getInstance().put(EhcacheUtil.HITS_CACHE, String.valueOf(key), count);
		}
		this.outJson(response, null, true, "", String.valueOf(count));
	}

	/**
	 * 取hit值
	 *
	 * @param key
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getHit")
	public void getHit(Integer key, HttpServletResponse response) throws IOException {
		Integer count = (Integer) EhcacheUtil.getInstance().get(EhcacheUtil.HITS_CACHE, String.valueOf(key));
		if (count == null) {
			ArticleEntity articleEntity = (ArticleEntity) articleBiz.getEntity(key);
			count = articleEntity.getBasicHit();
			EhcacheUtil.getInstance().put(EhcacheUtil.HITS_CACHE, String.valueOf(key), count);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.getWriter().write("document.write("+count+")");
	}
}
