package com.htcs.cms.biz;

import com.mingsoft.base.biz.IBaseBiz;

import java.util.List;
import java.util.Map;

public interface IDoctorAppointmentRecordsBiz extends IBaseBiz {

    void delete(String ids);

    List<Map> queryDoctorCategory(Integer categoryId);
}
