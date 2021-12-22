package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.User;
import entity.Sendmail;
import dao.UserDao;
import dao.impl.UserDaoImpl;

public class SendMailServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
        try{
            String username = request.getParameter("username");
            System.out.println(username);
            UserDaoImpl userd = new UserDaoImpl();
            User user=userd.getUserByName1(username);
           int ts=userd.torder(username);
           int ts2=userd.torder2(username);
           int ts3=userd.torder3(username);
            //转移购物车的物品到deal表中
            
            System.out.println(user.getEmail());
            //发送邮件是一件非常耗时的事情，因此这里开辟了另一个线程来专门发送邮件
            Sendmail send = new Sendmail(user);
            //启动线程，线程启动之后就会执行run方法来发送邮件
            send.start();

            //注册用户
            //new UserService().registerUser(user);
            //request.setAttribute("message", " ");
            out.print("<script>alert('发送成功');</script>");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }catch (Exception e) {
            e.printStackTrace();
            out.print("<script>alert('发送失败,邮箱错误');</script>");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}