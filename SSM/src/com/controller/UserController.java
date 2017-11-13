package com.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;
import javax.xml.ws.Response;

import org.apache.catalina.User;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.common.BaseController;
import com.common.ExportExcel;
import com.common.RequestPramsUtils;
import com.entity.SysUser;
import com.service.SysUserService;


/**
 * 
 * @author dsy
 *
 */
@Controller
@RequestMapping("/")
public class UserController extends BaseController{
	
	
	

	@Autowired
	SysUserService sus;
	
	/**
	 * 
	 * @method:进入首页
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月24日下午4:40:33
	 */
	@RequestMapping("index.do")
	public String toIndex(){
		
		return "login";
	}
	
	/**
	 * @method:登录
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月24日下午6:29:29
	 */
	@RequestMapping("login.do")
	public String doLogin(HttpServletRequest request,SysUser user) throws Exception{
		SysUser u = sus.doFindUser(user);
		
		if(u == null){
			return "failure";
		}
		request.getSession().setAttribute("user",u);
		return "success";
	}
	
	/**
	 * @method:查询用户列表
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月30日上午11:17:58
	 */
	@ResponseBody
	@RequestMapping(value="searchUsers.do",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public String doSearchUsers(HttpServletResponse response,HttpServletRequest request) throws Exception{
		
		/*String loginName = new String(user.getLoginName().getBytes("ISO8859-1"),"UTF-8");
		user.setLoginName(loginName);*/
		//Map<String, Object> map = new HashMap<String, Object>();
		//String name = new String(user.getName().getBytes("ISO8859-1"),"UTF-8");
		//String name = URLDecoder.decode(user.getLoginName(),"UTF-8");
		//user.setLoginName(name);
		//HSSFWorkbook wb = new HSSFWorkbook();
		//ExportExcel.exportFile(wb, list);
		//PrintWriter out = response.getWriter();
		//JSON json = (JSON)JSON.toJSON(list);
		//map.put("1", json);
		//System.out.println(json);
		//String listJson = JSON.toJSONString(list);
		//out.print("-1");
		
		SysUser user = (SysUser) RequestPramsUtils.getParams(request, SysUser.class);
		List<SysUser> list = sus.doFindUsersList(user);
		String jsonList = JSONObject.toJSONString(list);
		return jsonList;
	}
	
	/**
	 * @method:增加多条用户记录
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年11月12日下午10:55:29
	 */
	public String addUserBOList() throws Exception{
		List<SysUser> list = new ArrayList<SysUser>();
		SysUser u1 = new SysUser();
		u1.setUserId("11");
		u1.setLoginName("ssss");
		u1.setPassWord("yyyy");
		u1.setUserNo("123");
		list.add(u1);
		SysUser u2 = new SysUser();
		u2.setUserId("11");
		u2.setLoginName("ssss");
		u2.setPassWord("yyyy");
		u2.setUserNo("1234");
		list.add(u2);
		
		Integer count = 0; 
		try {
			count = sus.insertList(list);
		} catch (Exception e) {
			count = -1;
			getLog().error(e);
		}
		System.out.println(count);		
		return null;
	}
}
