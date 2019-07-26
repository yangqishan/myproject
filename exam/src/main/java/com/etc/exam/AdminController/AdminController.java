package com.etc.exam.AdminController;


import com.etc.exam.AdminDao.AdminRepository;
import com.etc.exam.Bean.*;
import com.etc.exam.PaperDao.PaperRepository;
import com.etc.exam.ReportDao.ReportRepository;
import com.etc.exam.TopicDao.TopicRepository;
import com.etc.exam.UserDao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
@Controller
@RequestMapping(value = "admin")
public class AdminController {

    /**
     * 管理员接口jpa
     */
    @Autowired
    private AdminRepository  adminRepository;
    /**
     * 成绩单接口jpa
     */
    @Autowired
    private ReportRepository reportRepository;
    /**
     * 用户接口jpa
     */
    @Autowired
    private UserRepository userRepository;
    /**
     * 题目接口jpa
     */
    @Autowired
    private TopicRepository topicRepository;
    /**
     * 试卷jpa
     */
    @Autowired
    private PaperRepository paperRepository;


    int pageSize=10;
    @RequestMapping(value = {"/","/login"})
    public String login(){
        return "admin/login";
    }

    /**
     * 验证管理员信息
     * @param name
     * @param pswd
     * @param request
     * @return
     */
    @PostMapping(value = "/logincheck")
    @ResponseBody
    public int logincheck(@RequestParam(value = "name") String name,
                          @RequestParam(value = "pswd") String pswd,
                          @RequestParam(value = "pagerandom") String pagerandom,
                          HttpServletRequest request
                    ){

        Admin admin=adminRepository.findByName(name);
        //验证码信息
        String random=request.getSession().getAttribute("random").toString();
        if(admin!=null&&admin.getPswd().equals(pswd)&&random.equals(pagerandom)) {
            request.getSession().setAttribute("admin",admin);
            //将管理员信息存入session中
        return 1;
        }else if(!random.equals(pagerandom)){
            return 2;
        }else{
            return 0;
        }

    }

    /**
     * 跳主页面
     * @return
     */
    @GetMapping(value="/find")
        public String find(){
        return "/admin/main";
      }

    /**
     * 管理员退出
     * @param request
     * @return
     */
      @RequestMapping(value = "/adminout")
      public String adminOut(HttpServletRequest request){
          request.getSession().removeAttribute("username");
          request.getSession().removeAttribute("user");
          /*清除admin*/
          request.getSession().removeAttribute("admin");

            return "admin/login";
      }

    /**
     * 修改密码
     * @param name
     * @param pswd
     * @param request
     * @return
     */
      @PostMapping(value = "/pswdupdate")
      @ResponseBody
      public int pswdupdate(@RequestParam(value = "name") String name,
                             @RequestParam(value = "pswd") String pswd,
                             HttpServletRequest request){
          Admin admin=adminRepository.findByName(name);
          /*修改信息*/
          /*request.getSession().setAttribute("password",pswd);*/
          admin.setPswd(pswd);
          /*清除admin*/
          request.getSession().removeAttribute("admin");
          adminRepository.save(admin);
          return 1;
      }
    /**
     * 用户积分排名
     */
      @RequestMapping(value="/userJifen")
      @ResponseBody
      public int userJifen(@RequestParam(value = "pageNow",defaultValue = "") String ispageNow,
              HttpServletRequest request){
          int pageNow=0;
          if(ispageNow!=null&&ispageNow.length()>0){
              pageNow=Integer.parseInt(ispageNow);

          }
        Pageable pageable=PageRequest.of(pageNow,pageSize);
        Page<User> list=userRepository.findAllByOrderByJifenDesc(pageable);
        request.getSession().setAttribute("user",list);
        return 1;
      }

