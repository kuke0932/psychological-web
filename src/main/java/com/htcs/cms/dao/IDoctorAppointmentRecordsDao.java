package com.htcs.cms.dao;

import com.mingsoft.base.dao.IBaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface IDoctorAppointmentRecordsDao extends IBaseDao {

    void delete(String ids);

    List<Map> queryDoctorCategory(@Param("categoryId") Integer categoryId);
}
