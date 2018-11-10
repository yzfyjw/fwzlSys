<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'agoodSearch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
      <style type="text/css">
      .search{
          padding-bottom:10px;
          padding-top:10px;
      }
</style>
      <form action="<%=path %>/goodSearch.action" id="" name="form1" method="post">
	        <table border="0">
	           <tr class="search">
	               <td>
	                                                                        搜索：
	               </td>
	               <td class="search" align="left">
	                  <input type="text" name="objfwName" size="13"/>
	               </td>
	           </tr><!-- 
	           <tr>
	               <td>
	                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="查询"/>
	               </td>
	               <td align="left">
	                   &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
	               </td>
	           </tr> -->
	           <tr>
			            <td align="center" colspan="2" height="30">
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               <input type="submit" value="查  询" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
						   &nbsp;
						   <input type="reset" value="重  置" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
			            </td>
			          </tr>
	        </table>
	    </form>
  </body>
</html>
