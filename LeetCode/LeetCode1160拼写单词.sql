leetcode 1160. 拼写单词
  给你一份『词汇表』（字符串数组） words 和一张『字母表』（字符串） chars。

假如你可以用 chars 中的『字母』（字符）拼写出 words 中的某个『单词』（字符串

），那么我们就认为你掌握了这个单词。

注意：每次拼写时，chars 中的每个字母都只能用一次。

返回词汇表 words 中你掌握的所有单词的 长度之和。

来源：力扣（LeetCode

）


涉及到HashMap 对象克隆 for循环的使用

public class Solution {
    //把字符串存入HashMap中，展示字符及其数量关系
	public HashMap<Character,Integer> charMap(String chars){
		HashMap<Character,Integer> map = new HashMap<Character,Integer>();
		for(int i = 0;i<chars.length();i++) {
			char c = chars.charAt(i);
			if(map.containsKey(c)) {
				map.put(c, map.get(c)+1);
			}else {
				map.put(c, 1);
			}
		}
		return map;
		
	}
	
    public int countCharacters(String[] words, String chars) {
      if(words == null || chars == null)
    	  return 0;
    	
      HashMap<Character,Integer> map = charMap(chars);
       //注意多层for循环定义的变量的定义域的使用

       int count = 0; //map都包含的字符长的长度累加到count
     
       //遍历String[] words
       for(int i = 0;i<words.length;i++) {
    	  
            int temp = 0;

		HashMap<Character,Integer> dummyMap = (HashMap<Character, Integer>) map.clone();//注意对象的浅克隆
    	  //遍历words[i],检查字符组合是否都包含于map中
    	   for(int j = 0;j<words[i].length();j++) {
    		   char c = words[i].charAt(j);
    		   if(dummyMap.containsKey(c) && dummyMap.get(c)>0) {
    			   dummyMap.put(c, dummyMap.get(c)-1);
    			  temp++;
    		   }else {
    			   temp = 0;
    			   break;
    		   }
    	   }
    	   //每次内层for循环结束后符合要求的字符串长度temp不会=0
    	   count += temp;
       }
       
    return count;
  }
	
}
改进：for循环逻辑可以单独分出写一个函数
      words也可以存入HashMap,比较相同KEY的VALUE值
