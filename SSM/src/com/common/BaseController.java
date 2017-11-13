package com.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 * @author dsy
 *
 */
public class BaseController {
	
	
	/*
	protected HttpServletRequest request;
	
	protected HttpServletResponse response;
	

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	*/
	/**
     * 得到日志
     */
    public Logger getLog()
    {
        return Logger.getLogger(this.getClass());
    }

	
	
	
	
	

}
