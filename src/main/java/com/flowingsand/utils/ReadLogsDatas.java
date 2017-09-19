package com.flowingsand.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class ReadLogsDatas {
	
	File file = new File(Global.URL_LINUX_TOMCAT_LOGS);

	public static String readFiles(File file) {
		StringBuilder sb = new StringBuilder();

		try {
			// 构造一个BufferedReader类来读取文件
			BufferedReader br = new BufferedReader(new FileReader(file));
			String str = null;
			// 使用readLine方法，一次读一行
			while ((str = br.readLine()) != null) {
				sb.append(System.lineSeparator() + str);
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sb.toString();
	}
}
