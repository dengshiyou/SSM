package com.common;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * @author dsy
 *
 */
public class Test {
	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		
		list.add(1);
		list.add(2);
		list.add(3);
		JSON json = (JSON) JSON.toJSON(list);
		System.out.println(json);
	}
}