    /**
     * 查询全部用户信息
     * @param ispageNow
     * @param search
     * @param request
     * @return
     */
      @PostMapping(value="/finduser")
      @ResponseBody
      public int finduser(@RequestParam(value = "pageNow",defaultValue = "") String ispageNow,
                           @RequestParam(value = "search",defaultValue = "") String search,
                           HttpServletRequest request) {
          int pageNow=0;
          if(ispageNow!=null&&ispageNow.length()>0){
              pageNow=Integer.parseInt(ispageNow);

          }
          Page<User> list;
          int count;
          Pageable pageable=PageRequest.of(pageNow,pageSize);
          if(search.equals("")) {
              /*查询所有用户*/
              count = (int) userRepository.count();
              list = userRepository.findAll(pageable);
              request.getSession().removeAttribute("search");
          }else{
              /*模糊查询符合的数据*/
              list=userRepository.findByNameLikeOrGradeLikeOrLevelLike("%"+search+"%","%"+search+"%","%"+search+"%",pageable);
              count=userRepository.countByNameLikeOrGradeLikeOrLevelLike("%"+search+"%","%"+search+"%","%"+search+"%");
              request.getSession().setAttribute("search",search);
              if(list.getTotalPages()==0){
                  /*判断是否有该用户*/
                  return 0;
              }
          }
          /*将用户信息存入session中*/
          request.getSession().setAttribute("user",list);
          request.getSession().setAttribute("pageNow",pageNow);
          request.getSession().setAttribute("totalPages",list.getTotalPages());
          //将用户数量存入session中
          request.getSession().setAttribute("usercount",count);
                  return 1;
      }

    /**
     * 根据id查询用户信息
     * @param id
     * @param request
     * @return
     */
    @PostMapping(value = "/findbyid")
    @ResponseBody
    public int findbyid(@RequestParam(value = "id") int id,
                        HttpServletRequest request){
          User user=new User();
        //根据id查用户
          user=userRepository.findById(id);
          request.getSession().setAttribute("userone",user);
          return 1;
      }

    /**
     * 根据用户id查询成绩单
     * @param userId
     * @param request
     * @return
     */
    @PostMapping(value = "/findreportbyuser_id")
    @ResponseBody
    public int findreportbyuser_id(@RequestParam(value = "id") int userId,
                                   HttpServletRequest request){
        List list=new ArrayList<Report>();
        list=reportRepository.findReportByUserId(userId);
        //根据userid查询成绩单
        request.getSession().setAttribute("report",list);
        return 1;
    }

    /**
     * 用户分析
     * @param request
     */
    @PostMapping(value = "/userAnalysis")
    @ResponseBody
    public void userAnalysis(HttpServletRequest request){
        int man=userRepository.countBySex("男");
        int women=userRepository.countBySex("女");
        int one=userRepository.countByGrade("高一");
        int two=userRepository.countByGrade("高二");
        int three=userRepository.countByGrade("高三");
        request.getSession().setAttribute("man",man);
        request.getSession().setAttribute("women",women);
        request.getSession().setAttribute("one",one);
        request.getSession().setAttribute("two",two);
        request.getSession().setAttribute("three",three);
    }

    /**
     * 查询所有题目
     * @param ispageNow
     * @param search
     * @param request
     * @return
     */
    @RequestMapping(value="/findtopic")
    @ResponseBody
    public int findTopic(@RequestParam(value = "pageNow",defaultValue ="" ) String ispageNow,
                         @RequestParam(value = "search",defaultValue = "") String search,
                          HttpServletRequest request){
        int pageNow=0;
        if(ispageNow!=null&&ispageNow.length()>0){
            pageNow=Integer.parseInt(ispageNow);
        }
        Pageable pageable= PageRequest.of(pageNow,pageSize);
        Page<Topic> list;
        int topicCount;
        if(search.equals("")) {
            //查询所有题目
            list = topicRepository.findAll(pageable);
            topicCount=(int)topicRepository.count();
            request.getSession().removeAttribute("search");
        }else{
            //查询符合条件的数据
            list=topicRepository.findByTitleLikeOrTypeLike("%"+search+"%","%"+search+"%",pageable);
            //查询符合的题目数
            if(list.getTotalPages()==0){
                return 0;
            }
            topicCount=topicRepository.countByTitleLikeOrTypeLike("%"+search+"%","%"+search+"%");
            request.getSession().setAttribute("search",search);
        }

      request.getSession().setAttribute("topic",list);
      request.getSession().setAttribute("pageNow",pageNow);
      request.getSession().setAttribute("totalPages",list.getTotalPages());
      request.getSession().setAttribute("topiccount",topicCount);
      return 1;
    }

    /**
     * 修改题目的状态
     * @param id
     * @param status
     */
    @PostMapping(value = "topicStatus")
    @ResponseBody
    public void topicStatus(@RequestParam("id") int id,@RequestParam("status") int status){

        Topic topic=new Topic();
        //查询改题目
        topic=topicRepository.findById(id);
        //修改状态
        topic.setFlag(status);
        topicRepository.save(topic);
    }

