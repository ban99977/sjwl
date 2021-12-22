package dao;

import java.util.List;
import entity.Deal;
public interface DealDao {
	//public List<Deal> getDealById(Deal deal);
	public List<Deal> getAll();
	public List<Deal> getDealByName(String gid);
}

