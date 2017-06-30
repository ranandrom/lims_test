package com.anchordx.util;

import java.util.Date; 


/** 
 * <p>Title:GenerateUUID </p> 
 * <p>Description:TODO </p> 
 * <p>Company: </p> 
 * @author Luzhirong 
 * @date 2017-6-7 上午
 * */

public class GenerateUUID {
	
	private static Date date = new Date(); 
	// private static StringBuilder buf = new StringBuilder(); 
	private static int seq = 0; 
	private static final int ROTATION = 99999;
	
	public static synchronized long next(){ 
		if (seq > ROTATION) seq = 0; 
		//  buf.delete(0, buf.length()); 
		date.setTime(System.currentTimeMillis()); 
		String str = String.format("%1$tY%1$tm%1$td%1$tk%1$tM%1$tS%2$05d", date, seq++); 
		return Long.parseLong(str); 
	}
	
	public static void main(String[] args) { 
		for(int i=0;i<100;i++){ 
			System.out.println(next()); 
		} 
	} 
}
