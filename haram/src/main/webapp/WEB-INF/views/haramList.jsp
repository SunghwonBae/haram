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
            <th>mapper - <c:out value='${haramOne.modelName}'/>.xml</th>
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

<mapper namespace="<c:out value='${haramOne.packageName}'/>.repository. <c:out value='${haramOne.modelName}'/>Repository">

    <insert id="insert <c:out value='${haramOne.modelName}'/>" parameterType="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>">
    <![CDATA[
    INSERT INTO <c:out value='${haramOne.tableName}'/> 
        ( <c:forEach var="haram" items="${haramList}" varStatus="status">
        <c:out value='${haram.dbcolumn}'/><c:if test="${!status.last}">,</c:if></c:forEach>        
        ) 
    VALUES 
        (<c:forEach var="haram" items="${haramList}" varStatus="status">
        <c:out value='${haram.insertcolumn}'/><c:if test="${!status.last}">,</c:if></c:forEach> 
        ) 
    ]]>
    </insert>

    <update id="update<c:out value='${haramOne.modelName}'/>" parameterType="<c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>">
        <![CDATA[ 
        UPDATE CP_<c:out value='${haramOne.tableName}'/>
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
    int insert<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
    int delete<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
    List<<c:out value='${haramOne.modelName}'/>> select<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
    int update<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception;
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

import com.lgcns.profit.common.model.SessionUser;

import java.text.SimpleDateFormat;
import java.util.Date;

import <c:out value='${haramOne.packageName}'/>.model.<c:out value='${haramOne.modelName}'/>;
import <c:out value='${haramOne.packageName}'/>.repository.<c:out value='${haramOne.modelName}'/>Repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
// import org.springframework.transaction.annotation.Transactional;

//log4j
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import java.util.List;

@Service("<c:out value='${haramOne.objectName}'/>Service")
public class <c:out value='${haramOne.modelName}'/>ServiceImpl implements <c:out value='${haramOne.modelName}'/>Service {
    @Autowired
    <c:out value='${haramOne.modelName}'/>Repository <c:out value='${haramOne.objectName}'/>Repository;

    
    private static final Logger LOGGER = LogManager.getLogger(<c:out value='${haramOne.modelName}'/>Service.class);

    /**
    * @Description 생성 수정 삭제에 대한  처리
    * @param
    * @return int
    */
    // @Override
    // @Transactional(rollbackFor = Exception.class)
    public int save<c:out value='${haramOne.modelName}'/>(List<<c:out value='${haramOne.modelName}'/>> <c:out value='${haramOne.objectName}'/>List, SessionUser session) throws Exception {
        int cnt = 0;
        for (<c:out value='${haramOne.modelName}'/> row : <c:out value='${haramOne.objectName}'/>List) {
            row.setTenantUid(session.getTenantId());
            row.setModifyUserUid(session.getId());
            row.setModifyModuleUid(session.getId());
            /*
            if (row.getCrudCode().equals("C")) {
                Date time = new Date();
                SimpleDateFormat format = new SimpleDateFormat("MddHHmmss");
                String verUid = format.format(time);

                //row.setExchgRateSeq(verUid+cnt);
                row.setCreateUserUid(session.getId());
                row.setCreateModuleUid(session.getId());
                this.create<c:out value='${haramOne.modelName}'/>(row);
                cnt++;
            } else if (row.getCrudCode().equals("U")) {
                this.update<c:out value='${haramOne.modelName}'/>(row);
            } else if (row.getCrudCode().equals("D")) {
                this.delete<c:out value='${haramOne.modelName}'/>(row);
            }
            */
        }
        return 1;
    }

    /**
    * @Description 생성 처리
    * @param
    * @return int
    */
    @Override
    public int insert<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>) throws Exception {
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

import com.lgcns.profit.common.model.SessionUser;
import com.lgcns.profit.common.service.SessionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

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


    @Resource(name="<c:out value='${haramOne.objectName}'/>Service")
    private <c:out value='${haramOne.modelName}'/>Service <c:out value='${haramOne.objectName}'/>Service;

    
    /**
    * @Description 검색조건 조회
    * @param
    * @return Map<String, Object>
    */
    @ApiOperation(value="검색조건조회", httpMethod="GET", notes="검색조건조회")
    @RequestMapping(method=RequestMethod.GET, path="<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}searchoptions") 
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
    @GetMapping(value="<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}/select${fn:toLowerCase(haramOne.objectName)}") 
    public Map<String, Object> select<c:out value='${haramOne.modelName}'/>(HttpServletRequest request<c:forEach var="haram" items="${haramList}" varStatus="status">
        , @RequestParam(required = false) <c:out value='${haram.modeltype}'/> <c:out value='${haram.fieldname}'/></c:forEach> 
        ) throws Exception { 
        
        <c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>  = <c:out value='${haramOne.modelName}'/>.builder()
        .<c:forEach var="haram" items="${haramList}" varStatus="status"><c:out value='${haram.fieldname}'/>(<c:out value='${haram.fieldname}'/>)
        .</c:forEach>build();
    
        SessionUser sessionUser = sessionService.retrieveSession(request.getHeader("Session-Key"));

        return Map.of("<c:out value='${haramOne.objectName}'/>List", <c:out value='${haramOne.objectName}'/>Service.select<c:out value='${haramOne.modelName}'/>(<c:out value='${haramOne.objectName}'/>));
        }

    @ApiOperation(value="저장", httpMethod="POST", notes="저장")
    @PostMapping(value="<c:out value='${packagePath}'/>/${fn:toLowerCase(haramOne.objectName)}/save${fn:toLowerCase(haramOne.objectName)}")
    public int save<c:out value='${haramOne.modelName}'/>(HttpServletRequest request, @RequestBody List<<c:out value='${haramOne.modelName}'/>> <c:out value='${haramOne.objectName}'/>List) throws Exception {
        SessionUser sessionUser = sessionService.retrieveSession(request.getHeader("Session-Key"));
        
        for(<c:out value='${haramOne.modelName}'/> <c:out value='${haramOne.objectName}'/>:<c:out value='${haramOne.objectName}'/>List){
            <c:out value='${haramOne.objectName}'/>Service.save<c:out value='${haramOne.modelName}'/>(sessionUser, <c:out value='${haramOne.objectName}'/>);
        }

        return 1;
    }
}          
                    </textarea>
                </td>
            </tr>
    </table>

</body>
</html>
