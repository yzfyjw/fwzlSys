<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link href="css/Common.css" rel="stylesheet" type="text/css" />
    <link href="css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path %>/js/popup.js" type="text/javascript"></script>
    <script language="javascript">
        function jingpai(objfwDijia,jingpaiObjfwId){
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
                 var jingpaijiage=document.getElementById("jingpaiJiage").value;
			     if(objfwDijia/2>jingpaijiage)
			     {
			         alert("预订价不能低于房屋价格的二分之一");
			     }
			     else
			     {
			        var url="<%=path %>/jingpaiAdd.action?jingpaiJiage="+jingpaijiage+"&jingpaiObjfwId="+jingpaiObjfwId;
			        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:200});
		            pop.setContent("contentUrl",url);
		            pop.setContent("title","预订");
		            pop.build();
		            pop.show();
			     }
            </s:else>
        }
        
        function pinglunAll(objfwId){
            var url="<%=path %>/pinglunAll.action?objfwId="+objfwId;
            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:650,height:450});
            pop.setContent("contentUrl",url);
            pop.setContent("title","评论");
            pop.build();
            pop.show();
        }
        
        
        
        function maizhexinxin(userId)
        {
           var url="<%=path %>/userXinxi.action?userId="+userId;
           var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:350});
           pop.setContent("contentUrl",url);
           pop.setContent("title","预订");
           pop.build();
           pop.show();
        }
        
        function zhifu()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
			     var url="<%=path %>/qiantai/objfw/zhifu.jsp";
			     window.open(url);
            </s:else>
        }
    </script>
    
  </head>
  
  <body>
<!-- head如果图片高度不合适。请修改Common.ces里面的".Header .HeaderTop"的高度。和".Header"的高度-->
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>    
<!-- head-->	
	
	
	
	
<!--body-->

<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
	     <div id="navigation" class="naivgation">
				<!-- 登录-->
				<div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">用户登陆</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
					</div>
				 </div>
				 <!-- 登录-->
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">房屋搜索</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <jsp:include flush="true" page="/qiantai/objfw/agoodSearch.jsp"></jsp:include>
					</div>
				 </div>
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">网站公告</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <s:action name="gonggaoQian5" executeResult="true"></s:action>
					</div>
				 </div>
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">日历表</a></span>
						</div>
					</div>
					<div class="Slot">
					    <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
					</div>
					<%
    				//获取当前时间
    				SimpleDateFormat sdf = new SimpleDateFormat();
    				String curDate = sdf.format(new Date());
    				//输出内容到浏览器
    				out.write("当前时间为："+curDate);
     			    %>
				 </div>
		 </div>
		 <div id="content" class="Sub">
				<div class="NewContainer770">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">房屋详情</div>
					</div>
					<div class="Slot">
						<table width="100%" border="0">
						    <tr class="tupian">
						       <td align="center">
						       <img width="260" height="200" src="<%=path %>/<s:property value="#request.objfw.fujian"/>"/>
						       </td>
					
						    </tr>
						    <tr class="first">
						        <td align="center" class="first01"><s:property value="#request.objfw.objfwName"/></td>
						    </tr>
						  
						    <tr>
						       <td align="center"><hr/></td>
						    </tr>
						    <tr>
						        <td align="center">所在地区：<s:property value="#request.objfw.objfwArea"/></td>
						    </tr>
						  
						    <tr>
						       <td align="center"><hr/></td>
						    </tr>
						     <tr>
						       <td align="center">是否预订：
						       <s:if test="#request.zlflag==1"><font color="red">已被预订</font></s:if>
						       <s:if test="#request.zlflag==0"><font color="red">未被预订</font></s:if>
						       </td>
						    </tr>
						    
						    
						    <tr>
						       <td align="center"><hr/></td>
						    </tr>
						    <tr>
						       <td align="center">详细信息：<s:property value="#request.objfw.objfwMiaoshu" escape="false"/></td>
						    </tr>
						    <tr>
						       <td align="center"><hr/></td>
						    </tr>
						    <tr>
						       <td align="center">房屋价格：<s:property value="#request.objfw.objfwDijia"/>￥/日</td>
						    </tr>
						    <tr>
						       <td align="center"><hr/></td>
						    </tr>						    
						    <tr>
						       <td align="center">查看评论：<a href="#" onclick="pinglunAll(<s:property value="#request.objfw.objfwId"/>)"/>房屋评论</a></td>
						    </tr>						    
						    
						    <tr>
						       <td align="center"><hr/></td>
						    </tr>
						    <tr>
						       <td align="center">
                                   
                                   
                                   <s:if test="#request.zlflag==1"><font color="red">已被预订</font></s:if>
                                    <s:if test="#request.zlflag==0">
                                    <input type="text" name="jingpaiJiage" id="jingpaiJiage" value="<s:property value="#request.objfw.objfwDijia"/>" size="5" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                                    <input type="button" value="预订房屋" onclick="jingpai(<s:property value="#request.objfw.objfwDijia"/>,<s:property value="#request.objfw.objfwId"/>)"/>
                                   <%--  <input type="button" value="在线支付" onclick="zhifu(<s:property value="#request.objfw.objfwDijia"/>,<s:property value="#request.objfw.objfwId"/>)"/>
                                --%>
                                  </s:if>
                                  
                                   
                                   
                               </td>
						    </tr>
						    <tr>
						       <td align="center"><hr/></td>
						    </tr>
						    <tr>
						       <td align="center">
						           <%-- <input type="button" value="收藏" onclick="jingpai(<s:property value="#request.objfw.objfwDijia"/>,<s:property value="#request.objfw.objfwId"/>)"/> --%>
						           <input type="button" value="查看发布人信息" onclick="maizhexinxin(<s:property value="#request.objfw.objfwUserId"/>)"/>
						       </td>
						    </tr>
						    </table>
                    </div>
				</div>
		 </div>
</div>
</div>
<!--body-->
	
<!--foot -->	
<div align="center" class="Wrapper">
	<div id="footer" align="center" class="Footer">
		 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</div>
</div>
<style type="text/css">
    .first{
        color: black;
        font-size: 14px;
        font-weight: bold;
    }
    .first01{
        color: black;
        padding-top: 5px;
    }
</style>
<!--foot -->	

</body>
</html>
