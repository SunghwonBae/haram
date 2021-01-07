<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='yyyy.MM.dd' var="nowDate"/>

<c:set var="packagePath1" value="${fn:replace(haramOne.packageName, 'com.lgcns.profit.category.', '/v1.')}"/>
<c:set var="packagePath" value="${fn:replace(packagePath1,'.','/')}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <title>배태랑</title>
    <script type="text/javascript">
        (function($) { 
            $(document).ready(function(){	
                $(".smile").click(function(){
                    alert($(this).closest("tr").find("input[name=packageName]").val()+".model."+$(this).closest("tr").find("input[name=modelName]").val()+".java 를 smile");


                    location.href = "<c:url value='/haramList'/>?packageName="+$(this).closest("tr").find("input[name=packageName]").val()+"&modelName="+$(this).closest("tr").find("input[name=modelName]").val()+"&tableName="+$(this).closest("tr").find("input [name=tableName]").val();
                });

                $(".fileDown").click(function(){
                   
                    $.ajax({
                        url : "<c:url value='/saveJavaXml'/>",
                        data : {
                            "javaSrc" : $(this).closest("td").find("textarea").val(),
                            "javaName" : $(this).closest("td").find("input[name=javaName]").val(),
                            "ext" : $(this).closest("td").find("input[name=ext]").val()
                            },
                        type : "post",
                        success : function(result) {
                            alert("success");
                        
                        }
                    });
                });


            });
        })(jQuery);	
    </script>          
</head>
<body>
    <h3></h3>
    <table>
        <tr>
            <th>model - <c:out value='${haramOne.modelName}'/>.java</th>
            <th>repository - <c:out value='${haramOne.modelName}'/>Repository.java</th>
            <th>mapper - <c:out value='${haramOne.objectName}'/>.xml</th>
        </tr>
       
            <tr>
                <td><input type="button" class="fileDown" value="java file download"><input name="javaName" value="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>" type="hidden"/><input name="ext" value="java" type="hidden"/><br>
                    <textarea name="model_src" style="width: 450px;height: 500px;overflow:auto;" wrap="off">
/**  
* @ProjectName : B2B 수익성
* @FileName : <c:out value='${haramOne.modelName}'/>.java - <c:out value='${haramOne.tableComment}'/>
* @Description :
* <<  개정이력(Modification Information)  >>
*  
*   수정일           수정자          수정내용  
*  --------------      ----------     ---------------------------  
*  <c:out value='${nowDate}'/>    <c:out value='${haramOne.developerName}'/>       최초생성(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.tableComment}'/> 소스)
*   
* @author <c:out value='${haramOne.developerName}'/> 
* @since <c:out value='${nowDate}'/>  
* @version 1.0  
* @Copyright   (c) 2020 LG CNS, All Rights Reserved.
*/                
package <c:out value='${haramOne.packageName}'/>.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class <c:out value='${haramOne.modelName}'/> {                        
<c:forEach var="haram" items="${haramList}" varStatus="status">
    <c:out value='${haram.modelfield}'/>
</c:forEach>
    private String localeCd;

    private Integer duistate;//그리드 편집상태. 0그대로 1추가, 2수정, 3삭제
}
                    </textarea>
                </td>
                <td><input type="button" class="fileDown" value="java file download"><input name="javaName" value="<c:out value='${haramOne.packageName}'/>.repository.<c:out value='${haramOne.modelName}'/>Repository" type="hidden"/><input name="ext" value="java" type="hidden"/><br>
                    <textarea style="width: 450px;height: 500px;overflow:auto;" wrap="off">
/**  
* @ProjectName : B2B 수익성
* @FileName : <c:out value='${haramOne.modelName}'/>Repository.java - <c:out value='${haramOne.tableComment}'/>
* @Description :
* <<  개정이력(Modification Information)  >>
*  
*   수정일           수정자          수정내용  
*  --------------      ----------     ---------------------------  
*  <c:out value='${nowDate}'/>    <c:out value='${haramOne.developerName}'/>       최초생성(<c:out value='${haramOne.modelName}'/>Repository <c:out value='${haramOne.tableComment}'/> 소스)
*   
* @author <c:out value='${haramOne.developerName}'/> 
* @since <c:out value='${nowDate}'/>  
* @version 1.0  
* @Copyright   (c) 2020 LG CNS, All Rights Reserved.
*/                
package <c:out value='${haramOne.packageName}'/>.repository;

