package entity;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import entity.User;
public class Sendmail extends Thread {
        //用于给用户发送邮件的邮箱
    private String from = "ban99977@163.com";
        //邮箱的用户名
    private String username = "ban99977";
        //邮箱的密码
    private String password = "ECFUDRZORLCUKUTP";
        //发送邮件的服务器地址
    private String host = "smtp.163.com";

    private User user;
    public Sendmail(User user){
        this.user = user;
    }

    /* 重写run方法的实现，在run方法中发送邮件给指定的用户
     * @see java.lang.Thread#run()
     */
    @Override
    public void run() {
        try{
            Properties prop = new Properties();//获得系统属性对象
            prop.setProperty("mail.host", host);//设置SMTP主机
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");//同时通过验证
            Session session = Session.getInstance(prop);
            session.setDebug(true);
            Transport ts = session.getTransport();
            ts.connect(host, username, password);
            Message message = createEmail(session,user);
            ts.sendMessage(message, message.getAllRecipients());
            ts.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Message createEmail(Session session,User user) throws Exception{

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
        message.setSubject("发货通知邮件");

        //String info = "恭喜您注册成功，您的用户名：" + user.getUsername() + ",您的密码：" + user.getPassword() + "，请妥善保管!";
        String info = "购买成功发货提示！请留意您的手机信息提醒派送取件！如有问题请联系网站客服!";
        message.setContent(info, "text/html;charset=UTF-8");
        message.saveChanges();
        return message;
    }
}