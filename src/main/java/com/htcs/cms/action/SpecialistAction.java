package com.htcs.cms.action;

import com.alibaba.fastjson.JSONArray;
import com.htcs.cms.biz.ISpecialistBiz;
import com.htcs.cms.common.EhcacheUtil;
import com.htcs.cms.entity.SpecialistEntity;
import com.mingsoft.base.constant.e.BaseEnum;
import com.mingsoft.basic.action.BaseAction;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 专家预约管理
 *
 * @author Dragon
 * @create 2017-09-18 16:13
 **/
@Controller
@RequestMapping("/${managerPath}/cms/specialist")
public class SpecialistAction extends BaseAction {

	@Autowired
	private ISpecialistBiz specialistBiz;

	/**
	 * 加载页面，显示所有的专家信息
	 *
	 * @param request
	 * @return 返回专家页面的显示地址
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		List list = specialistBiz.queryAll();
		request.setAttribute("listSpecialist", JSONArray.toJSONString(list));
		return view("/cms/specialist/index");
	}

	/**
	 * 添加专家信息
	 *
	 * @param specialistEntity SpecialistEntity实体
	 * @param response
	 */
	@RequestMapping("/saveSpecialist")
	@RequiresPermissions("specialist:save")
	public void saveSpecialist(SpecialistEntity specialistEntity, HttpServletResponse response) {
		try {
			specialistBiz.saveEntity(specialistEntity);
			int specialistId = specialistEntity.getSpecialistId();
			super.outJson(response,null, true, "添加成功", String.valueOf(specialistId));
		} catch (Exception e) {
			LOG.error("添加specialist失败", e);
			super.outJson(response,Boolean.FALSE, "添加失败");
		}
	}

	/**
	 * 根据id修改数据
	 *
	 * @param specialistEntity SpecialistEntity实体
	 * @param response
	 */
	@RequestMapping("/updateSpecialist")
	@RequiresPermissions("specialist:edit")
	public void updateSpecialist(SpecialistEntity specialistEntity, HttpServletResponse response) {
		try {
			specialistBiz.updateEntity(specialistEntity);
			super.outJson(response,Boolean.TRUE, "修改成功");
		} catch (Exception e) {
			LOG.error("修改specialist失败", e);
			super.outJson(response,Boolean.FALSE, "修改失败");
		}
	}


	/**
	 * 根据id删除
	 *
	 * @param specialistId specialistId
	 */
	@RequestMapping("/{specialistId}/deleteSpecialist")
	@RequiresPermissions("specialist:del")
	public void deleteSpecialist(@PathVariable("specialistId") Integer specialistId,
								 HttpServletResponse response) {
		try {
			specialistBiz.deleteEntity(specialistId);
			super.outJson(response,Boolean.TRUE, "删除成功");
		} catch (Exception e) {
			LOG.error("删除specialist失败", e);
			super.outJson(response,Boolean.FALSE, "删除失败");
		}
	}

}
