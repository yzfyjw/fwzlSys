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
	    <link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin_no.js"></script>		
        <script language="javascript">
          function objfwCancle(jingpaiId){
               if(confirm('您确定取消预订吗？')){
                  window.location.href="<%=path %>/objfwCancle.action?jingpaiId="+jingpaiId;
               }
           }        
           
	       function pinglunAdd(id)
	       {
	            var url="<%=path %>/qiantai/objfw/pinglunAdd.jsp?objfwId="+id;
	            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:700,height:400});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","写评论");
	            pop.build();
	            pop.show();
	       }           
           
           
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#C5F6AD" class="title">
					<td height="14" colspan="5" class="top">&nbsp;我的预订&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="25%">时间</td>
					<td width="25%">预订价格</td>
					<td width="25%">预订房屋</td>
					<td width="15%">房屋评论</td>
					<td width="10%">取消预订</td>
		        </tr>	
				<s:iterator value="#request.jingpaiList" id="jingpai">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="20%" bgcolor="#FFFFFF" align="center">
						<s:property value="#jingpai.jingpaiShijian"/>
					</td>
					<td width="20%" bgcolor="#FFFFFF" align="center">
						<s:property value="#jingpai.jingpaiJiage"/>
					</td>
					<td width="20%" bgcolor="#FFFFFF" align="center">
					    <s:property value="#jingpai.jingpaiObjfwName"/>
					</td>
					<td width="20%" bgcolor="#FFFFFF" align="center">
					    <a href="#" style="color: red" onclick="pinglunAdd(<s:property value="#jingpai.jingpaiObjfwId"/>)">我要评论</a>
					</td>					
					<td bgcolor="#FFFFFF" align="center">
						 <a href="#" onclick="objfwCancle(<s:property value="#jingpai.jingpaiId"/>)" class="pn-loperator">取消</a>&nbsp;&nbsp;&nbsp;
					</td>					
					
				</tr>
				</s:iterator>
			</table>
	</body>
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
</html>
