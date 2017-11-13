package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SysUserDao;
import com.entity.SysUser;
import com.service.SysUserService;

/**
 * @author dsy
 *
 */
@Service
public class SysUserServiceImpl implements SysUserService{
	
	
	@Autowired
	private SysUserDao dao;
	
	
	/**
	 * 
	 * @method:查找用户
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月24日下午5:00:44
	 */
	public SysUser doFindUser(SysUser u){
		
		return dao.doFindUser(u);
	}
	
	
	/**
	 * @method:模糊查询列表
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月26日上午12:31:42
	 */
	public List<SysUser> doFindUsersList(SysUser u){
		
		return dao.doFindUsersList(u);
	}
	
	/**
	 * @method:新增实体
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年11月8日下午6:52:19
	 */
	public int insertBO(SysUser u) throws Exception{
		
		return dao.insertBO(u);
	}
	
	/**
	 * @method:批量新增
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年11月9日下午3:28:50
	 */
	public Integer insertList(List<SysUser> userList) throws Exception{
		
		Integer count = 0;
		for(SysUser user : userList){
			count += dao.insertBO(user);
		}
		return count;
	}
	
	
}
