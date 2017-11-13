package com.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;





/**
 * @author dsy
 *
 */
public final class CommonUtil {
	
	
	/**
	 * @method:清除response缓存
	 * @author:DSY
	 * @param:
	 * @return:
	 * @Time:2017年10月27日下午2:40:26
	 */
    private static void clearRespCache(HttpServletResponse response){
        // 清除HTTP缓存
        HttpServletResponse httpResp = (HttpServletResponse) response;
        httpResp.setCharacterEncoding("UTF-8");
        httpResp.setContentType("text/html; charset=UTF-8");
        httpResp.setHeader("Cache-Control", "no-store");
        httpResp.setHeader("Pragma", "no-cache");
        httpResp.setDateHeader("Expires", 0);

    }
	
    
    /**
     * @method:可以是各种类型（object）的数据格式通过默认的编码换成bytes字节形式输出到前台，可以是json字符串，json对象
     * @author:DSY
     * @param:
     * @return:
     * @Time:2017年10月27日下午2:40:39
     */
	public static void jsonResult(Object o,HttpServletResponse response) throws IOException{
		
		clearRespCache(response);
		PrintWriter out = response.getWriter();
		out.print(o);
		out.flush();
		out.close();
	}
}
