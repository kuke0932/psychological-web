/**
The MIT License (MIT) * Copyright (c) 2016 铭飞科技(mingsoft.net)

 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package com.htcs.cms.action.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.htcs.cms.parser.CmsParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mingsoft.util.StringUtil;

@Controller("dynamicPageAction")
@RequestMapping("/mcms")
public class MCmsAction extends com.mingsoft.mdiy.action.BaseAction{
	
	
	/**
	 * 替换时间的字符
	 */
	private String date = "{date/}";
	/**
	 * 替换主机地址
	 */
	private String host = "{host/}"; 
	/**
	 *文章解析器
	 */
	@Autowired
	private CmsParser cmsParser;
	
	
	//该类作废，自定义页面路径请填写对应模块下面的DynamicPageAction的路径
	//如商城就为:/mall/{key}.do
	/**
	 * 前段会员中心所有页面都可以使用该方法 请求地址例如：　／{diy}.do,例如登陆界面，与注册界面都可以使用
	 * 
	 * @param key
	 */
	@RequestMapping("/{diy}.do")
	@ExceptionHandler(NullPointerException.class)
	public void diy(@PathVariable(value = "diy") String diy, HttpServletRequest req, HttpServletResponse resp) {
		String content = this.generaterPage("mcms/" + diy,cmsParser,req);
		if (StringUtil.isBlank(content)) {
			this.outString(resp, this.getResString("err.not.exist","mcms/"+diy));
			return;
		}
		//增加时间
		content =  content.replace(date, StringUtil.getDateSimpleStr());
		content =  content.replace(host, this.getApp(req).getAppHostUrl());
		this.outString(resp, content);
	}
	
}