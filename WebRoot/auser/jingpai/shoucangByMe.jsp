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
               if(confirm('您确定取消收藏吗？')){
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
					<td height="14" colspan="5" class="top">&nbsp;我的收藏&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="16%">时间</td>
					<td width="16%">收藏房屋</td>
					<td width="20%">房屋详情</td>
					<td width="12%">房屋图片</td>
					<td width="16%">房屋价格</td>		
					<td width="20%">预定房屋</td>
					<td width="16%">取消收藏</td>
		        </tr>	
				<s:iterator value="#request.jingpaiList" id="jingpai">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="16%" bgcolor="#FFFFFF" align="center">
						<s:property value="#jingpai.jingpaiShijian"/>
					</td>
					<td width="16%" bgcolor="#FFFFFF" align="center">
					    <s:property value="#jingpai.jingpaiObjfwName"/>
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
					
					<td align="center">
                          <s:if test="#request.zlflag==1"><font color="red">已被预订</font></s:if>
                          <s:if test="#request.zlflag==0">
                          <input type="text" name="jingpaiJiage" id="jingpaiJiage" value="<s:property value="#request.objfw.objfwDijia"/>" size="5" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                          <input type="button" value="预订房屋" onclick="jingpai(<s:property value="#request.objfw.objfwDijia"/>,<s:property value="#request.objfw.objfwId"/>)"/>&nbsp;
                          <%--  <input type="button" value="在线支付" onclick="zhifu(<s:property value="#request.objfw.objfwDijia"/>,<s:property value="#request.objfw.objfwId"/>)"/>
                          --%>
                          </s:if> 
                    </td>					
					<td bgcolor="#FFFFFF" align="center">
						 <a href="#" onclick="objfwCancle(<s:property value="#jingpai.jingpaiId"/>)" class="pn-loperator">取消收藏</a>&nbsp;&nbsp;&nbsp;
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
