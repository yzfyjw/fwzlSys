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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
        <script language="javascript">
           function last(){
	   		   document.getElementById("formAdd").action="<%=path %>/objfwManaByAd.action";
	   		   document.getElementById("currentPage").value=${currentPage}-1;
	   		     document.formAdd.submit();
	   	   }
	   	   function next(){
	   		   document.getElementById("formAdd").action="<%=path %>/objfwManaByAd.action";
	   		   document.getElementById("currentPage").value=${currentPage}+1;
	   		   document.formAdd.submit();
	   	   }
        
           function objfwDetailHou(objfwId)
           {
                 var url="<%=path %>/objfwDetailHou.action?objfwId="+objfwId;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
           
           
           function objfwDelByMe(objfwId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/objfwDelByMe.action?objfwId="+objfwId;
               }
           }
           
           function objfwAddByMe()
           {
                 var url="<%=path %>/auser/objfw/objfwAddByMe.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
           
           function jingpaikan(jingpaiObjfwId)
           {
               window.location.href="<%=path %>/jingpaikan.action?jingpaiObjfwId="+jingpaiObjfwId;
           }
           
           function over(picPath)
	       {
			  if (picPath=="")picPath="/images/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }		
       </script>
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
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#C5F6AD" class="title">
					<td height="14" colspan="8" class="top">&nbsp;我的短租房&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="14%">房屋名称</td>
					<td width="14%">所在地区</td>
					<td width="10%">房屋描述</td>
					<td width="8%">房屋图片</td>
					<td width="8%">房屋价格</td>
					<td width="14%">发布时间</td>
					<td width="14%">操作</td>
		        </tr>	
				<s:iterator value="#request.objfwList" id="objfw">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#objfw.objfwName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#objfw.objfwArea"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a href="#" onclick="objfwDetailHou(<s:property value="#objfw.objfwId"/>)" class="pn-loperator">详细介绍</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <div onmouseover = "over('<%=path %>/<s:property value="#objfw.fujian"/>')" onmouseout = "out()" style="cursor:hand;">
							图片
					   </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#objfw.objfwDijia"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#objfw.objfwShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="objfwDelByMe(<s:property value="#objfw.objfwId"/>)" class="pn-loperator">删除</a>
						&nbsp;&nbsp;&nbsp;
						<a href="#" onclick="jingpaikan(<s:property value="#objfw.objfwId"/>)" class="pn-loperator">查看预订情况</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			<%--
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <input type="button" value="添加" style="width: 80px;" onclick="objfwAddByMe()" />
			    </td>
			  </tr>
		    </table>
		     --%>
		    <div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="80" width="80"></TD>
				</TR>
			</TABLE>
		    </div>
	
	</body>
</html>
