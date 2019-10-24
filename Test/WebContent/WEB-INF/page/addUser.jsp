<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加User</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/bots335/css/bootstrap.min.css" type="text/css"></link>    
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/bots335/css/bootstrap-theme.min.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/bots335/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/bots335/js/bootstrap.min.js"></script>
<style type="text/css">
label span {
	color: red;
}

label {
	font-weight: normal;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">添加User</div>
			<div class="col-sm-4"></div>
		</div>
		<hr />
		<div class="row">
			<div class="col-sm-1">名称：</div>
			<div class="col-sm-2">
				<input id="name" name="name" type="text" class="form-control"><!-- id和name为实体类的属性 -->
				
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-1">电话：</div>
			<div class="col-sm-2">
				<input id="telephone" name="telephone" type="text" class="form-control">
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<input id="btnOk" type="button" value="提交" class="btn btn-primary">
				<input id="btnF" type="button" value="返回" class="btn btn-primary">
			</div>
		</div>
	</div>	
</body>
</html>
<script type="text/javascript">
	$("document").ready(function() {
		$("#btnOk").click(function() {
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath }/user/addUserData",
				data : {
					name:$("#name").val(),
					telephone:$("#telephone").val()
					
				},
				dataType : "JSON",
				success : function(data) {
					if (data > 0) {
						alert("添加成功！");
						window.location.href = "${pageContext.request.contextPath }/user/showfindUser";
					} else {
						alert("添加失败！");
					}
				},
				error : function() {
					alert("ajax错误");
				}
			});
		});
		
	});
</script>
