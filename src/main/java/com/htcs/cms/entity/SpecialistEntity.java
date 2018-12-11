package com.htcs.cms.entity;

import com.mingsoft.basic.entity.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 专家实体类
 *
 * @author Dragon
 * @create 2017-09-18 16:49
 **/
public class SpecialistEntity extends BaseEntity {

	/**
	 * 专家id
	 */
	private Integer specialistId;

	/**
	 * 专家姓名
	 */
	private String specialistName;

	/**
	 * 父类别ID
	 */
	private Integer specialistParentId;

	/**
	 * 一对多集合
	 */
	private List<SpecialistEntity> childrenSpecialist;


	public Integer getSpecialistId() {
		return specialistId;
	}

	public void setSpecialistId(Integer specialistId) {
		this.specialistId = specialistId;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	public Integer getSpecialistParentId() {
		return specialistParentId;
	}

	public void setSpecialistParentId(Integer specialistParentId) {
		this.specialistParentId = specialistParentId;
	}

	public List<SpecialistEntity> getChildrenSpecialist() {
		if (childrenSpecialist == null) {
			return new ArrayList<>();
		}
		return childrenSpecialist;
	}

	public void setChildrenSpecialist(List<SpecialistEntity> childrenSpecialist) {
		this.childrenSpecialist = childrenSpecialist;
	}
}