import <c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface <c:out value='${haramOne.modelName}'/>Repository {
  int insert<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
  int delete<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
  List<<c:out value='${haramOne.modelName}'/>> select<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
  int update<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
}

                    </textarea>
                </td>
                <td><input type="button" class="fileDown" value="xml file download"><input name="javaName" value="<c:out value='${haramOne.packageName}'/>.<c:out value='${haramOne.modelName}'/>" type="hidden"/><input name="ext" value="xml" type="hidden"/><br>
                    <textarea style="width: 450px;height: 500px;overflow:auto;" wrap="off">
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd" >

<mapper namespace="<c:out value='${haramOne.packageName}'/>.repository.<c:out value='${haramOne.modelName}'/>Repository">

    <insert id="insert<c:out value='${haramOne.modelName}'/>" parameterType="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>">
    <![CDATA[
    INSERT INTO <c:out value='${fn:toUpperCase(haramOne.tableName)}'/> 
        ( <c:forEach var="haram" items="${haramList}" varStatus="status">
        <c:out value='${fn:toUpperCase(haram.dbcolumn)}'/><c:if test="${!status.last}">,</c:if></c:forEach>        
        ) 
    VALUES 
        (<c:forEach var="haram" items="${haramList}" varStatus="status">
        <c:out value='${haram.insertcolumn}'/><c:if test="${!status.last}">,</c:if></c:forEach> 
        ) 
    ]]>
    </insert>

    <update id="update<c:out value='${haramOne.modelName}'/>" parameterType="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>">
        <![CDATA[ 
        UPDATE <c:out value='${fn:toUpperCase(haramOne.tableName)}'/>
           SET 
        ]]>
<c:forEach var="haram" items="${haramList}" varStatus="status">
            <if test="<c:out value='${haram.fieldname}'/> != null and <c:out value='${haram.fieldname}'/> != ''">
              <![CDATA[
              <c:out value='${haram.updatecolumn}'/><c:if test="${!status.last}">,</c:if>
              ]]>
            </if>
</c:forEach>    
        <![CDATA[
        WHERE 1=1
<c:forEach var="haram" items="${haramList}" varStatus="status"><c:if test="${!empty haram.primarycol}"> 
        AND  <c:out value='${haram.updatecolumn}'/></c:if></c:forEach>            
        ]]>
    </update>

    <delete id="delete<c:out value='${haramOne.modelName}'/>" parameterType="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>">
        <![CDATA[
        DELETE FROM <c:out value='${haramOne.tableName}'/> 
        WHERE 1=1
        <c:forEach var="haram" items="${haramList}" varStatus="status"><c:if test="${!empty haram.primarycol}"> 
            AND  <c:out value='${haram.updatecolumn}'/></c:if></c:forEach> 
         ]]>
    </delete>   

    <select id="select<c:out value='${haramOne.modelName}'/>" resultType="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>" parameterType="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>">
        <![CDATA[
        SELECT 
        <c:forEach var="haram" items="${haramList}" varStatus="status">
            A.<c:out value='${haram.selectcolumn}'/><c:if test="${!status.last}">,</c:if></c:forEach> 
        FROM <c:out value='${haramOne.tableName}'/> A
        WHERE 1=1
        <c:forEach var="haram" items="${haramList}" varStatus="status"><c:if test="${!empty haram.primarycol}"> 
            AND  A.<c:out value='${haram.updatecolumn}'/></c:if></c:forEach> 
        ]]> 
    </select>

