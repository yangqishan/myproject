package com.etc.exam.UserController;

import com.etc.exam.Bean.*;
import com.etc.exam.PaperDao.PaperRepository;
import com.etc.exam.ReportDao.ReportRepository;
import com.etc.exam.TopicDao.TopicRepository;
import com.etc.exam.UserDao.UserRepository;
import com.etc.exam.Utils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Controller
@RequestMapping(value = "user")
public class UserController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ReportRepository reportRepository;
    @Autowired
    private PaperRepository paperRepository;
    @Autowired
    private TopicRepository topicRepository;
    //定义分页大小
    int pageSize=6;
    private BeanUtils beanUtils;
    @RequestMapping(value = {"/","/login"})
    public String login(){
        return "user/index";
    }
    //判断用户名存不存在
    @PostMapping(value="/findByName")
    @ResponseBody
    public int finByName(@RequestParam("name") String name,
                         @RequestParam("pswd") String pswd,
                         HttpServletRequest request){
        User user=userRepository.findByName(name);
        if(user!=null){
            if(user.getPswd().equals(pswd)){
                //将用户信息存在session中
                request.getSession().setAttribute("username",user.getName());
                request.getSession().setAttribute("user",user);
                return 1;
            }else{
                return 2;
            }
        }else{
            return 0;
        }
    }
    //用户退出
    @RequestMapping(value="/user_out")
    public String userOut(HttpServletRequest request){
        //清除用户信息
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("user");
        return "user/index";
    }
    //用户修改密码
    @RequestMapping(value = "/userUpdate")
    @ResponseBody
    public int userUpdate(@RequestParam("name") String name,
                          @RequestParam("pswd") String pswd,
                          HttpServletRequest request){
        User user=userRepository.findByName(name);
        //重新修改密码
        user.setPswd(pswd);
        //保存新密码到数据库
        userRepository.save(user);
        request.getSession().removeAttribute("username");
        return 1;
    }

    /**
     * 修改用户头像
     * @return
     */
    @RequestMapping(value = "/userImg")
    public String editImg(@RequestParam(value = "img",defaultValue = "") String img,
                          HttpServletRequest request){
        String name=request.getSession().getAttribute("username").toString();
        User user=userRepository.findByName(name);
        user.setImg(img);
        userRepository.save(user);
        request.getSession().setAttribute("user",user);
        return "user/profile";
    }
    //修改用户信息
    @RequestMapping(value="/userEdit")
    @ResponseBody
    public int userEdit(@RequestParam(value="grade") String grade,
                        @RequestParam(value="name") String name,
                        @RequestParam(value="sex") String sex,
                        @RequestParam(value="age") int age ,
                        @RequestParam(value="address") String address,
                        HttpServletRequest request){
        User user=userRepository.findByName(name);
        //设置新的属性值
        user.setGrade(grade);
        user.setAge(age);
        user.setSex(sex);
        user.setAddress(address);
        //保存新数据到数据库
        userRepository.save(user);
        user=userRepository.findByName(name);
        request.getSession().setAttribute("user",user);
        return 1;
    }
    //添加用户信息
    @RequestMapping(value = "/userRregistered")
    @ResponseBody
    public int userRregistered(@RequestParam(value = "name") String name,
                               @RequestParam(value = "pswd") String pswd){
        User user=new User();
        //添加新信息
        user.setName(name);
        user.setPswd(pswd);
        user.setLevel("初级");
        user.setJointime( new Date(System.currentTimeMillis()));
        //保存用户信息到数据库
        userRepository.save(user);
        return 1;
    }
    /**
     * 模糊查询(全部查询)查询用户的成绩单
     * @param search
     * @param ispageNow
     * @param request
     * @return
     */
    @RequestMapping(value = "/searchReport")
    public String findReport(@RequestParam(value = "search",defaultValue = "") String search,
                             @RequestParam(value = "pageNow",defaultValue = "") String ispageNow,
                             HttpServletRequest request){
        int pageNow=0;
        if(ispageNow!=null&&ispageNow.length()>0){
            pageNow=Integer.parseInt(ispageNow);

        }
        int grade;
        Page<Report> list;
        Pageable pageable=PageRequest.of(pageNow,pageSize);
        if(search.equals("")){
            String name=(String)request.getSession().getAttribute("username");
            User user=userRepository.findByName(name);
            list=reportRepository.findAllByUserId(user.getId(),pageable);
            request.removeAttribute("search");
        }else{
            //判断是否是数字
            if (!Character.isDigit(search.charAt(0))){
                grade=0;
            }else{
                grade=Integer.parseInt(search);
            }
            list=reportRepository.findByTitleLikeOrSubjectLikeOrAchievementOrderByAddtimeDesc("%"+search+"%","%"+search+"%", grade,pageable);
            request.setAttribute("search",search);
        }
        request.setAttribute("pageNow",pageNow);
        request.setAttribute("userReport",list);
        return "user/user_report";
    }
    //根据成绩单id查询题目
    @RequestMapping(value = "/userTopic")
    public String findReportById(@RequestParam("id") int id,
                                 HttpServletRequest request){
        //找到该成绩单
        Report report=reportRepository.findReportById(id);
        //用户的答案
        String[] Ranswer=report.getRanswer().split(",");
        //找到这张试卷
        Paper paper=paperRepository.findPaperById(report.getPaperId());
        //试卷的题号正确
        String topicId[]=paper.getTopicId().split(",");
        //定义集合
        List list=new ArrayList<TopicReport>();
        //定义一个topicReport对象
        for(int i=0;i<topicId.length;i++){
              TopicReport topicReport=new TopicReport();
              Topic topic =new Topic();
              topic=topicRepository.findById(Integer.parseInt(topicId[i]));
              String title[]=topic.getTitle().split(";");
              //定义新对象存取数据
              Topic topic1=new Topic();
              topic1.setTitle(title[0]);
              topic1.setAnswer(topic.getAnswer());
              //设置属性值
              topicReport.setTopic(topic1);
              topicReport.setAnswerA(title[1]);
              topicReport.setAnswerB(title[2]);
              topicReport.setAnswerC(title[3]);
              topicReport.setAnswerD(title[4]);
              topicReport.setAnswer(Ranswer[i]);
              list.add(topicReport);
        }
        request.setAttribute("title",paper.getTitle());
        request.setAttribute("achievement",report.getAchievement());
        request.setAttribute("userTopicReport",list);
        return "user/user_report_result";
    }
    //成绩单分析
    @RequestMapping(value="/userReportAnalysis")
    public String userReportAnalysis(@RequestParam("id") int id,
                                     HttpServletRequest request){
        List list=reportRepository.findAllByUserIdOrderByAddtimeDesc(id);
        String subject[]={"语文", "数学", "英语", "物理", "化学", "生物", "地理", "历史", "政治"};
        //分别计算各科目考试次数
        for(int i=0;i<subject.length;i++){
            int count=0;
            for(int j=0;j<list.size();j++){
                Report report=(Report) list.get(j);
                if(report!=null&&report.getSubject().equals(subject[i])){
                    request.setAttribute("grade"+i+count,report.getAchievement());
                    count++;
                }
            }
            request.setAttribute("subject"+i,count);
        }

        return "user/user_report_data";
    }
    //用户能力分析
    @RequestMapping(value="/userPower")
    public String userPower(@RequestParam(value="id") int id,
                            HttpServletRequest request){
       String subjects[]={"语文", "数学", "英语", "物理", "化学", "生物", "地理", "政治", "历史"};
       for(int i=0;i<subjects.length;i++){
           //查出所有成绩单
           List<Report> list=reportRepository.findAllByUserIdAndSubjectOrderByAchievementDesc(id,subjects[i]);
           //计算个数
           if(list==null){
               continue;
           }
           int sum=reportRepository.countByUserIdAndSubject(id,subjects[i]);
           Report report;
           float gradesum=0;
           for(int j=0;j<list.size();j++){
             report=list.get(j);
             //计算每科总分
             gradesum+=report.getAchievement();
           }
           request.setAttribute("max"+i,list.get(0).getAchievement());
           request.setAttribute("min"+i,list.get(list.size()-1).getAchievement());
           request.setAttribute("avg"+i,(int)gradesum/sum);

       }
       return  "user/user_power";
    }
    //用户的时间简史
    @RequestMapping(value = "userTime")
    public String userTime(@RequestParam("id") int id,
                           HttpServletRequest request){
        List list=new ArrayList<Report>();
        list=reportRepository.findAllByUserIdOrderByAddtimeDesc(id);
        request.setAttribute("usertime",list);
        return "user/ui-timeline";
    }

    /**
     * 用户考试(随机生成试卷)
     * @param subject
     * @param request
     * @return
     */
    @RequestMapping(value = "/userExam")
    public String userExam(@RequestParam("subject") String subject,
                           HttpServletRequest request){
        //查到符合科目的试卷
        List<Paper> list=paperRepository.findByType(subject);
        Random ran = new Random(list.size());
        //使用种子为10的Random对象生成[0,10)内随机整数序列
        Paper paper=list.get(ran.nextInt(list.size()));
        //取到所有题目的id
        String topicId[]=paper.getTopicId().split(",");
        List<TopicReport> list1=new ArrayList<TopicReport>();
        for(int i=0;i<topicId.length;i++){
            //建立一个试卷类型对象
            TopicReport topicReport=new TopicReport();
            //根据题目id找到题目
            Topic topic=topicRepository.findById(Integer.parseInt(topicId[i]));
            Topic topic1=new Topic();
            //将题目标题分割成五个部分
            String title[]=topic.getTitle().split(";");
            //将题目头和答案放入试卷对象中
            topic1.setTitle(title[0]);
            topic1.setAnswer(topic.getAnswer());
            topicReport.setTopic(topic1);
            //将题目答案放入试卷对象中
            topicReport.setAnswerA(title[1]);
            topicReport.setAnswerB(title[2]);
            topicReport.setAnswerC(title[3]);
            topicReport.setAnswerD(title[4]);
            list1.add(topicReport);
        }
        request.setAttribute("paperId",paper.getId());
        request.setAttribute("paper",paper);
        request.setAttribute("userpaper",list1);
        return "user/user_management_exam";
    }
    //审核试卷
    @RequestMapping(value="/checkPpaer")
    public String checkPaper(@RequestParam(value = "answers") String answer,
                             @RequestParam(value = "id") int id,
                             @RequestParam("username") String username,
                             HttpServletRequest request){
        //把答案分割开
        String answers[]=answer.split(",");
        //根据id先找到这张试卷
        Paper paper=paperRepository.findPaperById(id);
        //把题目编号分割开
        String topicId[]=paper.getTopicId().split(",");
        //开始判断每道题的错误
        int score=0;//定义分数
        List list=new ArrayList<TopicReport>();
        for(int i=0;i<topicId.length;i++){
            //成绩题目对象
            TopicReport topicReport=new TopicReport();
            //根据题目id找到该题目
            Topic topic=topicRepository.findById(Integer.parseInt(topicId[i]));
            if(topic.getAnswer().equals(answers[i])){
                score=score+10;
            }
            //把题目标题分割开来
            String title[]=topic.getTitle().split(";");
            Topic topic1=new Topic();
            topic1.setTitle(title[0]);
            //存取正确答案
            topic1.setAnswer(topic.getAnswer());
            //存答案题目头
            topicReport.setAnswerA(title[1]);
            topicReport.setAnswerB(title[2]);
            topicReport.setAnswerC(title[3]);
            topicReport.setAnswerD(title[4]);
            //存用户答案
            topicReport.setAnswer(answers[i]);
            topicReport.setTopic(topic1);
            list.add(topicReport);
        }
        //生成试卷
        Report report=new Report();
        //存取新成绩单的属性
        report.setPaperId(id);
        report.setRanswer(answer);
        report.setTitle(paper.getTitle());
        report.setSubject(paper.getType());
        report.setSum(10);
        report.setAchievement(score);
        report.setAddtime(new Date(System.currentTimeMillis()));
        if(username.equals("")){
            report.setUserId(0);
        }else{
            User user=userRepository.findByName(username);
            //增加积分
            if(score>=60){
                user.setJifen(user.getJifen()+10);
                userRepository.save(user);
                request.getSession().setAttribute("user",user);
            }
            report.setUserId(user.getId());
        }
        //保存成绩单
        reportRepository.save(report);
        request.setAttribute("title",paper.getTitle());
        request.setAttribute("achievement",score);
        request.setAttribute("userTopicReport",list);
        return "user/user_report_result";
    }

    @RequestMapping(value="/reportCount")
    public String reportCount(@RequestParam(value="id") int id,
                              HttpServletRequest request){
    int count=reportRepository.countByUserId(id);
    request.setAttribute("reportCount",count);
    return "user/profile";
    }
    /**
     *上传文件
     * @param fileUpload
     * @param name
     * @param request
     * @return
     */
    @RequestMapping("/upload")
    public String upload(MultipartFile fileUpload,
                         @RequestParam(value = "name") String name,
                         HttpServletRequest request) {
        //获取文件名
        String fileName = fileUpload.getOriginalFilename();
        //获取文件后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        //重新生成文件名
        fileName = UUID.randomUUID() + suffixName;
        //指定本地文件夹存储图片
        String filePath = "C:/Users/Dream/IdeaProjects/exam/src/main/webapp/images/";
        try {
            //将图片保存到static文件夹里
            fileUpload.transferTo(new File(filePath + fileName));
            User user=userRepository.findByName(name);
            user.setImg("/images/"+fileName);
            userRepository.save(user);
            request.getSession().setAttribute("user",user);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return "user/profile";
    }
}
