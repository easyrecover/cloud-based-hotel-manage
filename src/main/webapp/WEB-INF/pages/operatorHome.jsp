<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>
      酒店操作员界面
    </title>
    <%
    String path = request.getContextPath();
    %>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">


    <link 
        rel="stylesheet"
        type="text/css"
        href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/default/easyui.css">

  </link>
  <link 
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/icon.css">

</link>
<link 
    rel="stylesheet"
    type="text/css"
    href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/tree_themes/SimpleTree.css">

</link>

<script src="${pageContext.request.contextPath}/webresource/hotel-js/jquery-1.7.2.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/locale/easyui-lang-zh_CN.js">
</script>
<script type="text/javascript">
 $(document).ready(function(){
	$("#exit").click(function(){
	
		 $.messager.confirm('确认', '确定要退出系统吗?', function(r){  
		 	if(r){
		 	$.post("/hotel/logout",null,function(data){
			if(data=="true"){
				window.location="/hotel/login";
				}
			});
		 }
                
       });  
		
	});

	$("#changePwd").click(function(){
	$('#tabs').tabs('add',{
				title: '修改密码',
				content: '<iframe style="width:100%;height:480px;" src="/hotel/changePwd"></iframe>',
				closable: true
			});
	});
	
	//viewManage
	$("#viewManage").click(function(){
			if($("#tabs").tabs('exists','景点信息')){
				$("#tabs").tabs('select','景点信息');
			}else{
			$('#tabs').tabs('add',{
				title: '景点信息',
				content: '<iframe style="width:100%;height:480px;" src="/hotel/hotelViewList"></iframe>',
				closable: true
			});
		}
	});
	//mktManege
	$("#mktManage").click(function(){
			if($("#tabs").tabs('exists','购物商场')){
				$("#tabs").tabs('select','购物商场');
			}else{
				$('#tabs').tabs('add',{
				title: '购物商场',
				content: '<iframe style="width:100%;height:480px;" src="/hotel/hotelMktList"></iframe>',
				closable: true
				});
		     }
	});
	//facilitiesManage
	$("#facilitiesManage").click(function(){
			if($("#tabs").tabs('exists','设施娱乐')){
				$("#tabs").tabs('select','设施娱乐');
			}else{
				$('#tabs').tabs('add',{
				title: '设施娱乐',
				content: '<iframe style="width:100%;height:480px;" src="/hotel/hotelFacilitiesList"></iframe>',
				closable: true
				});
		     }
	});
	//foodManage
	$("#foodManage").click(function(){
			if($("#tabs").tabs('exists','美食信息')){
				$("#tabs").tabs('select','美食信息');
			}else{
				$('#tabs').tabs('add',{
				title: '美食信息',
				content: '<iframe style="width:100%;height:480px;" src="/hotel/hotelFoodList"></iframe>',
				closable: true
				});
		     }
	});
	//update_userInfo
	$("#update_userInfo").click(function(){
	   $('#win_update_userInfo').window('open'); 
	   
	   $("#update_userInfo_btn").click(function(){
	   
	   	var user = $("#update_info_form").serialize();
	  	 $.post("/hotel/updateUserInfo",user,function(data){
				    if(data=="success"){
				      
				       $('#win_update_userInfo').window('close'); 
						window.parent.location.reload();
				   }else{
					   $.messager.alert('错误','修改成功!','error');	   	   
				   } 
		 });

	   });
	});
	//cancle_update_info
	$("#cancle_update_info").click(function(){
	   $('#win_update_userInfo').window('close'); 
	});	
	$("#cancle_apply").click(function(){
	   $('#win_apply').window('close'); 
	});	
	
	//applyAdmin
	$("#applyAdmin").click(function(){
	
	      $('#win_apply').window('open'); 
			$("#send_apply").click(function(){
			
			var source = $("#apply_form").serialize();
	 		$.post("/hotel/applyAdmin",source,function(data){
				    if(data=="success"){
					$.messager.alert('消息','申请已发送，请等待审核.','info'); 
					$('#win_apply').window('close');  
				   }else{
					 $.messager.alert('错误','申请发送失败，请重试！.','error');  		   
				   } 
	  		});
			
			
			});
	
	});
	
});
 
</script>
<style>
#userInfo {
	margin:5px;padding:5px; border:solid 1px #ccc;line-height:150%;
}