</mapper>
                    </textarea>
                </td>
            </tr>
            <tr>
                <th>service - <c:out value='${haramOne.modelName}'/>Service.java</th>
                <th>serviceImpl - <c:out value='${haramOne.modelName}'/>ServiceImpl.java</th>
                <th>controller - <c:out value='${haramOne.modelName}'/>Controller.java</th>
            </tr>
            <tr>
                <td><input type="button" class="fileDown" value="java file download"><input name="javaName" value="<c:out value='${haramOne.packageName}'/>.service.<c:out value='${haramOne.modelName}'/>Service" type="hidden"/><input name="ext" value="java" type="hidden"/><br>
                    <textarea style="width: 450px;height: 500px;overflow:auto;" wrap="off">
/**  
* @ProjectName : B2B 수익성
* @FileName : <c:out value='${haramOne.modelName}'/>Service.java - <c:out value='${haramOne.tableComment}'/>
* @Description :
* <<  개정이력(Modification Information)  >>
*  
*   수정일           수정자          수정내용  
*  --------------      ----------     ---------------------------  
*  <c:out value='${nowDate}'/>    <c:out value='${haramOne.developerName}'/>       최초생성(<c:out value='${haramOne.modelName}'/>Service <c:out value='${haramOne.tableComment}'/> 소스)
*   
* @author <c:out value='${haramOne.developerName}'/> 
* @since <c:out value='${nowDate}'/>  
* @version 1.0  
* @Copyright   (c) 2020 LG CNS, All Rights Reserved.
*/                

package <c:out value='${haramOne.packageName}'/>.service;

import java.util.List;
import <c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>;
import com.lgcns.profit.common.model.SessionUser;


public interface <c:out value='${haramOne.modelName}'/>Service {
    public void save<c:out value='${haramOne.modelName}'/>(List<<c:out value='${haramOne.modelName}'/>> <c:out value='${haramOne.objectName}'/>List, SessionUser session) throws Exception;
    public int create<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
    public int delete<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
    public List<<c:out value='${haramOne.modelName}'/>> select<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>, SessionUser session) throws Exception;
    public int update<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
}


                    </textarea>
                </td>
                <td><input type="button" class="fileDown" value="java file download"><input name="javaName" value="<c:out value='${haramOne.packageName}'/>.service.<c:out value='${haramOne.modelName}'/>ServiceImpl" type="hidden"/><input name="ext" value="java" type="hidden"/><br>
                    <textarea style="width: 450px;height: 500px;overflow:auto;" wrap="off">
/**  
* @ProjectName : B2B 수익성
* @FileName : <c:out value='${haramOne.modelName}'/>ServiceImpl.java - <c:out value='${haramOne.tableComment}'/>
* @Description :
* <<  개정이력(Modification Information)  >>
*  
*   수정일           수정자          수정내용  
*  --------------      ----------     ---------------------------  
*  <c:out value='${nowDate}'/>    <c:out value='${haramOne.developerName}'/>       최초생성(<c:out value='${haramOne.modelName}'/>ServiceImpl <c:out value='${haramOne.tableComment}'/> 소스)
*   
* @author <c:out value='${haramOne.developerName}'/> 
* @since <c:out value='${nowDate}'/>  
* @version 1.0  
* @Copyright   (c) 2020 LG CNS, All Rights Reserved.
*/  

package <c:out value='${haramOne.packageName}'/>.service;

import com.lgcns.profit.common.model.NumGen;
import com.lgcns.profit.common.model.SessionUser;
import com.lgcns.profit.common.service.NumGenService;

import java.text.SimpleDateFormat;
import java.util.Date;

import <c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>;
import <c:out value='${haramOne.packageName}'/>.repository.<c:out value='${haramOne.modelName}'/>Repository;
import com.lgcns.profit.common.exception.BusinessException;
import com.lgcns.profit.common.message.DBMessageSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
// import org.springframework.transaction.annotation.Transactional;



//log4j
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import java.util.List;

@Service("<c:out value='${haramOne.objectName}'/>ServiceImpl")
public class <c:out value='${haramOne.modelName}'/>ServiceImpl implements <c:out value='${haramOne.modelName}'/>Service {
    @Autowired
    <c:out value='${haramOne.modelName}'/>Repository <c:out value='${haramOne.objectName}'/>Repository;

    @Autowired
    DBMessageSource messageSource;

    @Autowired
    NumGenService numGenService;

