<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>酒店注册页面</title>
<%
    String path = request.getContextPath();
%>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/default/easyui.css">

</link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/icon.css">

</link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/tree_themes/SimpleTree.css">

</link>


<script
	src="${pageContext.request.contextPath}/webresource/hotel-js/jquery-1.7.2.min.js">
</script>
<script
	src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script
	src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script
	src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>


<style>
.name,.address,.phone,.email,.description {
	display: block;
	color: red;
	font-size: 13px;
	font-weight:bold;
}
</style>
</head>
<body class="easyui-layout">
	 <div region="north" style="height:70px;background-color:#E0ECFF;">
        <div style="width:700px;height:30px;margin-left:360px;">
          <div style="font-family:华文新魏; font-size:28pt; color:#000099; margin: 18px 0px 2px 0px; font-weight:bold;">基于云模式的酒店服务信息后台管理系统 </div>
          
        </div>
      </div>


	<div region="center">
		<div
			style="height: 300px; width: 410px; margin-left: 490px; margin-top: 10px;">
			<div class="easyui-panel" title="酒店注册"
				style="height: 310px; width: 400px;">
				<div style="padding: 10px 0 0 10px">
					<form name="form" id="hotel_form"action="/hotel/hotelRegister" modelAttribute="hotel"
						method="post">
						<table style="margin: 10px 0 0 70px;">

							<tr>
								<td><span>酒店名称*</span></td>
								<td><input type="text" name="name" maxlength="20"></td>
								<td><span class="name"></span></td>
							</tr>

							<tr>
								<td><span>地址*</span></td>
								<td><input type="text" name="address" ></td>
								<td><span class="address"></span></td>
							</tr>

							<tr>
								<td><span>联系电话*</span></td>
								<td><input type="text" name="phone"></td>
								<td><span class="phone"></span></td>
							</tr>

							<tr>
								<td><span >邮箱*</span></td>
								<td><input type="text" id="id1" name="email" class="easyui-validatebox" data-options="validType:'email'"></td>
								<td><span class="email"></span></td><br>
							</tr>
							<tr>
								<td><span>简介</span></td>
								<td><textarea rows="3" cols="19" name="description"></textarea></td>
								<td><span class="description"></span></td>
							</tr>

							<input type="hidden" id="status" name="status">
						</table>
						<div class="submit" style="margin-left: 150px;">
							<a id="register" class="easyui-linkbutton" plain="true" iconCls="icon-ok">注册</a>
								<a id="back" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">返回</a>
						  
						</div>
						<div id="loading" style="width: 200px; margin-left: 40%; margin-top: 10px;z-index: 999; display: none">
        						<div class="UpdateProgress">
        						 <img src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/default/images/loading.gif" />
            
            						<span id="loadMess">数据加载中，请稍候...</span>
        						</div>
    					</div>
					</form>

				</div>
			</div>

		</div>
	</div>

	<div region="south" style="height: 40px;">
		<jsp:include page="copyright.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
 $(document).ready(function(){

 $("#back").click(function(){
 
 	window.location = "/hotel";
 
 });
	
	$("#register").click(function(){
	
	var name = $("[name='name']").val();
	var address = $("[name='address']").val();
	var phone = $("[name='phone']").val();
	var email = $("[name='email']").val();
	
	if(name==null||name==""){
		$(".name").text("请输入名称！");
		return false;
	}else{
		$(".name").text(" ");
	}
	if(address==null||address==""){
		$(".address").text("请输入地址！");
		return false;
	}else{
		$(".address").text(" ");
	}
	if(phone==null||phone==""){
		$(".phone").text("请输入联系电话！");
		return false;
	}else{
		$(".phone").text(" ");
	}
	if(email==null||email==""){
		$(".email").text("请输入电子邮箱！");
		return false;
	}else{
		$(".email").text(" ");
	}
	
	$("#loading").css("display", "block");
	
	var hotel = $("#hotel_form").serialize();
	   $.post("/hotel/hotelRegister",hotel,function(data){
	   
				   if(data=="success"){
                        $("#loading").css("display", "none");
						$.messager.alert('消息','注册成功!\n查看邮件中的编号进行注册管理员.','info');  

				   }else{
					  alert("error!");		   
				   } 
     });	
   });
   
});
 
</script>
</html>
