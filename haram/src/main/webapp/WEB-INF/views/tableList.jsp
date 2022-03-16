<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <title>배움찬</title>
    <script type="text/javascript">
        (function($) { 
            $(document).ready(function(){	
                $(".smile").click(function(){
                    alert($(this).closest("tr").find("input[name=packageName]").val()+".model."+$(this).closest("tr").find("input[name=modelName]").val()+".java 를 "+$("input[name=developerName]").val()+" 님이 Smile :)~~");


                    location.href = "<c:url value='/haramList'/>?packageName=com.lgcns.profit.category."+$(this).closest("tr").find("input[name=packageName]").val()+"&modelName="+$(this).closest("tr").find("input[name=modelName]").val()+"&schemaName="+$(this).closest("tr").find("input[name=schemaName]").val()+"&tableName="+$(this).closest("tr").find("input[name=tableName]").val()+"&tableComment="+$(this).closest("tr").find("input[name=tableComment]").val()+"&developerName="+$("input[name=developerName]").val();
                    /*
                    $.ajax({
                        url : "<c:url value='/haramList.do'/>",
                        data : {
                            "packageName" : $(this).closest("tr").find("input[name=packageName]").val(),
                            "modelName" : $(this).closest("tr").find("input[name=modelName]").val()
                            },
                        type : "post",
                        success : function(result) {
                            alert("success");
                        
                        }
                    });
                    */
        
                });

            });
        })(jQuery);	
    </script>          
</head>
<body>
    <h3>아래 개발자명과 ?로 제안하는 값을 수정하고 Smile을 클릭하세요.</h3>
    개발자명: <input name="developerName" value="배성훤" style="width:100px"/><br>
   
    <table>
        <tr><th>table name</th><th>comment?</th><th>package?</th><th>model name?</th><th>smile</th></tr>
        <c:forEach var="haram" items="${tableList}" varStatus="status">
            <tr>
                <td><c:out value='${status.index+1}'/> <input name="schemaName" value="<c:out value='${haram.schemaName}'/>" type="hidden"/><input name="tableName" value="<c:out value='${haram.tableName}'/>" type="hidden"/><c:out value='${haram.tableName}'/></td>
                <td><input name="tableComment" value="<c:out value='${haram.tableComment}'/>" style="width:100px"/></td>
                <td>com.lgcns.profit.category.<input name="packageName" value="<c:out value='${haram.packageName}'/>" style="width:130px"/></td>
                <td>.model.<input name="modelName" value="<c:out value='${haram.modelName}'/>" style="width:130px"/>.java</td><td>&nbsp;&nbsp;&nbsp;<input type="button" class="smile" name="smile" value="Smile"></td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
