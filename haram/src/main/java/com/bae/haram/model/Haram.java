package com.bae.haram.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Haram {
    
	private String modelfield;
	
	
	private String modeltype;
	
	private String modelget;
	
	private String modelset;
	
	private String dbcolumn;
	
	private String insertcolumn;
	
	private String updatecolumn;
	
	private String selectcolumn;
	
	private String jspout;
	
	private String fieldname;
	
	private String comments;
	
	private String primarycol;
	
	private String schemaName;

	private String tableName;

	private String tableComment;

	private String modelName;

	private String objectName;

	private String packageName;

	private String developerName;


}