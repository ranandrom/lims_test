package com.anchordx.receivefiles;

import java.io.*;
import java.net.*;

public class ReceiveFiles
{
	public static void  fileStorage(String htmlpath, String pngpath){
		// TODO Auto-generated method stub
		try {
			ServerSocket server = new ServerSocket(8888);
			Socket socket = new Socket();
			while(true){
				socket = server.accept();
				InputStream is = socket.getInputStream();

				OutputStream os = socket.getOutputStream();
				byte[] b = new byte[1024];
				//1、得到文件名
				int a = is.read(b);
				String filename = new String(b, 0, a); 
				System.out.println("接受到的文件名为："+filename);
				String houzhui = filename.substring(filename.indexOf("."), filename.length());
				String path = null;
				if (houzhui.equals(".html")) {
					path = htmlpath;
				} else if(houzhui.equals(".png")){
					path = pngpath;
				}
				//String rand = String.valueOf((int) (Math.random() * 100000));
				//filename = rand+houzhui;
				System.out.println("新生成的文件名为:"+filename);
				FileOutputStream fos = new FileOutputStream("path"+filename);
				int length = 0;
				while((length=is.read(b))!=-1){
					//2、把socket输入流写到文件输出流中去
					fos.write(b, 0, length);
				}
				//fos.flush();
				fos.close();
				os.flush();
				os.close();
				is.close();
				socket.close();
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
