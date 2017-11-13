package com.common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import com.alibaba.fastjson.JSONObject;

/**
 * @author dsy
 * 
 */
public class RequestPramsUtils {

	/**
	 * 将请求的参数 封装成 目标对象
	 * 
	 * @return
	 */
	public static Object getParams(HttpServletRequest request, Class<?> clazz) {
		Map<String, String> outMap = null;
		// 得到参数的map
		Map<String, String[]> inputMap = request.getParameterMap();

		if (null != inputMap) {
			outMap = new HashMap<String, String>();
		}
		Iterator<Entry<String, String[]>> it = inputMap.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, String[]> entry = it.next();
			String key = entry.getKey();
			Object value = entry.getValue();
			if (value instanceof String[]) {
				String strArray = strJoin((String[]) value, ",");
				outMap.put(key, isNull(strArray));
			}
		}
		String jsonString = JSONObject.toJSONString(outMap);
		Object object = JSONObject.parseObject(jsonString, clazz);

		return object;
	}

	/**
	 * 如果是空，那么就赋值为0
	 * 
	 * @param integer
	 * @return
	 */
	public static Integer emptyToZero(Integer integer) {
		if (integer == null) {
			integer = 0;
		}
		return integer;
	}

	/**
	 * 日期转换成Timestamp
	 * 
	 * @return
	 */
	public static Timestamp dateToTimestamp(Date dataStr) {

		if (dataStr != null && !"".equals(isNull(dataStr))) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = df.format(dataStr);
			Timestamp ts = Timestamp.valueOf(time);
			return ts;
		} else {
			return null;
		}

	}

	/**
	 * 日期转换成Timestamp
	 * 
	 * @return
	 */
	public static Timestamp dateToTimestamp2(String dataStr) {
		if (dataStr != null && !"".equals(dataStr)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date date = null;
			try {
				date = sdf.parse(dataStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp ts = dateToTimestamp(date);
			return ts;
		} else {
			return null;
		}

	}

	/**
	 * 字符串转换成日期
	 * 
	 * @return
	 */
	public static Timestamp stringToTimestamp(String dataStr) {
		if (dataStr != null && !"".equals(dataStr)) {
			if (10 == dataStr.trim().length()) {
				dataStr += " 00:00:00";
			}
			return Timestamp.valueOf(dataStr);
		} else {
			return null;
		}

	}

	/**
	 * 把数字转换成都好隔开的字符串
	 * 
	 * @return
	 */
	public static String strJoin(String[] value, String p) {
		String result = "";
		if (value.length > 1) {
			for (String str : value) {
				result += urlURLDecoder(str.trim()) + p;
			}
			if (!"".equals(result) && result.endsWith(",")) {
				result = deleteEnd(result);
			}
		} else {
			result = urlURLDecoder(value[0]);
		}
		return result;
	}

	/**
	 * 去掉最后面的逗号
	 * 
	 * @return
	 */
	public static String deleteEnd(String str) {
		if (str != null && !"".equals(str)) {
			if (str.endsWith(",")) {
				str = str.substring(0, str.length() - 1);
			}
		}
		return str;
	}

	/**
	 * 空转换成空字符串
	 * 
	 * @param obj
	 * @return
	 */
	public static String isNull(Object obj) {
		if (obj == null) {
			return "";
		} else {
			String str = obj.toString();

			str = str.replaceAll("<", "&lt;");
			str = str.replaceAll(">", "&gt;");
			str = str.replaceAll("\"", "&quot;");

			return str;
		}
	}

	/**
	 * 对请求参数进行解码
	 * 
	 * @param paramStr
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String urlURLDecoder(String paramStr) {
		try {
			paramStr = URLDecoder.decode(URLDecoder.decode(paramStr, "UTF-8"),
					"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return paramStr;
	}

	/**
	 * 是否有效的日期
	 * 
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static boolean isValidDate(String dateStr, String pattern) {
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(pattern);
		try {
			df.setLenient(false);
			df.parse(dateStr);
			return true;
		} catch (Exception e) {
			return false;

		}
	}

	/**
	 * 方法1 校验字符串是否是全是数字
	 */
	public static boolean isNumber(String number) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher matcher = pattern.matcher(number);

		if (matcher.matches()) {
			return true;
		}
		return false;
	}

	/**
	 * @param 待验证的字符串
	 * @return 如果是符合邮箱格式的字符串,返回<b>true</b>,否则为<b>false</b>
	 */
	public static boolean isEmail(String str) {
		String regex = "[a-zA-Z_]{1,}[0-9]{0,}@(([a-zA-z0-9]-*){1,}\\.){1,3}[a-zA-z\\-]{1,}";
		return match(regex, str);
	}

	/**
	 * @param 待验证的字符串
	 * @return 如果是符合网址格式的字符串,返回<b>true</b>,否则为<b>false</b>
	 */
	public static boolean isHomepage(String str) {
		String regex = "http://(([a-zA-z0-9]|-){1,}\\.){1,}[a-zA-z0-9]{1,}-*";
		return match(regex, str);
	}

	/**
	 * @param regex
	 *            正则表达式字符串
	 * @param str
	 *            要匹配的字符串
	 * @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
	 */
	private static boolean match(String regex, String str) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(str);
		return matcher.matches();
	}

	/**
	 * new date转换成timestamp
	 * 
	 * @param date
	 * @return
	 */
	public static Timestamp dataToTimestamp(Date date) {
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df1.format(date);
		Timestamp CreateDate = Timestamp.valueOf(time);
		return CreateDate;
	}

}
