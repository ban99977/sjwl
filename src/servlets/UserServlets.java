package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.UserDaoImpl;
import entity.User;

public class UserServlets extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String opr=request.getParameter("opr");
		if(opr.equals("reg")){
			User user=new User();
			user.setUsername(request.getParameter("user"));
			user.setPassword(request.getParameter("psw"));
			user.setCellphone(request.getParameter("phone"));
			user.setEmail(request.getParameter("email"));
			UserDaoImpl udi=new UserDaoImpl();	
			int result=udi.insert(user);
			if(result==1){
				out.print("<script>alert('注册成功！');location.href='index.jsp';</script>");
			}else{
				out.print("<script>alert('●︿●用户名已存在，请重新注册！');location.href='register.jsp';</script>");
			}
			
		}else if(opr.equals("login")){
			User user=new User();
			UserDaoImpl udi=new UserDaoImpl();	
			user.setUsername(request.getParameter("user"));
			user.setPassword(request.getParameter("psw"));
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			
			User u=udi.findUser(user);
			if(u==null){
				out.print("<script>alert('用户名或密码错误');location.href='login.jsp';</script>");
			}else{
				request.getSession().setAttribute("username", user.getUsername());
				response.sendRedirect("index.jsp");
			}
			
		}else if(opr.equals("exit")){
			request.getSession().removeAttribute("username");
			response.sendRedirect(request.getHeader("Referer"));
			
		}
		else if(opr.equals("contrologin"))//管理员登录
		{
			User user=new User();
			UserDaoImpl udi=new UserDaoImpl();	
			user.setUsername(request.getParameter("user"));
			user.setPassword(request.getParameter("psw"));
			User u=udi.findUser(user);
			System.out.println(user.getUsername());
			if(u==null||!(user.getUsername().equalsIgnoreCase("admin"))){
				out.print("<script>alert('用户名或密码错误');location.href='adminlogin.jsp';</script>");
			}else{
				request.getSession().setAttribute("username", user.getUsername());
				response.sendRedirect("admin.jsp");
			}
		}else if(opr.equals("list")){
			UserDaoImpl udi=new UserDaoImpl();
			List<User> listuser=udi.getAll();
			request.getSession().setAttribute("listuser", listuser);
			response.sendRedirect("control.jsp");
		}else if(opr.equals("fuzzy")){
			UserDaoImpl udi=new UserDaoImpl();
			String un=request.getParameter("un");
			List<User> listuser=udi.getUserByName(un);
			request.getSession().setAttribute("listuser", listuser);
			response.sendRedirect("control.jsp");
				
		}else if(opr.equals("del")){
			UserDaoImpl udi=new UserDaoImpl();
			String un=request.getParameter("username");
			User user=new User();
			user.setUsername(un);
			int result=udi.delete(user);
			if(result==1){
				out.print("<script>alert('删除成功！');location.href='UserServlets?opr=list';</script>");
			}else{
				out.print("<script>alert('删除失败！');location.href='UserServlets?opr=list';</script>");
			}
		}else if(opr.equals("mdel")){
			String[] values=request.getParameterValues("chb");
			try{
				for(String un:values){
					UserDaoImpl udi=new UserDaoImpl();
					User user=new User();
					user.setUsername(un);
					udi.delete(user);
				}
				
				out.print("<script>alert('删除成功！');location.href='UserServlets?opr=list';</script>");
			}catch(Exception e){
				out.print("<script>alert('删除失败！');location.href='UserServlets?opr=list';</script>");
			}
		
		}else if(opr.equals("update")){
			String un=request.getParameter("un");
			String pwd=request.getParameter("password");
			String cellphone=request.getParameter("cellphone");
			String email=request.getParameter("email");
			UserDaoImpl udi=new UserDaoImpl();
			User user=new User();
			user.setUsername(un);
			user.setPassword(pwd);
			user.setCellphone(cellphone);
			System.out.println(user.getCellphone());
			user.setEmail(email);
			int result=udi.update(user);
			if(result==1){
				out.print("<script>alert('修改成功！');location.href='UserServlets?opr=list';</script>");
		    }else{
		    	out.print("<script>alert('修改失败！');location.href='UserServlets?opr=list';</script>");
			}
		}
	}




	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
