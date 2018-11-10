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
		<script language="JavaScript" src="<%=path %>/js/popup.js" type="text/javascript"></script>
        <script language="javascript">
            function userxinxin(userId)
	        {
	           var url="<%=path %>/userXinxi.action?userId="+userId;
	           var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:350});
	           pop.setContent("contentUrl",url);
	           pop.setContent("title","预订");
	           pop.build();
	           pop.show();
	        }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="33%">时间</td>
					<td width="33%">预订价格</td>
					<td width="33%">预订用户</td>
		        </tr>	
				<s:iterator value="#request.jingpaiList" id="jingpai">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="center">
						<s:property value="#jingpai.jingpaiShijian"/>
					</td>
					<td width="25%" bgcolor="#FFFFFF" align="center">
						<s:property value="#jingpai.jingpaiJiage"/>
					</td>
					<td width="25%" bgcolor="#FFFFFF" align="center">
					    <a style="color: red" href="#" onclick="userxinxin(<s:property value="jingpaiUserId"/>)">预订用户</a>
					</td>
				</tr>
				</s:iterator>
			</table>
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
