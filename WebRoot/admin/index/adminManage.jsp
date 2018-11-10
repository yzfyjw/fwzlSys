<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />


<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />

		
        <script language="javascript">
            function last(){
	   		   document.getElementById("formAdd").action="<%=path %>/adminManage.action";
	   		   document.getElementById("currentPage").value=${currentPage}-1;
	   		     document.formAdd.submit();
	   	   }
	   	   function next(){
	   		   document.getElementById("formAdd").action="<%=path %>/adminManage.action";
	   		   document.getElementById("currentPage").value=${currentPage}+1;
	   		   document.formAdd.submit();
	   	   }
           
        
        
           function adminDel(userId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/adminDel.action?userId="+userId;
               }
           }
           function adminAdd()
           {
          var url="<%=path%>/admin/index/adminAdd.jsp";
              window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#C5F6AD" class="title">
					<td height="14" colspan="4" class="top">&nbsp;管理员维护&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="25%">ID</td>
					<td width="25%">用户名</td>
					<td width="25%">密码</td>
					<td width="25%">操作</td>
		        </tr>	
		        <s:if test="#request.page.data==null || 

#request.page.data.size() == 0">
<tr>
<td colspan="4"><font size="15" color="red">没有数据

</font></td>
</tr>
</s:if>
<s:else>		       
				<s:iterator value="#request.adminList" id="admin">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="center">
						<s:property value="#admin.userId"/>
					</td>
					<td width="25%" bgcolor="#FFFFFF" align="center">
						<s:property value="#admin.userName"/>
					</td>
					<td width="25%" bgcolor="#FFFFFF" align="center">
					    <s:property value="#admin.userPw"/>
					</td>
					<td width="25%" bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="adminDel(<s:property value="#admin.userId"/>)" class="pn-loperator">删除</a>
					</td>
				</tr>
				</s:iterator>
				</s:else>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="adminAdd()" />
			    </td>
			    <%-- <td class="page" width="80%"><s:set name="page" value="#request.page" /> ${page.getPageDisplay()}
                </td> --%>
			  </tr>
			  
		    </table>
		     <!-- <form action="#" id="formAdd" name="formAdd" method="post" >
		    <A href="javaScript:void(0)" onclick="last()" >上一页</A>
	        <input  type="text" id="currentPage" name="currentPage" style="width: 18px" value=${currentPage}></input>
            <A href="javaScript:void(0)"  onclick="next()" >下一页</A>
            <input type="submit" value="提交" style="width: 80px;display: none"/> 
		</form> -->
		    


<style type="text/css">
.title{
    text-align:center; 
    font-weight:bold;
    font-family: 'Microsoft Yahei';
}
.title .top{
    font-size: 15px;
}
</style>		    
		</body>
	
</html>