    private static final Logger LOGGER = LogManager.getLogger(<c:out value='${haramOne.modelName}'/>ServiceImpl.class);

    /**
    * @Description 생성 수정 삭제에 대한  처리
    * @param
    * @return int
    */
    @Override
    // @Transactional(rollbackFor = Exception.class)
    public void save<c:out value='${haramOne.modelName}'/>(List<<c:out value='${haramOne.modelName}'/>> <c:out value='${haramOne.objectName}'/>List, SessionUser session) throws Exception {

        if ( <c:out value='${haramOne.objectName}'/>List.isEmpty() ) {
			throw new BusinessException(messageSource.getMessage(session.getTenantId(), session.getLocale(), "info.common.save0001"));
        }
        
        for (<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/> : <c:out value='${haramOne.objectName}'/>List) {
            <c:out value='${haramOne.objectName}'/>.setTenantUid(session.getTenantId());
            <c:out value='${haramOne.objectName}'/>.setModifyUserUid(session.getId());
            <c:out value='${haramOne.objectName}'/>.setModifyModuleUid(session.getId());
            switch (<c:out value='${haramOne.objectName}'/>.getDuistate()) {
                case 1:
                <c:out value='${haramOne.objectName}'/>.setCreateUserUid(session.getId());
                    create<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>);
                break;
                case 2:
                //수정
                break;
                case 3:
                //삭제
                break;
            }
        }
    }

    /**
    * @Description 생성 처리
    * @param
    * @return int
    */
    @Override
    public int create<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception {
        int result = <c:out value='${haramOne.objectName}'/>Repository.insert<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>);
        return result;
    }

    
    /**
    * @Description 수정 처리
    * @param
    * @return int
    */
    @Override
    public int update<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception {
        int result = <c:out value='${haramOne.objectName}'/>Repository.update<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>);
        return result;
    }

    /**
    * @Description 삭제 처리
    * @param
    * @return int
    */
    @Override
    public int delete<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception {
        int result = <c:out value='${haramOne.objectName}'/>Repository.delete<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>);
        return result;
    }

    /**
    * @Description 조회 
    * @param
    * @return List<<c:out value='${haramOne.modelName}'/>>
    */
    @Override
    public List<<c:out value='${haramOne.modelName}'/>> select<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>, SessionUser session) throws Exception {
        <c:out value='${haramOne.objectName}'/>.setTenantUid(session.getTenantId());
        <c:out value='${haramOne.objectName}'/>.setLocaleCd(session.getLocale());
        List<<c:out value='${haramOne.modelName}'/>> result = <c:out value='${haramOne.objectName}'/>Repository.select<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>);
        return result;
    }
}

                    </textarea>
                </td>

                <td><input type="button" class="fileDown" value="java file download"><input name="javaName" value="<c:out value='${haramOne.packageName}'/>.controller.<c:out value='${haramOne.modelName}'/>Controller" type="hidden"/><input name="ext" value="java" type="hidden"/><br>
                    <textarea style="width: 450px;height: 500px;overflow:auto;" wrap="off">
/**  
* @ProjectName : B2B 수익성
* @FileName : <c:out value='${haramOne.modelName}'/>Controller.java - <c:out value='${haramOne.tableComment}'/>
* @Description :
* <<  개정이력(Modification Information)  >>
*  
*   수정일           수정자          수정내용  
*  --------------      ----------     ---------------------------  
*  <c:out value='${nowDate}'/>    <c:out value='${haramOne.developerName}'/>       최초생성(<c:out value='${haramOne.modelName}'/>Controller <c:out value='${haramOne.tableComment}'/> 소스)
*   
* @author <c:out value='${haramOne.developerName}'/> 
* @since <c:out value='${nowDate}'/>  
* @version 1.0  
* @Copyright   (c) 2020 LG CNS, All Rights Reserved.
*/    
package <c:out value='${haramOne.packageName}'/>.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import <c:out value='${haramOne.packageName}'/>.service.<c:out value='${haramOne.modelName}'/>Service;
import <c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>;
import <c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>.<c:out value='${haramOne.modelName}'/>Builder;

