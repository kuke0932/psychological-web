package com.htcs.cms.action;

import com.htcs.cms.biz.IArticleBiz;
import com.htcs.cms.biz.IDoctorAppointmentRecordsBiz;
import com.htcs.cms.constant.ModelCode;
import com.htcs.cms.entity.ArticleEntity;
import com.htcs.cms.entity.DoctorAppointmentRecords;
import com.mingsoft.base.filter.DateValueFilter;
import com.mingsoft.basic.action.BaseAction;
import com.mingsoft.basic.entity.ManagerSessionEntity;
import net.mingsoft.basic.bean.EUListBean;
import net.mingsoft.basic.util.BasicUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/${managerPath}/cms/doctorAppointment")
public class DoctorAppointmentRecordsAction extends BaseAction {

    @Autowired
    private IDoctorAppointmentRecordsBiz doctorAppointmentRecordsBiz;

    @Autowired
    private IArticleBiz articleBiz;

    @PostMapping("/delete")
    public void delete(@RequestBody List<DoctorAppointmentRecords> doctorAppointmentRecords, HttpServletRequest request, HttpServletResponse response) {

        String ids = doctorAppointmentRecords.stream()
                .reduce("",
                        (_ids, t1) -> _ids + "," + t1.getRecId(),
                        (_ids, t1) -> _ids + "," + t1);
        if (ids.length() > 1) {
            ids = ids.substring(1);
            doctorAppointmentRecordsBiz.delete(ids);
            this.outJson(response, ModelCode.CMS_ARTICLE, false, "", this.redirectBack(request, false));
        } else {
            this.outJson(response, ModelCode.CMS_ARTICLE, true, "", this.redirectBack(request, false));
        }
    }

    @GetMapping("index")
    public String index() {
        return view("/cms/appointment/index");
    }

    @GetMapping("form")
    public String form(ModelMap modelMap, @RequestParam(value = "recId", defaultValue = "0") Integer recId) {
        DoctorAppointmentRecords doctorAppointmentRecords = null;
        if (recId != null && recId != 0) {
            doctorAppointmentRecords = (DoctorAppointmentRecords) doctorAppointmentRecordsBiz.getEntity(recId);
        } else {
            doctorAppointmentRecords = new DoctorAppointmentRecords();
        }
        modelMap.addAttribute("now", new Date());
        modelMap.addAttribute("doctorAppointmentRecords", doctorAppointmentRecords);
        return view("/cms/appointment/form");
    }

    @GetMapping("list")
    public void list(HttpServletRequest request, HttpServletResponse response, DoctorAppointmentRecords doctorAppointmentRecords) {

        //    this.outJson(response, );
        BasicUtil.startPage();
        ArticleEntity doctor = doctorAppointmentRecords.getDoctor();

        if (doctor != null && StringUtils.isNotEmpty(doctor.getBasicTitle())) {
            doctor.setBasicTitle("%" + doctor.getBasicTitle() + "%");
        }
        List list = doctorAppointmentRecordsBiz.query(doctorAppointmentRecords);
        EUListBean _list = new EUListBean(list, (int) BasicUtil.endPage(list).getTotal());
        this.outJson(response, net.mingsoft.base.util.JSONArray.toJSONString(_list, new DateValueFilter("yyyy-MM-dd HH:mm:ss")));
    }

    @PostMapping("save")
    public void save(HttpServletRequest request, HttpServletResponse response, DoctorAppointmentRecords doctorAppointmentRecords) {
        ManagerSessionEntity managerBySession = this.getManagerBySession(request);
        doctorAppointmentRecords.setManager(managerBySession);
        doctorAppointmentRecords.setOperateTime(DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
        int success = doctorAppointmentRecordsBiz.saveEntity(doctorAppointmentRecords);
        if (success > 0) {
            this.outJson(response, true);
        } else {
            this.outJson(response, false);
        }
    }

    @PostMapping("update")
    public void update(HttpServletRequest request, HttpServletResponse response, DoctorAppointmentRecords doctorAppointmentRecords) {
        ManagerSessionEntity managerBySession = this.getManagerBySession(request);
        doctorAppointmentRecords.setManager(managerBySession);
        doctorAppointmentRecords.setOperateTime(DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
        doctorAppointmentRecordsBiz.updateEntity(doctorAppointmentRecords);
        this.outJson(response, true);
    }

    @GetMapping("enterListDoctor")
    String enterListDoctor() {
        return view("/cms/appointment/selectDoctor");
    }

    @GetMapping("listDoctor")
    void listDoctor(HttpServletRequest request, HttpServletResponse response, ArticleEntity articleEntity, @RequestParam(defaultValue = "0") Integer categoryId) {

        List<Map> basic_column = doctorAppointmentRecordsBiz.queryDoctorCategory(categoryId);
        int basicCategoryIds[] = null;
        int size = 0;
        if (basic_column != null && (size = basic_column.size()) > 0) {
            basicCategoryIds = new int[size];
            for (int i = 0; i < size; i++) {
                int column_category_id = (int) basic_column.get(i).get("column_category_id");
                basicCategoryIds[i] = column_category_id;
            }
            BasicUtil.startPage();
            List<ArticleEntity> list = articleBiz.query(1, basicCategoryIds, null, null, null, false, articleEntity);
            EUListBean _list = new EUListBean(list, (int) BasicUtil.endPage(list).getTotal());
            this.outJson(response, net.mingsoft.base.util.JSONArray.toJSONString(_list, new DateValueFilter("yyyy-MM-dd HH:mm:ss")));
        } else {
            EUListBean _list = new EUListBean(new ArrayList(), 0);
            this.outJson(response, net.mingsoft.base.util.JSONArray.toJSONString(_list, new DateValueFilter("yyyy-MM-dd HH:mm:ss")));
        }

    }

}
