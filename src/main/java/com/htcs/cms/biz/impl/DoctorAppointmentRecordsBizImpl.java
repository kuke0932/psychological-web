package com.htcs.cms.biz.impl;

import com.htcs.cms.biz.IDoctorAppointmentRecordsBiz;
import com.htcs.cms.dao.IDoctorAppointmentRecordsDao;
import com.mingsoft.base.biz.impl.BaseBizImpl;
import com.mingsoft.base.dao.IBaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("DoctorAppointmentRecordsBizImpl")
public class DoctorAppointmentRecordsBizImpl extends BaseBizImpl implements IDoctorAppointmentRecordsBiz {

    @Autowired
    IDoctorAppointmentRecordsDao doctorAppointmentRecordsDao;

    @Override
    protected IBaseDao getDao() {
        return doctorAppointmentRecordsDao;
    }


    @Override
    public void delete(String ids) {
        doctorAppointmentRecordsDao.delete(ids);
    }

    @Override
    public List<Map> queryDoctorCategory(Integer categoryId) {
        return doctorAppointmentRecordsDao.queryDoctorCategory(categoryId);
    }
}