import com.lgcns.profit.common.model.SessionUser;
import com.lgcns.profit.common.service.SessionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.util.StringUtils;
import io.swagger.annotations.ApiOperation;


import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.lgcns.profit.common.model.CommonCode;
import com.lgcns.profit.common.service.CommonCodeService;

import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class <c:out value='${haramOne.modelName}'/>Controller {
    static final Logger LOGGER = LogManager.getLogger(<c:out value='${haramOne.modelName}'/>Controller.class);
    
    @Autowired
    SessionService sessionService;

    @Autowired
    CommonCodeService commonCodeService;

    @Autowired
    private <c:out value='${haramOne.modelName}'/>Service <c:out value='${haramOne.objectName}'/>Service;

    
    /**
    * @Description 검색조건 조회
    * @param
    * @return Map<String, Object>
    */
    @ApiOperation(value="검색조건조회", httpMethod="GET", notes="검색조건조회")
    @RequestMapping(method=RequestMethod.GET, path="<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}/init") 
    public Map<String, Object> <c:out value='${haramOne.objectName}'/>SearchOptions(HttpServletRequest request) throws Exception {
        
        SessionUser sessionUser = null;
        sessionUser = new SessionUser();
        // 헤더로부터 session key를 읽어 Session을 가져옴
        String sessionKey = request.getHeader("Session-Key");
        sessionUser = sessionService.retrieveSession(sessionKey);
    
        // 필요코드값조회
        CommonCode commonCodeEx = CommonCode.builder().tenantUid(sessionUser.getTenantId()).localeCd(sessionUser.getLocale()).build();

        commonCodeEx.setCmmnCd("코드");
        commonCodeEx.setUseYn("Y");
        List<CommonCode> codeData = commonCodeService.selectCommonCodeValue(commonCodeEx);

        Map<String, Object> map = new HashMap<>();
        map.put("필요코드명"     , codeData    );  //필요코드 

        return map;

    }
    
    @ApiOperation(value = "조회", httpMethod = "GET", notes = "조회")
    @GetMapping(value="<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}") 
    public Map<String, Object> select<c:out value='${haramOne.modelName}'/>(HttpServletRequest request<c:forEach var="haram" items="${haramList}" varStatus="status"><c:if test="${haram.modeltype ne 'Date'}">
        , @RequestParam(required = false) <c:out value='${haram.modeltype}'/> <c:out value='${haram.fieldname}'/></c:if></c:forEach> 
        ) throws Exception { 
        
        <c:out value='${haramOne.modelName}'/>Builder bldr = <c:out value='${haramOne.modelName}'/>.builder();

        <c:forEach var="haram" items="${haramList}" varStatus="status"><c:if test="${haram.modeltype ne 'Date'}">
        if(!StringUtils.isEmpty(<c:out value='${haram.fieldname}'/>)) bldr.<c:out value='${haram.fieldname}'/>(<c:out value='${haram.fieldname}'/>);</c:if></c:forEach>

        <c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>   = bldr.build();

        SessionUser sessionUser = sessionService.retrieveSession(request.getHeader("Session-Key"));

        return Map.of("<c:out value='${haramOne.objectName}'/>List", <c:out value='${haramOne.objectName}'/>Service.select<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>, sessionUser));
    }

    @ApiOperation(value="저장", httpMethod="POST", notes="저장")
    @PostMapping(value="<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}")
    public int save<c:out value='${haramOne.modelName}'/>(HttpServletRequest request, @RequestBody List<<c:out value='${haramOne.modelName}'/>> <c:out value='${haramOne.objectName}'/>List) throws Exception {
        SessionUser sessionUser = sessionService.retrieveSession(request.getHeader("Session-Key"));
        
        <c:out value='${haramOne.objectName}'/>Service.save<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>List, sessionUser);
        
        return 1;
    }
}          
                    </textarea>
                </td>
            </tr>
            <tr>
                <th>Devon Rich UI Grid</th>
                <th>HTML grid</th>
                <th></th>
            </tr>    
            <tr>
                <td>
                    <textarea style="width: 450px;height: 500px;overflow:auto;" wrap="off">