    /**
     * 修改题目的属性
     * @param id
     * @param title
     * @param type
     * @param grade
     * @param answer
     * @param memo
     * @param mark
     * @param level
     * @return
     */
    @PostMapping(value = "/topicEdit")
    @ResponseBody
    public int topicUpdata(@RequestParam("id") int id,
                           @RequestParam("title") String title,
                           @RequestParam("type") String type,
                           @RequestParam("grade") String grade,
                           @RequestParam("answer") String answer,
                           @RequestParam("memo") String memo,
                           @RequestParam("mark") int mark,
                           @RequestParam("level") String level
                           ){
        Topic topic=new Topic();
        if(id!=0) {
            topic = topicRepository.findById(id);
        }else{
            topic.setFlag(1);
        }
        topic.setTitle(title);
        topic.setType(type);
        topic.setGrade(grade);
        topic.setAnswer(answer);
        topic.setMemo(memo);
        topic.setMark(mark);
        topic.setLevel(level);
        topicRepository.save(topic);//保存数据
        return 1;
    }

    /**
     * 删除题目
     * @param id
     * @param request
     * @return
     */
    @PostMapping(value="/topicDelete")
    @ResponseBody
    public int topicDelete(@RequestParam("id") int id,HttpServletRequest request){
        //根据id删除
        topicRepository.deleteById(id);
        List list=new ArrayList<Topic>();
        //查询所有题目
        list=topicRepository.findAll();

        request.getSession().setAttribute("topic",list);
        int topiccount=(int)topicRepository.count();
        request.getSession().setAttribute("topiccount",topiccount);
        return 1;
    }

    /**
     * 题库数据分析
     * @param request
     */
    @PostMapping(value="/topicAnalysis")
    @ResponseBody
    public void topicAnalysis(HttpServletRequest request){

        String l[]={"初级","中级","高级"};
        for(int j=0;j<=2;j++){
            request.getSession().setAttribute("level"+j,topicRepository.countByLevel(l[j]));
        }
        String g[]={"语文","数学","英语","物理","化学","生物","地理","历史","政治"};
        for(int i=0;i<=8;i++){
            request.getSession().setAttribute("grade"+i,topicRepository.countByType(g[i]));
        }
    }
    /**
     * 成绩单排名
     * @param request
     * @param subject
     */
    @RequestMapping(value = "/reportDesc")
    @ResponseBody
    public int reportDesc(HttpServletRequest request,
                           @RequestParam(value = "pageNow",defaultValue = "") String ispageNow,
                           @RequestParam(value ="subject") String subject){
           int pageNow=0;
        if(ispageNow!=null&&ispageNow.length()>0){
            pageNow=Integer.parseInt(ispageNow);
        }
        Pageable pageable=PageRequest.of(pageNow,pageSize);
        Page<Report> list=reportRepository.findAllBySubjectOrderByAchievementDesc(subject,pageable);
        List<UserReport> lists=new ArrayList<UserReport>();
        for(int i=0;i<list.getContent().size();i++){
            UserReport userReport=new UserReport();
            int uid=list.getContent().get(i).getUserId();
            if(uid!=0) {
                User user = userRepository.findById(uid);
                userReport.setName(user.getName());
                userReport.setReport(list.getContent().get(i));
                lists.add(userReport);
            }else {
               continue;
            }
        }
        request.getSession().setAttribute("pageNow",pageNow);
        request.getSession().setAttribute("subject",subject);
        request.getSession().setAttribute("totalPages",list.getTotalPages());
        request.getSession().setAttribute("lists",lists);
        return 1;
    }
    /**
     * 所有成绩单查询
     * @param ispageNow
     * @param search
     * @param request
     * @return
     */
    @PostMapping(value = "/findReport")
    @ResponseBody
    public int findReport(@RequestParam(value = "pageNow",defaultValue ="") String ispageNow,
            @RequestParam(value="search",defaultValue = "") String search,
            HttpServletRequest request){
        int pageNow=0;
        if(ispageNow!=null&&ispageNow.length()>0){
            pageNow=Integer.parseInt(ispageNow);
        }
        Pageable pageable=PageRequest.of(pageNow,pageSize);
        Page<Report> list;
        int reportcount;
        if(search.equals("")){
            //查询所有成绩单
            list=reportRepository.findAll(pageable);
            //查询成绩单数量
            reportcount=(int)reportRepository.count();
            request.getSession().removeAttribute("search");
        }else{
            User user=new User();
            user=userRepository.findByName(search);
            int id=-1;
            //模糊查询对象的成绩单与数量
            if(user!=null){
                id=user.getId();
            }
            list=reportRepository.findByUserIdOrTitleLikeOrSubjectLike(id,"%"+search+"%","%"+search+"%",pageable);
            reportcount=reportRepository.countByUserIdOrTitleLikeOrSubjectLike(id,"%"+search+"%","%"+search+"%");
            if(list.getTotalPages()==0){
                return 0;
            }
            request.getSession().setAttribute("search",search);
        }
        request.getSession().setAttribute("reportCount",reportcount);
        request.getSession().setAttribute("pageNow",pageNow);
        request.getSession().setAttribute("totalPages",list.getTotalPages());
        request.getSession().setAttribute("report",list);
        return 1;
    }
    /**
     * 根据成绩单id查询用户id和试卷的试题
     * @param id
     * @param request
     * @return
     */
    @PostMapping(value="/findReportbyId")
    @ResponseBody
    public int findReportbyId(@RequestParam("id") int id,HttpServletRequest request){
        Report report=new Report();
        User Ruser=new User();
        Paper Rpaper=new Paper();
        Topic topic=new Topic();

        //查到成绩单全部信息
        report=reportRepository.findReportById(id);
        //所有用户的答案
        String ranswer=report.getRanswer();
        String[] ran=ranswer.split(",");
        //根据用户id查询用户信息
        Ruser=userRepository.findById(report.getUserId());
        request.getSession().setAttribute("reportTime",report.getAddtime());
        request.getSession().setAttribute("reportTitle",report.getTitle());
        request.getSession().setAttribute("reportAchievement",report.getAchievement());
        if(Ruser==null){
            request.getSession().setAttribute("userReportName","游客");
        }else{
            request.getSession().setAttribute("userReportName",Ruser.getName());
        }

        //根据试卷id查询试卷信息
        Rpaper=paperRepository.findPaperById(report.getPaperId());
        //所有题目的id
        String rid=Rpaper.getTopicId();
        String[] an=rid.split(",");
        List list=new ArrayList<TopicReport>();
        for(int i=0;i<ran.length;i++){
            //找到所有题目
           TopicReport topicReport=new TopicReport();
           topicReport.setTopic(topicRepository.findById(Integer.parseInt(an[i])));
           topicReport.setAnswer(ran[i]);
           list.add(topicReport);
        }
        request.getSession().setAttribute("topicReport",list);
      return 1;
    }