.tree{
	margin:5px;padding:5px; border:solid 1px #ccc;line-height:150%;height:380px;
}
</style>
</head>
<body class="easyui-layout" >
  <div region="north" style="height:70px;background-color:#E0ECFF;">
        <div style="width:700px;height:30px;margin-left:360px;">
          <div style="font-family:华文新魏; font-size:28pt; color:#000099; margin: 18px 0px 2px 0px; font-weight:bold;">基于云模式的酒店服务信息后台管理系统 </div>
          
        </div>
      </div>

<div region="west" split="true" style="width:220px;" title="导航菜单">
    <div id="userInfo">
        <div style="background-color:#99ccff;padding:2px 5px;font-weight:bold;">登录信息<a id="update_userInfo" style="color:#ff0000;font-weight:bold;margin-left:80px;cursor:pointer;">修改</a></div>
        用户名：${user.userName}<br />
        姓名：${user.realName}<br />
        所在酒店：${user.hotelName}<br />
        邮&nbsp;&nbsp;箱：<a id="user_email">${user.email}</a><br />
        电&nbsp;&nbsp;话：<a id="user_phone">${user.phone}</a><br />
    </div>
    <div id="win_update_userInfo" class="easyui-window" title="修改联系方式" closed="true" style="width:400px;height:170px;" data-options="iconCls:'icon-edit'">    
       <form name="form"  id = "update_info_form" action="/hotel/???" ENCTYPE="multipart/form-data" modelAttribute="user" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			<input type="hidden" name="userId" value="${user.userId}">
			
			<tr><td><span>联系电话</span></td><td><input type="text" name="phone" value="${user.phone}"></td></tr>

			<tr><td><span>邮箱</span></td><td><input type="text" name="email" value="${user.email}" class="easyui-validatebox" data-options="validType:'email'"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:150px;">
	    		<a id="update_userInfo_btn" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
	    		<a id="cancle_update_info" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>
     <div id="win_apply" class="easyui-window" title="申请理由" closed="true" style="width:400px;height:170px;" data-options="iconCls:'icon-edit'">    
       <form name="form"  id = "apply_form" action="/hotel/???" ENCTYPE="multipart/form-data" modelAttribute="user" method="post" >
	    	<table style="margin:10px 0 0 30px;">		
			<input type="hidden" name="userId" value="${user.userId}">
			
			<tr><td><span>申请理由</span></td><td><textarea rows="4" cols="30" name="reason"></textarea></tr>

	    	</table>
	    	<div class="submit" style="margin-left:150px;">
	    		<a id="send_apply" class="easyui-linkbutton" plain="true" iconCls="icon-ok">发送</a>
	    		<a id="cancle_apply" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>

    <div class="">
   
    <ul class="easyui-tree" data-options="animate:true,lines:true" style="height:350px;">
		
		<li data-options="state:'closed'">
			<span>公共信息管理</span>
			<ul>
				<li>
					<span>公共信息管理</span>
					<ul>
						<li>
							<a id="facilitiesManage">设施娱乐信息管理</a>
						</li>
						<li>
							<a id="viewManage">景点信息管理</a>
						</li>
						<li>
							<a id="mktManage">购物信息管理</a>
						</li>
						<li>
							<a id="foodManage">美食信息管理</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
		<li>
			<a id="applyAdmin">申请为管理员</a>
		</li>
		<li>
			<a id="changePwd">修改密码</a>
		</li>
		<li>
			<a id="exit">注销登录</a>
		</li>
	</ul>
    </div>
</div>

<div region="center">
  <div id="tabs" class="easyui-tabs" fit="true" border="false">
    <div title="系统首页">
     <!--<p style="text-align:center;font-size:medium;color:#666;border-bottom:#ccc 1px solid;"><b>基于云模式的酒店服务信息后台管理系统</b></p>
        <p style="padding-left:2em;font-weight:bold;">基于云模式的酒店服务信息后台管理系统须知：</p>
        <p style="padding-left:2em;">
            <span style="color:#ff0000;font-weight:bold;">1. 第一次登录后务必修改自己的密码，以确保操作安全。</span><br />
        <span id="conLabel"></span>-->
         <div style="margin-left:200px;margin-top:30px;"><img src="${pageContext.request.contextPath}/webresource/hotel-img/cloud.jpg" /></div>
    </div>
  </div>
</div>
<div region="south" style="height:40px;">
<jsp:include page="copyright.jsp"></jsp:include>
</div>


</body>

</html>