/*******************************************************
    파일명 : <c:out value='${haramOne.objectName}'/>.js

    설 명  : <c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/>

    작성자 : <c:out value='${haramOne.developerName}'/>

    작성일 : <c:out value='${nowDate}'/>    
********************************************************/

// 페이지 초기화
Rui.onReady(function() {
    cfn_lang();
    fn_init();
});


// 전역변수
let <c:out value='${haramOne.objectName}'/> = { dataSet : null , columnModel : null ,gridPanel : null, selectionModel:null, validatorManager:null}//<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/>
let cbUseYn;
let <c:out value='${haramOne.objectName}'/>_SM;
             

const fn_onError = function(request, status, error){
    
}

// 기능 
const fn_init = function(){

    <c:out value='${haramOne.objectName}'/>.dataSet = new Rui.data.LJsonDataSet({
        id: '<c:out value='${haramOne.objectName}'/>.dataSet',
        remainRemoved: true,
        canMarkableEvent: true,
        fields: [
<c:forEach var="haram" items="${haramList}" varStatus="status">
            { id: '<c:out value='${haram.fieldname}'/>' }<c:if test="${!status.last}">,</c:if></c:forEach>
        ]
    });


    <c:out value='${haramOne.objectName}'/>.columnModel = new Rui.ui.grid.LColumnModel({
        autoWidth: true,
        defaultDraggable: false,
        defaultEditable: true,
        columns: [
            new Rui.ui.grid.LStateColumn(),
            new Rui.ui.grid.LSelectionColumn(),
        <c:forEach var="haram" items="${haramList}" varStatus="status">
            { field: '<c:out value='${haram.fieldname}'/>', label: '${empty haram.comments ? haram.fieldname:haram.comments}', width: 100, align: 'center'  }<c:if test="${!status.last}">,</c:if></c:forEach>
        ]
    });

    <c:out value='${haramOne.objectName}'/>.gridPanel = new Rui.ui.grid.LGridPanel(
    {
        columnModel: <c:out value='${haramOne.objectName}'/>.columnModel,
        autoWidth: true,
        autoToEdit: true,
        clickToEdit: true,
        editable:true,
        dataSet:<c:out value='${haramOne.objectName}'/>.dataSet
    });
    
    <c:out value='${haramOne.objectName}'/>.gridPanel.render('<c:out value='${haramOne.objectName}'/>.gridDiv');

    <c:out value='${haramOne.objectName}'/>.selectionModel  = <c:out value='${haramOne.objectName}'/>.gridPanel.getSelectionModel();


    <c:out value='${haramOne.objectName}'/>.selectionModel.on('selectCell', function(e){
        var column = <c:out value='${haramOne.objectName}'/>.columnModel.getColumnAt(e.col, true);
        var colId = column.getId();
        /*
        <c:forEach var="haram" items="${haramList}" varStatus="status">
        if (colId == '<c:out value='${haram.fieldname}'/>') {
            
        }</c:forEach>
        */
    
    });

    <c:out value='${haramOne.objectName}'/>.selectionModel.on('selectRow', function(e){
        var selectRowRecord = <c:out value='${haramOne.objectName}'/>.dataSet.getAt(e.row);
        /*
        <c:forEach var="haram" items="${haramList}" varStatus="status">
        var select_<c:out value='${haram.fieldname}'/>= selectRowRecord.get('<c:out value='${haram.fieldname}'/>');</c:forEach>
        */
    });

    //:maxByteLength=200 //:byteLength=4 //:inNumber=90~100 //:maxNumber=100 //영문숫자만허용 :allow=\\a;\\n //:date=YYYYMMDD 
    <c:out value='${haramOne.objectName}'/>.validatorManager = new Rui.validate.LValidatorManager({
        validators: [
        <c:forEach var="haram" items="${haramList}" varStatus="status">
            { id: '<c:out value='${haram.fieldname}'/>', validExp:'${empty haram.comments ? haram.fieldname:haram.comments}:true' },</c:forEach>
        ]
    });

    // 검색 영역 검색
    var btnSearch = new Rui.ui.LButton('btnSearch');
    btnSearch.on('click', function(){
        var url = '<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}/${fn:toLowerCase(haramOne.objectName)}?';
        <c:forEach var="haram" items="${haramList}" varStatus="status">
        url += '<c:out value='${haram.fieldname}'/>=' + (tb_<c:out value='${haram.fieldname}'/>.getValue() || '');</c:forEach>

        cfn_ajax(url,
            function(response) {
                const result = response;
                if ( result.<c:out value='${haramOne.objectName}'/>List.length > 0 ) {
                    var da = {"records" : result.<c:out value='${haramOne.objectName}'/>List};
                    <c:out value='${haramOne.objectName}'/>.dataSet.loadData(da);
                } else {
                    <c:out value='${haramOne.objectName}'/>.dataSet.clearData();
                }
                $('#<c:out value='${haramOne.objectName}'/>Count').text(result.<c:out value='${haramOne.objectName}'/>List.length);

            },
            function(response, status, error) {
                console.log('error');
                console.log(response, status, error);
            },
            'GET'
        );
    });
}    