    /**
     * 成绩单数据分析
     * @param request
     */
    @PostMapping(value = "/reportAnalysis")
    @ResponseBody
    public void reportAnalysis(HttpServletRequest request){

        String g[]={"语文","数学","英语","物理","化学","生物","地理","历史","政治"};
        String s[]={"高一","高二","高三"};
        for(int i=0;i<=2;i++) {
            for (int j = 0; j <= 8; j++) {
                int sum = 0;
                double sums = 0;
                List list = new ArrayList<Report>();
                Report report = new Report();
                sum = reportRepository.countByTitleLikeAndSubject("%"+s[i]+"%",g[j]);
                list = reportRepository.findByTitleLikeAndSubject("%"+s[i]+"%",g[j]);
                if(list==null||sum==0){
                    sums=0;
                    sum=1;
                }else {
                    for (int k = 0; k < list.size(); k++) {
                        report = (Report) list.get(k);
                        sums += report.getAchievement();
                    }
                }
                request.getSession().setAttribute("sums" +i+j, sums);
                request.getSession().setAttribute("sum" +i+j, sum);

            }
        }
    }

    /**
     * 查询试卷
     * @param ispageNow
     * @param search
     * @param request
     * @return
     */
    @PostMapping(value = "/findPaper")
    @ResponseBody
    public int findPaper(@RequestParam(value = "pageNow",defaultValue = "") String ispageNow,
                         @RequestParam(value = "search",defaultValue = "") String search,
                          HttpServletRequest request){
        int pageNow=0;
        if(ispageNow!=null&&ispageNow.length()>0){
            pageNow=Integer.parseInt(ispageNow);
        }
        Page<Paper> list;
        int papercount;
        Pageable pageable=PageRequest.of(pageNow,pageSize);
        if(search.equals("")){
            //查询所有的试卷
            list=paperRepository.findAllByOrderByAddtimeDesc(pageable);
            //记录试卷数量
            papercount=(int)paperRepository.count();
            request.getSession().removeAttribute("search");
        }else{
            list=paperRepository.findByTitleLikeOrTypeLike("%"+search+"%","%"+search+"%",pageable);
            if(list.getTotalPages()==0){
                return 0;
            }
            request.getSession().setAttribute("search",search);
           papercount=paperRepository.countByTitleLikeOrTypeLike("%"+search+"%","%"+search+"%");
        }
        request.getSession().setAttribute("paperCount",papercount);
        request.getSession().setAttribute("pageNow",pageNow);
        request.getSession().setAttribute("totalPages",list.getTotalPages());
        request.getSession().setAttribute("paper",list);
        return 1;
    }

