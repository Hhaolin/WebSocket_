package test;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * 一个由小写字母组成的字符串可以看成一些同一字母的最大碎片组成的。例如,"aaabbaaac"是由下面碎片组成的:'aaa','bb','c'。牛牛现在给定一个字符串,请你帮助计算这个字符串的所有碎片的平均长度是多少。

输入描述:
输入包括一个字符串s,字符串s的长度length(1 ≤ length ≤ 50),s只含小写字母('a'-'z')


输出描述:
输出一个整数,表示所有碎片的平均长度,四舍五入保留两位小数。

如样例所示: s = "aaabbaaac"
所有碎片的平均长度 = (3 + 2 + 3 + 1) / 4 = 2.25
 * @author Hhaolin
 *
 */
public class test3 {

	
	public String getrsNum(String str){
		List<String> list = new ArrayList<String>();
		for(int i=0;i<str.length();i++){
			String temp =  str.substring(i,i+1);
			if(i>0){
			   if(list.indexOf(temp)==-1){
				   list.add(temp);
			   }
			}else{
				list.add(temp);
			}
		}
		 DecimalFormat df=new DecimalFormat("0.00");
	 	System.out.println(str.length()+"/"+list.size());
		return df.format((float)str.length()/list.size());
	}
	
	public static void main(String[] args) {
		test3  t = new test3();
		Scanner sc = new Scanner(System.in);
		System.out.println(t.getrsNum(sc.nextLine()));
	}
}
