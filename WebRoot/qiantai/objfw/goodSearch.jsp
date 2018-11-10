<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link href="css/Common.css" rel="stylesheet" type="text/css" />
    <link href="css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript">
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
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
					</div>
				 </div>
		 </div>
		 <div id="content" class="Sub">
			    <div class="NewContainer770">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">房屋搜索列表</div>
					</div>
					<div class="Slot">
					<!-- <tr>
						       <td align="center" width="770"><hr/></td>
						    </tr> -->
							<table class="bod" width="100%" border="#41bcb8 2px solid" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center">
					              <tr align="center" bgcolor="#edf3ed" height="30">
					                  <td>房屋描述</td>
					                  <td>房屋价格</td>
					                  <td>房屋图片</td>
					              </tr>
					               
								  <s:iterator value="#request.pageBean.list" id="objfw">
								  <tr align='center' bgcolor="#FFFFFF" height="22">
								 
									  <td><a href="<%=path %>/objfwDetailQian.action?objfwId=<s:property value="#objfw.objfwId"/>"><s:property value="#objfw.objfwName" escape="false"/></a></td>
									  
									  <td><s:property value="#objfw.objfwDijia"/>￥/日</td>
									  
									  <td><a href="<%=path %>/objfwDetailQian.action?objfwId=<s:property value="#objfw.objfwId"/>"> <img src="<%=path %>/<s:property value="#objfw.fujian"/>" width="60" height="60" border="0"/> </a></td>
								  
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
										href="${pageContext.request.contextPath}/goodSearch.action?currentPage=${pageBean.currentPage-1 }&objfwName=${objfwName}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
								</c:if>
								<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
									<c:if test="${pageBean.currentPage==page }">
										<li class="active"><a href="javaScript:void(0);">${page }</a></li>
									</c:if>
									<c:if test="${pageBean.currentPage!=page }">
										<li><a
											href="${pageContext.request.contextPath}/goodSearch.action?currentPage=${page }&objfwName=${objfwName}">${page }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageBean.currentPage==pageBean.totalPage }">
									<li class="disabled"><a href="javaScript:void(0);"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
								<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
									<li><a
										href="${pageContext.request.contextPath}/goodSearch.action?currentPage=${pageBean.currentPage+1 }&objfwName=${objfwName}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
							</ul>
						</div>
						<!-- 分页结束 -->
                    </div>
                    <div class="BoxFooter">
						<div class="BoxHeader-center MarginTop10">


                        </div>
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
<!--foot -->	
</body>
</html>