    /**
     * 查询试卷详情
     * @param id
     * @param request
     * @return
     */
    @PostMapping(value = "/findPaperbyId")
    @ResponseBody
    public int findPaperbyId(@RequestParam(value = "id") int id,
                              HttpServletRequest request){
         Paper paper=new Paper();
         paper=paperRepository.findPaperById(id);
         //吧题目序号分开到数组中
         String t[]=paper.getTopicId().split(",");
         List list=new ArrayList<Topic>();
         for(int i=0;i<t.length;i++){
             Topic topic=new Topic();
             topic=topicRepository.findById(Integer.parseInt(t[i]));
             //把每个题目对象放到list表单中
             list.add(topic);
         }
     request.getSession().setAttribute("papertopic",list);
        return 1;
    }

    /**
     * 查找题目
     * @param request
     */
    @PostMapping(value = "/paperAdd")
    @ResponseBody
    public void paperAnalysis(HttpServletRequest request){

        List<Topic> list=topicRepository.findAll();
        int topicCount=(int)topicRepository.count();
        request.getSession().setAttribute("topic",list);
        request.getSession().setAttribute("topiccount",topicCount);

    }

    /**
     * 查询题目
     * @param search
     * @param request
     * @return
     */
    @RequestMapping(value="/searchtopic")
    @ResponseBody
    public int searchTopic(@RequestParam("search") String search,
                           HttpServletRequest request){
        List<Topic> list=topicRepository.findByTitleLikeOrTypeLike("%"+search+"%","%"+search+"%");
        int topiccount=topicRepository.countByTitleLikeOrTypeLike("%"+search+"%","%"+search+"%");
        if(list.size()==0){
            return 0;
        }else{
            request.getSession().setAttribute("topic",list);
             request.getSession().setAttribute("topiccount",topiccount);
            return 1;
        }
    }

    /**
     * 随机生成试卷
     * @param israndom
     * @param subject
     * @param request
     * @return
     */
    @PostMapping(value = "/addPaper")
    @ResponseBody
    public int addPaper(@RequestParam(value = "israndom") int israndom,
                        @RequestParam(value = "subject") String subject,
                        HttpServletRequest request){
     List list=new ArrayList<Topic>();
     Paper paper=new Paper();
     String t="";
        if(israndom==0){
            list=topicRepository.findByTypeAndFlag(subject,1);
            Random ran = new Random(10);
           //使用种子为10的Random对象生成[0,10)内随机整数序列
            Topic topic=new Topic();
            for (int i = 0; i < 10; i++) {
                topic=(Topic)list.get(ran.nextInt(10));
                 t+=topic.getId()+",";

            }
            paper.setTopicId(t);
            paper.setIsrandom(0);
            paper.setType(subject);
            paper.setGrade("高二");
            paper.setTitle(subject+"模拟试卷");
            paper.setAddtime(new Date(System.currentTimeMillis()));
            paperRepository.save(paper);
        }else{

        }
        Pageable pageable=PageRequest.of(0,pageSize);
        Page<Paper> list1=paperRepository.findAllByOrderByAddtimeDesc(pageable);
        int papercount=(int)paperRepository.count();
        request.getSession().setAttribute("paperCount",papercount);
        request.getSession().setAttribute("paper",list1);
        return 1;
    }

    /**
     * 手动添加试卷
     * @param topicId
     * @param subject
     * @return
     */
    @RequestMapping(value = "/addPapers")
    @ResponseBody
    public int addPapers(@RequestParam("sum") String topicId,
                         @RequestParam("subject") String subject){

        Paper paper=new Paper();
        //设置试卷的属性
        paper.setTopicId(topicId);
        paper.setIsrandom(1);
        paper.setAddtime(new Date(System.currentTimeMillis()));
        paper.setType(subject);
        paper.setTitle(subject+"模拟试卷");
        paper.setGrade("高三");
        //存入试卷到数据库
        paperRepository.save(paper);
        return 1;
    }
}