//<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/> 그리드 데이터 로드하기
const fn_<c:out value='${haramOne.objectName}'/>Grid = function(response){
    const result = response;
    //console.log("result:"+JSON.stringify(result));
    if ( result.<c:out value='${haramOne.objectName}'/>List.length > 0 ) {

        var da = {"records" : result.<c:out value='${haramOne.objectName}'/>List};
        <c:out value='${haramOne.objectName}'/>.dataSet.loadData(da);

    } else {
        <c:out value='${haramOne.objectName}'/>.dataSet.clearData();
    }
    $('#<c:out value='${haramOne.objectName}'/>Count').text(result.<c:out value='${haramOne.objectName}'/>List.length);
    
}//END fn_<c:out value='${haramOne.objectName}'/>


//추가되는 ROW 에 useYn  필드가 있다면 기본Y로 셋팅      
const addrowInit = function(row){
    var record = <c:out value='${haramOne.objectName}'/>.dataSet.getAt(row);
    record.set('useYn', 'Y');
}

//유효성 검사
const fn_validate = function(option) {
    let msg = '';

    switch(option) {
    /*-------저장-------*/
    case 'btnSave<c:out value='${haramOne.modelName}'/>':
        if(!<c:out value='${haramOne.objectName}'/>.dataSet.isUpdated()) {
            msg = Rui.getMessageManager().get('$.base.msg102');
            break;
        }else if(!<c:out value='${haramOne.objectName}'/>.validatorManager.validateDataSet(<c:out value='${haramOne.objectName}'/>.dataSet)) {
           Rui.alert(<c:out value='${haramOne.objectName}'/>.validatorManager.getMessageList().join('<br/>'), false, 400);
           return false;
        }
        break;

    }

     if(!Rui.isEmpty(msg)) {
         //lfShowMessage(msg);
         Rui.alert(msg);
         return false;
     }

    return true;
}

