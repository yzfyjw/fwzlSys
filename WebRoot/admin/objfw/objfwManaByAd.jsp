<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
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
		<script language="JavaScript" src="<%=path %>/js/popup.js" type="text/javascript"></script>
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
           function objfwDelByAd(objfwId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/objfwDelByAd.action?objfwId="+objfwId;
               }
           }
           
           function objfwShenHeByAd(objfwId)
           {
               if(confirm('您确定审核通过吗？'))
               {
                   window.location.href="<%=path %>/objfwShenHeByAd.action?objfwId="+objfwId;
               }
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
		   
        function maizhexinxin(userId)
        {
           var url="<%=path %>/userXinxi.action?userId="+userId;
           var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:350});
           pop.setContent("contentUrl",url);
           pop.setContent("title","发布人信息");
           pop.build();
           pop.show();
        }		   

       function objfwPinglun(id){
           var url="<%=path %>/pinglunMana.action?objfwId="+id;
           var pop=new Popup({ contentType:1,isReloadOnClose:false,width:650,height:450});
           pop.setContent("contentUrl",url);
           pop.setContent("title","评论管理");
           pop.build();
           pop.show();
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
				<tr class="title"  bgcolor="#C5F6AD">
					<td height="14" colspan="8" class="top">短租房信息列表</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    
					<td width="12%">房屋基本信息</td>
					<td width="14%">所在地区</td>
					<td width="8%">详细信息</td>
					<td width="6%">房屋图片</td>
					<td width="6%">价格</td>
					<td width="10%">发布时间</td>
					<td width="12%">发布人信息</td>
					<td width="14%">操作</td>
		        </tr>	
				<s:iterator value="#request.pageBean.list" id="objfw">
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
					     <s:property value="#objfw.objfwDijia"/>元/日
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#objfw.objfwShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					
					<input type="button" value="查看发布人信息" onclick="maizhexinxin(<s:property value="#objfw.objfwUserId"/>)"/>
					</td>						
					<td bgcolor="#FFFFFF" align="center">
						 <a href="#" onclick="objfwDelByAd(<s:property value="#objfw.objfwId"/>)" class="pn-loperator">删除</a>&nbsp;&nbsp;&nbsp;
						 <s:if test="#objfw.shenheFlag==1">已通过</s:if>
						 <s:else>
							<a href="#" onclick="objfwShenHeByAd(<s:property value="#objfw.objfwId"/>)" class="pn-loperator">待审核</a>
						</s:else>
						&nbsp;&nbsp;&nbsp;<a href="#" onclick="objfwPinglun(<s:property value="#objfw.objfwId"/>)" class="pn-loperator">评论管理</a>
					</td>
				</tr>
				</s:iterator>
				
			</table>
			<!--分页 -->
						<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
							<ul class="pagination"
								style="text-align: center; margin-top: 10px;">
								<c:if test="${pageBean.currentPage==1 }">
									<li class="disabled">
										<!-- 上一页 --> <a href="javaScript:void(0);"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
									</li>
								</c:if>
								<c:if test="${pageBean.currentPage!=1 }">
									<li><a
										href="${pageContext.request.contextPath}/objfwManaByAd.action?currentPage=${pageBean.currentPage-1 }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
								</c:if>
								<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
									<c:if test="${pageBean.currentPage==page }">
										<li class="active"><a href="javaScript:void(0);">${page }</a></li>
									</c:if>
									<c:if test="${pageBean.currentPage!=page }">
										<li><a
											href="${pageContext.request.contextPath}/objfwManaByAd.action?currentPage=${page }">${page }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageBean.currentPage==pageBean.totalPage }">
									<li class="disabled"><a href="javaScript:void(0);"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
								<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
									<li><a
										href="${pageContext.request.contextPath}/objfwManaByAd.action?currentPage=${pageBean.currentPage+1 }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
							</ul>
						</div>
						<!-- 分页结束 -->
		    <div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
			<table id="tipTable" border="0" bgcolor="#ffffee">
				<tr align="center">
					<td><img id="photo" src="" he----ight="80" width="80"></td>
				</tr>
			</table>
			</div>
			
	</body>
</html>
