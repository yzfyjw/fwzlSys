<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
        body {position: absolute;color:#d1d1d1;background-size:contain;width: 100%;height: 100%;margin:0px;}
        /* .STYLE3 {font-size: 12px; color: #c1c1c1; } */
        .img0{
        position: absolute;
        top: 0px;
        left: 0px;
        width: 100%;
        height:645px;
        z-index: -1;
        }
        .title1{font-size: 46px; font-weight: bold; font-family:Arial,Helvetica,sans-serif;color:#214141;text-shadow:5px 2px 6px #000;}
    </style>
    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    <script language="javascript">
		 function denglu()
		 {                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }
			 
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);
		 }
		
		 function callback(data)
		 {
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		 }
     </script>
  </head>
  
  <body text="#ffffff" margin="0">
  <div>
  
  <table align="center">
    <tr>
      <td align="center" height="500" valign="middle" margin="50px">
      <form name="ThisForm" method="POST" action="" >
      <table width="500" height="100" border="0" cellspacing="0" cellpadding="0" style="margin-top:156;margin-bottom:56" align="center">
          <tr style="text-shadow:5px 2px 6px #000;">
            <th style="text-shadow:5px 2px 6px #000;" height="100" colspan="2" class="title1" scope="col">管&nbsp;理&nbsp;员&nbsp;登&nbsp;录</th>
		  </tr>
          <tr>
            <th width="40%" height="50" align="right" scope="row" class="">用户名:</th>
            <td width="60%" height="50" class="">&nbsp;<input type="text" name="userName" id="textfield" style="width:150px; height:20px; background-color:#d1d1d1; border:solid 1px #153966; font-size:12px; color:#283439; "></td>
          </tr>
          <tr>
            <th width="40%" height="50" align="right" scope="row" class="">密&nbsp;&nbsp;&nbsp;&nbsp;码:</th>
            <td height="30" class="">&nbsp;<input type="password" name="userPw" id="textfield2" style="width:150px; height:20px; background-color:#d1d1d1; border:solid 1px #153966; font-size:12px; color:#283439; "></td>
          </tr>
          <tr>
            <th height="40" colspan="2" scope="row" class="" background-color="#153966"><!-- <input type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" onclick="denglu()"/> --><img src="images/admindl02.jpg" width="66" height="29" onclick="denglu()"></th>
</tr>
        </table>
      </form>
      </td>
    </tr>
  </table>
    </div>
</body>
</html>
