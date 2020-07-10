package com.bae.haram.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
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
import org.apache.commons.io.FileUtils;
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

    @RequestMapping(value = "/saveJavaXml")
	public @ResponseBody void saveJavaXml(String javaSrc, String javaName, String ext) throws Exception{

		String where  = "C:\\haram\\haram\\src\\main\\";
		if(ext.equals("java")){
			where = where+"java\\";
			javaName = javaName.replaceAll("\\.", "\\\\")+"."+ext;
		}else{
			where = where+"resources\\sql\\category";
			javaName = javaName.split("com.lgcns.profit.category")[1];
			javaName = javaName.replaceAll("\\.", "\\\\")+"."+ext;
		}



		System.out.println(where+javaName);
		
		File javaFile = new File(where+javaName);
		FileUtils.touch(javaFile);//경로 및 파일 생성.

		byte[] src = javaSrc.getBytes();

		FileOutputStream fs = new FileOutputStream(javaFile);

		fs.write(src); 
		fs.close();
	}

}