$(function() {

    //<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/> [취소] 버튼
    $('#btnUndo<c:out value='${haramOne.modelName}'/>').on('click', function(){
        if(<c:out value='${haramOne.objectName}'/>.dataSet.getMarkedCount() > 0) {
            for(var i = 0 ; i < <c:out value='${haramOne.objectName}'/>.dataSet.getCount() ; i++) {
                if(<c:out value='${haramOne.objectName}'/>.dataSet.isMarked(i))
                <c:out value='${haramOne.objectName}'/>.dataSet.undo(i);
            }
        } else {
            var row = <c:out value='${haramOne.objectName}'/>.dataSet.getRow();
            if(row < 0) return;
            <c:out value='${haramOne.objectName}'/>.dataSet.undo(row);
        }
    });

    //<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/> [전체취소] 버튼
    $('#btnUndoAll<c:out value='${haramOne.modelName}'/>').on('click', function(){
        <c:out value='${haramOne.objectName}'/>.dataSet.undoAll();
    });

    //<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/> [행추가] 버튼
    $('#btnNew<c:out value='${haramOne.modelName}'/>').on('click', function(){
        var row = <c:out value='${haramOne.objectName}'/>.dataSet.newRecord();
        if (row !== false) {
            addrowInit(row);
        }
    });

    //<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/> [행삽입] 버튼
    $('#btnInsert<c:out value='${haramOne.modelName}'/>').on('click', function(){
        if(<c:out value='${haramOne.objectName}'/>.dataSet.getRow() < 0) return;
        var row = <c:out value='${haramOne.objectName}'/>.dataSet.newRecord(<c:out value='${haramOne.objectName}'/>.dataSet.getRow());
        if (row !== false) {
            addrowInit(row);
        }
    });

    //<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/> [삭제] 버튼
    $('#btnDelete<c:out value='${haramOne.modelName}'/>').on('click', function(){
        if(<c:out value='${haramOne.objectName}'/>.dataSet.getMarkedCount() > 0) {
            <c:out value='${haramOne.objectName}'/>.dataSet.removeMarkedRows();
        } else {
            var row = <c:out value='${haramOne.objectName}'/>.dataSet.getRow();
            if(row < 0) return;
            <c:out value='${haramOne.objectName}'/>.dataSet.removeAt(row);
        }
    });

    //<c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/> [저장] 버튼
    $('#btnSave<c:out value='${haramOne.modelName}'/>').on('click', function(){

        var modifedCheckJson = JSON.stringify(JSON.parse(<c:out value='${haramOne.objectName}'/>.dataSet.serializeMarkedOnly()).records);

        console.log(modifedCheckJson);

        if(<c:out value='${haramOne.objectName}'/>.dataSet.getMarkedCount()==0){
            cfn_openAlertMsgBox('Common.NoDataWasSelected');
            return ;
        }

        if(!fn_validate('btnSave<c:out value='${haramOne.modelName}'/>')) {
            return false;
        }
        
        cfn_openConfirmMsgBox('Common.saveConfirm', function() {
            cfn_ajax('<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}',
                function(response) {
                    //console.log('성공');
                    //console.log(response);

                    cfn_openAlertMsgBox('Common.success');
                },
                function(response, status, error) {
                    console.log('error');
                    cfn_openAlertMsgBox(response.responseJSON.message);
                },
                'POST',
                modifedCheckJson
            );
        });
    });//END $('#btnSave<c:out value='${haramOne.modelName}'/>').on('click', function(){
});//END $(function() {        

                    </textarea>
                </td>
                <td>
                    <textarea style="width: 450px;height: 500px;overflow:auto;" wrap="off">
                        <div class="conBox_wrap">
                            <div class="conHeader_wrap">
                                <h2><c:out value='${empty haramOne.tableComment ? haramOne.tableName : haramOne.tableComment}'/></h2>
                                <em class="count" id="<c:out value='${haramOne.objectName}'/>Count"></em>
                                <ul class="innerBtn_wrap">
                                    <li><a href="#a" id='btnInsert<c:out value='${haramOne.modelName}'/>'>행삽입</a></li>
                                    <li><a href="#a" id='btnUndo<c:out value='${haramOne.modelName}'/>'>취소</a></li>
                                    <li><a href="#a" id='btnUndoAll<c:out value='${haramOne.modelName}'/>'>전체취소</a></li>
                                </ul>
                                <ul class="btnArea">
                                    <li><button type="button" id='btnNew<c:out value='${haramOne.modelName}'/>' class="btn_add"><span>추가</span></button></li>
                                    <li><button type="button" id='btnDelete<c:out value='${haramOne.modelName}'/>' class="btn_subtract"><span>삭제</span></button></li>
                                </ul>
                            </div>
                            <div class="gridStyle_wrap hiRowM"  id="<c:out value='${haramOne.objectName}'/>.gridDiv" style="height: 200px;"></div>
                            
                            <div class="tableFooter_wrap">    
                                <div class="conBtn_wrap">
                                    <a href="#a" id='btnSave<c:out value='${haramOne.modelName}'/>' class="btn_point">저장</a>
                                </div>
                            </div>
                        </div>
                    </textarea>
                </td>
            </tr>        
    </table>

</body>
</html>
