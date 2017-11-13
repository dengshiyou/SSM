package com.dao;

import java.util.List;

import com.entity.SysUser;

/**
 * @author dsy
 *
 */
public interface SysUserDao {
	
	/**
	 * 
	 * @method:查找用户
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月24日下午5:00:44
	 */
	public SysUser doFindUser(SysUser u);
	
	/**
	 * @method:模糊查询列表
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月26日上午12:31:42
	 */
	public List<SysUser> doFindUsersList(SysUser u);
	
	/**
	 * @method:新增实体
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年11月8日下午6:52:19
	 */
	public Integer insertBO(SysUser u) throws Exception;
}
