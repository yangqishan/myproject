package com.etc.exam.Utils;

import com.etc.exam.Bean.Admin;
import com.etc.exam.Bean.Report;
import com.etc.exam.Bean.User;
import com.etc.exam.Bean.UserReport;
import com.etc.exam.ReportDao.ReportRepository;
import com.etc.exam.UserDao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(filterName="myFilter",urlPatterns="/*")
public class MyFilter implements Filter{

    @Autowired
    private ReportRepository reportRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        System.out.println("MyFilter init............");
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // 请求的uri
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpServletResponse response1 = (HttpServletResponse) response;
        String url=request1.getRequestURI();
        if(url.equals("/user/user_login.jsp")||url.equals("/user/user_registered.jsp")||url.equals("/user/")||url.equals("/admin/")||url.contains("userReportAnalysis")||url.contains("/gt/register1")||url.contains("userRregistered")||url.contains("findByName")||url.contains("logincheck")||url.contains(".css")||url.contains(".js")||url.contains(".jpg")||url.contains(".png")||url.contains("userExam")||url.contains("checkPpaer")||url.contains(".ico")||url.contains("font")||url.contains(".svg")||url.contains(".html")){
            find(request1,response1);
            chain.doFilter(request,response);
        }else{
            String username= (String)request1.getSession().getAttribute("username");
            Admin admin=(Admin)request1.getSession().getAttribute("admin");
            if(username!=null||admin!=null){
                chain.doFilter(request,response);
            }else{
                if(url.contains("admin")){
                    request1.getRequestDispatcher("/admin/").forward(request, response);
                }else {
                    request1.getRequestDispatcher("/user/").forward(request, response);
                }
            }

        }

    }
    public void find(HttpServletRequest request, HttpServletResponse response){
    //各科通过率
    String []g={"语文","数学","英语","物理","化学","地理","生物","政治","历史"};
    List list=new ArrayList<Report>();
    for(int i=0;i<g.length;i++){
        Report reports=new Report();
        double sum=reportRepository.countBySubjectAndAchievementGreaterThan(g[i],0);
        double sum1=reportRepository.countBySubjectAndAchievementGreaterThan(g[i],60);
       int percent= (int)(sum1*100/sum);
       reports.setSubject(g[i]);
       reports.setSum(percent);
       list.add(reports);
    }
        request.getSession().setAttribute("percent",list);
        //高分榜排名
        List lists=new ArrayList<UserReport>();
        list=reportRepository.findAllByOrderByAchievementDesc();
        for(int j=0;j<list.size();j++){
            UserReport userreport=new UserReport();
            Report report=(Report) list.get(j);
            if(report.getUserId()==0){
                userreport.setName("无名");
                userreport.setReport(report);
            }else{
                User user=userRepository.findById(report.getUserId());
                userreport.setName(user.getName());
                report.setRanswer(user.getImg());
                userreport.setReport(report);
            }

            lists.add(userreport);
        }
        request.getSession().setAttribute("highscore",lists);
        List list2=new ArrayList<User>();
        list2=userRepository.findAll();
        //计算每个用户的考试次数
        for(int k=0;k<list2.size();k++){
            User user=(User)list2.get(k);
            user.setJifen(reportRepository.countByUserId(user.getId()));
        }
        //进行冒泡排序(竞技排行)
        for(int k=0;k<list2.size();k++){
            User user=(User)list2.get(k);
            for(int j=k+1;j<list2.size();j++){
                User user1=(User)list2.get(j);
                User user2;
                if(user1.getJifen()>=user.getJifen()){
                    user2=user1;
                    user1=user;
                    user=user2;
                }
            }
        }
        request.getSession().setAttribute("highnum",list2);
        //用户积分排名
        Pageable pageable= PageRequest.of(0,5);
        Page<User> list3=userRepository.findAllByOrderByJifenDesc(pageable);
        request.getSession().setAttribute("highjifen",list3);
    }
    @Override
    public void destroy() {
        System.out.println("MyFilter destroy..........");
    }

}
