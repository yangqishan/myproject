package com.etc.exam.ExcelController;

import cn.afterturn.easypoi.word.WordExportUtil;
import com.etc.exam.Bean.Report;
import com.etc.exam.Bean.User;
import com.etc.exam.Bean.UserReport;
import com.etc.exam.ReportDao.ReportRepository;
import com.etc.exam.UserDao.UserRepository;
import com.etc.exam.Utils.ExcelUtils;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/excel")
public class ExcelController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReportRepository reportRepository;
    //导出用户信息表
    @RequestMapping(value = "/user")
    @ResponseBody
    public int UserExcel(@RequestParam(value = "status") String status,
                         HttpServletRequest request) throws Exception{ ;
        Map<String, Object> map = new HashMap<String, Object>();
        List<Map<String, String>> listMap = new ArrayList<Map<String, String>>();
        List<User> list;
        if(status.equals("user")){
            list =userRepository.findAll();
        }else{
            list =userRepository.findAllByOrderByJifenDesc();
        }

        for (int i = 0; i < list.size(); i++) {
            Map<String, String> lm = new HashMap<String, String>();
            User user=(User)list.get(i);
            lm.put("id", String.valueOf(user.getId()));
            lm.put("name", user.getName());
            lm.put("sex", user.getSex());
            lm.put("grade", user.getGrade());
            lm.put("age", String.valueOf(user.getAge()));
            lm.put("jointime",user.getJointime().toString());
            lm.put("jifen", String.valueOf(user.getJifen())+"分");
            listMap.add(lm);
       }
        map.put("users", listMap);

        ExcelUtils.saveTemplateFile(request,"template/userExcel.xlsx", "excel","用户信息.xlsx",map);
        return 1;
    }
    //导出成绩单excel表
    @RequestMapping(value="/report")
    @ResponseBody
    public int reportExcel(HttpServletRequest request,
                           @RequestParam(value="subject",defaultValue = "") String subject) throws Exception{

        Map<String, Object> map = new HashMap<String, Object>();
        List<Map<String, String>> listMap = new ArrayList<Map<String, String>>();
        List<Report> list;
        if(!subject.equals("")){
         list=reportRepository.findAllBySubjectOrderByAchievementDesc(subject);
        }else {
         list = reportRepository.findAll();
        }
        List<UserReport> lists=new ArrayList<UserReport>();
        for(int j=0;j<list.size();j++){
            UserReport userReport=new UserReport();
            int uid=list.get(j).getUserId();
            if(uid!=0) {
                User user = userRepository.findById(uid);
                userReport.setName(user.getName());
                userReport.setReport(list.get(j));
                lists.add(userReport);
            }else {
                continue;
            }
        }
        for (int i = 0; i < lists.size(); i++) {
            Map<String, String> lm = new HashMap<String, String>();
            UserReport userReport=(UserReport)lists.get(i);
            lm.put("id", String.valueOf(userReport.getReport().getId()));
            lm.put("name", userReport.getName());
            lm.put("title", userReport.getReport().getTitle());
            lm.put("subject", userReport.getReport().getSubject());
            lm.put("achievement", String.valueOf(userReport.getReport().getAchievement())+"分");
            lm.put("addtime",userReport.getReport().getAddtime().toString());
            listMap.add(lm);
        }
        map.put("report", listMap);
        ExcelUtils.saveTemplateFile(request,"template/reportExcel.xlsx", "excel","成绩单信息.xlsx",map);
        return 1;
    }

    @RequestMapping(value="/word")
    @ResponseBody
    public int reportWord(HttpServletRequest request) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("test","aaaaaa");
        try {
            XWPFDocument doc = WordExportUtil.exportWord07("/template/word.docx", map);
            FileOutputStream fos = new FileOutputStream("excel/试卷详情.docx");
            doc.write(fos);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 1;
    }
}
