package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	public int insert(User user);
	public int update(User user);
	public int delete(User user);
	public List<User> getAll();   //查询全部
	public User findUser(User user);//用于登陆判断
	public User getUserByName1(String username);//用于查找购物车的用户邮箱
	public List<User> getUserByName(String user);
	public int  torder(String username);//用于将购物车物品转为订单
	public int  torder2(String username);
	public int  torder3(String username);
}
