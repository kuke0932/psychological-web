package com.htcs.cms.biz.impl;

import com.htcs.cms.biz.ISpecialistBiz;
import com.htcs.cms.dao.ISpecialistDao;
import com.mingsoft.base.entity.BaseEntity;
import com.mingsoft.basic.biz.impl.BasicBizImpl;
import com.mingsoft.basic.entity.BasicEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Dragon
 * @create 2017-09-18 17:15
 **/
@Service("ISpecialistBizImpl")
public class ISpecialistBizImpl extends BasicBizImpl implements ISpecialistBiz {

	@Autowired
	private ISpecialistDao specialistDao;

	@Override
	protected ISpecialistDao getDao() {
		return specialistDao;
	}

	@Override
	public List queryAll() {
		return specialistDao.queryAll();
	}

	@Override
	public void deleteEntity(int id) {
		specialistDao.deleteEntity(id);
	}

	@Override
	public void updateBasic(BasicEntity basic) {
		specialistDao.updateEntity(basic);
	}

	@Override
	public int saveEntity(BaseEntity entity) {
		return specialistDao.saveEntity(entity);
	}
}
