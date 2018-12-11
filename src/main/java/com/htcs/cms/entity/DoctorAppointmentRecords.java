package com.htcs.cms.entity;

import com.mingsoft.base.entity.BaseEntity;
import com.mingsoft.basic.entity.ManagerEntity;

public class DoctorAppointmentRecords extends BaseEntity {
    private Integer recId;

    private String consultingName;
    private String consultingQQ;
    private String consultingPhone;
    private ArticleEntity doctor;
    private String appointmentBeginTime;
    private String appointmentEndTime;
    private String description;
    private ManagerEntity manager;
    private String operateTime;

    public DoctorAppointmentRecords() {

    }

    public Integer getRecId() {
        return recId;
    }

    public void setRecId(Integer recId) {
        this.recId = recId;
    }

    public String getConsultingName() {
        return consultingName;
    }

    public void setConsultingName(String consultingName) {
        this.consultingName = consultingName;
    }

    public String getConsultingQQ() {
        return consultingQQ;
    }

    public void setConsultingQQ(String consultingQQ) {
        this.consultingQQ = consultingQQ;
    }

    public String getConsultingPhone() {
        return consultingPhone;
    }

    public void setConsultingPhone(String consultingPhone) {
        this.consultingPhone = consultingPhone;
    }

    public ArticleEntity getDoctor() {
        return doctor;
    }

    public void setDoctor(ArticleEntity doctor) {
        this.doctor = doctor;
    }

    public String getAppointmentBeginTime() {
        return appointmentBeginTime;
    }

    public void setAppointmentBeginTime(String appointmentBeginTime) {
        this.appointmentBeginTime = appointmentBeginTime;
    }

    public String getAppointmentEndTime() {
        return appointmentEndTime;
    }

    public void setAppointmentEndTime(String appointmentEndTime) {
        this.appointmentEndTime = appointmentEndTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ManagerEntity getManager() {
        return manager;
    }

    public void setManager(ManagerEntity manager) {
        this.manager = manager;
    }

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime;
    }
}
