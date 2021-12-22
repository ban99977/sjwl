package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.BaseDao;
import dao.DealDao;
import entity.Deal;

public class DealDaoImpl extends BaseDao implements DealDao{

	@Override
	public List<Deal> getAll() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=this.getConnection();
			String sql="select * from deal";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			List<Deal> list=new ArrayList<Deal>();
			while(rs.next()){
				Deal c=new Deal();
				c.setId(rs.getString("id"));
				c.setGid(rs.getString("gid"));
				c.setImg(rs.getString("img"));
				c.setName(rs.getString("name"));
				c.setType(rs.getString("type"));
				c.setPrice(rs.getDouble(("price")));
				c.setNum(rs.getInt("num"));
				c.setTime(rs.getTimestamp("time"));
				list.add(c);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return null;
	}

	@Override
	public List<Deal> getDealByName(String gid) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=this.getConnection();
			String sql="select * from Deal where gid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			rs=pstmt.executeQuery();
			List<Deal> list=new ArrayList<Deal>();
			while(rs.next()){
				Deal c=new Deal();
				c.setId(rs.getString("id"));
				c.setGid(rs.getString("gid"));
				c.setImg(rs.getString("img"));
				c.setName(rs.getString("name"));
				c.setType(rs.getString("type"));
				c.setPrice(rs.getDouble(("price")));
				c.setNum(rs.getInt("num"));
				c.setTime(rs.getTimestamp("time"));
				list.add(c);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return null;
	}


}
