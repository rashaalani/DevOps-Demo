<%@ page language="java" %>
<%@ include file = "imports.jsp" %>


<%
	
	String message = (String) session.getAttribute("message");
	String status = "";
	if(session.getAttribute("status")!=null){
		status = (String)session.getAttribute("status");
	}
%>
<script language="javascript">

	function savePassword(){
		if(document.change_password.currentpassword.value=="")
		{
			alert("Please enter current password field")
		}
		else if(document.change_password.newpassword.value!=document.change_password.confirmpassword.value)
		{
			alert("Please enter same password in last two fields")
		}
		else if(document.change_password.newpassword.value=="")
		{
			alert("New password can not be blank")
		}
		else{
			document.change_password.submit();
		}
	}
	
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Change Password</title>
<link href="<%=COMMONCSS%>/openq.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>

<body>
<form name="change_password" method="post">
<input type="hidden" name="parentFormName" value=""/>
<table width="100%" height="50%"  border="0" cellpadding="0" cellspacing="0">
  <tr align="left" valign="top">
    <td width="10" class="">&nbsp;</td>
    <td class=""><div>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0" class="">
        <tr>
          <td height="10" align="left" valign="top"><img src="<%=COMMONIMAGES%>/transparent.gif" width="10" height="10" /></td>
          <td width="10" rowspan="12" align="left" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="20" align="left" valign="top" class="myexpertlist"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr align="left" valign="middle">
              <td width="5%" height="20">&nbsp;</td>
              <td width="5%">&nbsp;</td>
              <td width="5%"><img src="<%=COMMONIMAGES%>/password.gif" width="14" height="14" /></td>
              <td width="85%" class="myexperttext">Change Password</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="1" align="left" valign="top" class="back-white"><img src="<%=COMMONIMAGES%>/transparent.gif" width="1" height="1" /></td>
        </tr>
		<%if(message==null){%>
        <tr>
          <td height="10" align="left" valign="top" class="back-white"></td>
        </tr>
        <%}else{ %>
        <tr>
          <td height="10" align="center" valign="top" class="back-white">
          <%if(status!=null){
          
          		if(status.equals("failed")){ %>
          			<font color="red">
		          <% }else{%>
        		  <font color="blue">
		          <%} 
		      }
		   %>
          <b><%=message%></b></font></td>
        </tr>
        <%} 
        if(!status.equals("success")){%>
        <tr>
          <td align="left" valign="top" class="back-white"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="20" height="20" valign="top">&nbsp;</td>
              <td class=text-blue-01 width="35%" height="20" valign="top">Current Password: </td>
              <td  valign="top"><input name="currentpassword" type="password" class="field-blue-01-180x20" maxlength="50"/></td>
            </tr>
        <tr>
          <td height="10" align="left" valign="top" class="back-white"></td>
        </tr>
            <tr>
              <td width="20" height="20" valign="top">&nbsp;</td>
              <td class=text-blue-01 width="35%" height="20" valign="top">Enter New Password: </td>
              <td valign="top"><input name="newpassword" type="password" class="field-blue-01-180x20" maxlength="50"/></td>
            </tr>
        <tr>
          <td height="10" align="left" valign="top" class="back-white"></td>
        </tr>
            <tr>
              <td width="20" height="20" valign="top">&nbsp;</td>
              <td class=text-blue-01 width="35%" height="20" valign="top">Confirm New Password: </td>
              <td valign="top"><input name="confirmpassword" type="password" class="field-blue-01-180x20" maxlength="50"/></td>
            </tr>
        <tr>
          <td height="10" align="left" valign="top" class="back-white"></td>
        </tr>
            <%}else{ %>
        <tr>
          <td height="100" align="center" valign="middle"><font face="Verdana" color="blue"><b>New password will be effective from next Login</b></font></td>
        </tr>
            
		<%} %>
        </table>
        <table>
        	<tr>
	          <td width="20" height="20" valign="top">&nbsp;</td>
	          <%if(!status.equals("success")){ %>
              <td valign="top"><input name="Submit332" type="button" onclick="javascript:savePassword()" class="button-01" style="border:0;background : url(images/buttons/save.gif);width:70px; height:23px;"/></td>
              <%} %>
              <td class="text-blue-01" width="20"><input name="Submit33" type="button" style="border:0;background : url(images/buttons/close_window.gif);width:115px; height:23px;" class="button-01" onclick="javascript:window.close()" /></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="10" align="left" valign="top" class="back-white"><img src="<%=COMMONIMAGES%>/transparent.gif" width="10" height="10" /></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="top"></td>
        </tr>
      </table>
    </div></td>
  </tr>
</table>
</form>
</body>
<%
session.removeAttribute("message");
session.removeAttribute("status");
 %>
</html>