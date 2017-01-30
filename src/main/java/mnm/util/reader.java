/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mohammadghasemy
 */
public class reader   {
    
    public List<String> read(String file){
      List<String> result=new ArrayList<String>();
      BufferedReader br = null;

		try {

			String sCurrentLine;
                        
			br = new BufferedReader(new FileReader(file));

			while ((sCurrentLine = br.readLine()) != null) {
                            String del[]=sCurrentLine.split(",");
                            for(String s:del)
				result.add(s);
			}
//                        System.out.println("Read File...");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
                return result;
  }
    
}
