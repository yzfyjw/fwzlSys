<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<script language="javascript">
            function closeOpen()
		    {
		       window.returnValue=false;
		       window.close();
		    }
		    function check1()
		    {
		        if(document.form1.userName.value.length < 6)
		        {
		            alert("用户名不能小于6位");
		            return false;
		        }
		        
		        if(document.form1.userPw.value.length < 6)
		        {
		            alert("密码长度不能小于6位");
		            return false;
		        }
		        if(document.form1.userPw.value!=document.form1.userPw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
		        
		        if(document.form1.userEmail.value !="" && emailYan(document.form1.userEmail.value)==false)
		        {
		            alert('请输入正确邮箱地址！');
		            return false
		        }
		        
		        
		    }
		    
		    function emailYan(s)
		    {
		        var email=s;
			    var pattern=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
			    var flag=pattern.test(email);
			    if (flag)
			    {
			        return true;
			    }
			    else
			    {
			         return false;
			    }
		    }
        </script>
	</head>
	<body>
	        <div height="5">&nbsp;
	        </div>
			<form action="<%=path %>/userReg.action" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
				    
					<tr>
						<th height="40" colspan="2" align="center" bgcolor="#F1F1F1" class="f12b-red" style="font-size: 16px;">
							用 户 注 册
						</th>
					</tr>
					<tr>
						<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							用户名：
						</td>
						<td width="80%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userName" id="userName"/><font color="red" style="font-size: 12px;">(*用户名不能小于6位)</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							密&nbsp;&nbsp;&nbsp;&nbsp;码：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="userPw"/><font color="red" style="font-size: 12px;">(*用户名不能小于6位)</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							密码确认：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="userPw1"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							真实姓名：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userRealname"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							住&nbsp;&nbsp;&nbsp;&nbsp;址：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userAddress"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							性&nbsp;&nbsp;&nbsp;&nbsp;别：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="radio" name="userSex" value="男" checked="checked"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="userSex" value="女"/>女
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							联系方式：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userTel"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							E-mail：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userEmail"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 14px;">
							QQ：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userQq"/>
						</td>
					</tr>
					<tr>
						<td bgcolor="#FFFFFF"  colspan="2" height="36" align="center">
							<input type="submit" value="&nbsp;确&nbsp;定&nbsp;" onclick="return check1();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="&nbsp;取&nbsp;消&nbsp;" onclick="closeOpen()"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
