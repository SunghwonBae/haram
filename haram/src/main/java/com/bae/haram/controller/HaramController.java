package com.bae.haram.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

import com.bae.haram.model.Haram;
import com.bae.haram.service.HaramService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.lang.StringUtils;

@Controller
public class HaramController {

    @Autowired
    HaramService haramService;


    @RequestMapping(value="/tableList")
    public  ModelAndView tableList(@RequestParam("schemaName") String schemaName) throws Exception {

        Haram schema = Haram.builder().schemaName(schemaName).build();

        Haram[] tableList = haramService.tableList(schema);

        return new ModelAndView("tableList").addObject("tableList",tableList);

 
    }

    @RequestMapping(value="/haramList")
    public  ModelAndView haramList(@RequestParam("developerName") String developerName,@RequestParam("packageName") String packageName,@RequestParam("modelName") String modelName,@RequestParam("schemaName") String schemaName,@RequestParam("tableName") String tableName,@RequestParam("tableComment") String tableComment) throws Exception {

		String objectName = modelName.substring(0, 1).toLowerCase()+modelName.substring(1, modelName.length());
        Haram haramOne = Haram.builder().schemaName(schemaName).packageName(packageName).modelName(modelName).objectName(objectName).tableName(tableName).tableComment(tableComment).developerName(developerName).build();

        Haram[] haramList = haramService.haramList(haramOne);

		return new ModelAndView("haramList")
		.addObject("haramOne",haramOne)
		.addObject("haramList",haramList);

 
    }

    @RequestMapping(value = "/getSetSave")
	public @ResponseBody void getSetSave(String modelName, String modelField, String modelGet, String modelSet) throws Exception{
		//C:\iKEP4-Project\workspace\ikep4\ikep4-approval\target\classes\com\lgcns\ikep4\approval\admin\model\ApprBox.class
		
		modelName = modelName.replaceAll("target\\\\classes\\\\", "src\\\\main\\\\java\\\\");
		modelName = modelName.replaceAll(".class", ".java");

		

			String result="";
			BufferedReader br = new BufferedReader(new FileReader(new File(modelName)));
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(modelName+".new")));


			
			int importCount = 0;
			int publicCount = 0;
			int annoCount = 0;
			while((result = br.readLine()) != null) {
				if(StringUtils.contains(result,"@")){
					annoCount++;
				}
				if(StringUtils.contains(result,"public")){
					
					publicCount++;
					if(annoCount!=0){
						publicCount--;//get메서드 위에 @DateTimeFormat이 붙는 경우등등.
						annoCount--;
					}
					if(publicCount==2){//첫번째 get메서드 앞에서 추가한다.
						result = "\r\n" +modelField+ "\r\n\r\n" +modelGet+modelSet+ "\r\n"+result;
					}
				}
				if(StringUtils.contains(modelGet,"DateTimeFormat")){
					if(StringUtils.contains(result,"import")){
						importCount++;
						if(importCount==1){//첫번째 import 앞에서 추가한다.
							result = "\r\nimport java.util.Date;"+
									"\r\nimport org.springframework.format.annotation.DateTimeFormat;\r\n"+result;
						}
					}
				}
				
				bw.write(result+ "\r\n");
				bw.flush();
			}
			bw.close();
			br.close();

			File orginal = new File(modelName);
			
			File oldFile = new File(modelName+".old");
			File newFile = new File(modelName+".new");
			
			orginal.renameTo(oldFile);
			newFile.renameTo(orginal);
			oldFile.delete();
			

	}

}