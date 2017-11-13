package com.entity;


public class SysUser {
	
	// id
	private String userId;
	
	// 登录名
	private String loginName;
	
	// 密码
	private String passWord;
	
	// 工号
	private String userNo;
	
	// 姓名
	private String name;
	
	// 邮箱
	private String email;
	
	// 手机
	private String phone;
	
	// 用户类型
	private String userType;
	
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public SysUser() {
		super();
		
	}
	public SysUser(String userId, String loginName, String passWord) {
		super();
		this.userId = userId;
		this.loginName = loginName;
		this.passWord = passWord;
	}
	
	



	
	
	

}
