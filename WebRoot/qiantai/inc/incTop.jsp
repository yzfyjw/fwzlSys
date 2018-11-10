<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <script type="text/javascript" src="<%=path %>/js/tupian.js">
        /***********************************************
         * Featured Content Slider- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
         * This notice MUST stay intact for legal use
         * Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
         ***********************************************/
    </script>
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
    <script type="text/javascript">
        function liuyanAll()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
			     var url="<%=path %>/liuyanAll.action";
			     window.open(url,"_blank");
            </s:else>
        }
        function userzhongxin()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
			     window.location.href="<%=path %>/qiantai/userinfo/userzhongxin.jsp";
            </s:else>
        }
        
        
        function myXinxi()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
                var n="";
                var w="480px";
                var h="500px";
                var s="resizable:no;help:no;status:no;scroll:yes";
			    openWin(url,n,w,h,s);
            </s:else>
        }
        
	        function reg()
	        {
	                var url="<%=path %>/qiantai/userinfo/userReg.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	        }        
    </script>
    <style type="text/css">
	.Menu .secMenu {
        background-color: #000000; 
    }
	
    </style>
  </head>
  
  <body>
	 <div class="Wrapper">
		 <div class="Header">
				<div id="Menu" class="Menu">
					<div class="secMenu">
						<span id="secMenu0" class="secMenu-center">
						     <a class="logo" href="<%=path %>/qiantai/default.jsp">短租网</a>
						     <a href="<%=path %>/qiantai/default.jsp">首页</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						     <a href="<%=path %>/qiantai/zlxx.jsp">普通短租房</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						     <a href="<%=path %>/qiantai/zsxx.jsp">其他住宿</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							 <a href="#" onclick="liuyanAll()">留言板</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							 <a href="#" onclick="myXinxi()">我的信息</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							 <a href="#" onclick="userzhongxin()">
							 个人中心
							 </a>
							 <a class="topuserin" href="#" onclick="reg()">用户注册</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						     <a class="topadmin" target="_blank" href="<%=path %>/login.jsp">进入后台</a>
						</span>
					</div>
				</div>

				
		    </div>
        </div>	

  </body>
</html>
