package com.common;

import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.entity.SysUser;

/**
 * @author dsy
 *
 */
public final class ExportExcel {
	
	public static void exportFile(HSSFWorkbook wb,List<SysUser> list) throws Exception{
		HSSFSheet sheet = wb.createSheet("用户表");
		HSSFRow row = sheet.createRow(0);
		
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//创建一个居中格式
		
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("ID");
		cell.setCellStyle(style);
		cell = row.createCell(1);
		cell.setCellValue("登录名");
		cell.setCellStyle(style);
		cell = row.createCell(2);
		cell.setCellValue("密码");
		cell.setCellStyle(style);
		cell = row.createCell(3);
		cell.setCellValue("姓名");
		cell.setCellStyle(style);
		
		for(int i = 0; i < list.size(); i++){
			row = sheet.createRow(i + 1);
			SysUser user = (SysUser)list.get(i); 
			row.createCell(0).setCellValue(user.getUserId());
			row.createCell(1).setCellValue(user.getLoginName());
			row.createCell(2).setCellValue(user.getPassWord());
			row.createCell(3).setCellValue(user.getName());
		}
		
		FileOutputStream fos = new FileOutputStream("C:/Users/dsy/Desktop/user.xls");
		wb.write(fos);
		fos.close();
	}
}
