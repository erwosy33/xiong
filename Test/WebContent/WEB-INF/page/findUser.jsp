<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User(Bootstrap)</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/bots335/css/bootstrap.min.css" type="text/css"></link>    
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/bots335/css/bootstrap-theme.min.css" type="text/css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/bots335/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/bots335/js/bootstrap.min.js"></script>
    <style type="text/css">
    	label span{
    		color:red;
    	}
    	label{
    		font-weight:normal;
    	}
    	#dd{
    		float: right;
    	}
    </style>
</head>
<body>
<br>
    <div class="container"> 
        <br>
        <div class="row">
            <div class="col-sm-1">User的name:</div>
            <div class="col-sm-2">
                <input type="text" id="name" name="name" class="form-control"><!-- id=要查询的列名 -->
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-primary" id="btnOk">查询</button>
                <a href="${pageContext.request.contextPath }/user/showAddUser"  class="btn btn-primary">新闻添加</a>
            </div>
        </div>
        
        
        
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-hover table-bordered table-condensed" id="table">
					  <caption><h1>User列表</h1></caption>
					  <thead>
					    <tr class="success">
					      <th  style="text-align: center;">编号</th>
					      <th  style="text-align: center;">姓名</th>
					      <th  style="text-align: center;">电话</th>
					      <th  style="text-align: center;">操作</th>
					    </tr>
					  </thead>
					  <tbody id="a" style="text-align: center;">
						   
					  </tbody>
					</table>
				<div id="fenye"><!-- 分页id -->
						
				</div>	
            </div>
        </div>
        
        
        
        
        
        
        
        
        
        
    </div>
</body>
</html>


<%-- success:function(data){
                        var h="";
                        $.each(data,function(a,b){
                          h=h+"<tr>";
  			              h=h+"<td>"+b.id+"</td>";
  				          h=h+"<td>"+b.name+"</td>";
  				          h=h+"<td>"+b.telephone+"</td>";/*a=table的id   d.列名 */
  				        h=h+"<td><a href='${pageContext.request.contextPath }/user/showfindNewsc?newsid="+b.id+"' class=\"btn btn-warning\">查看评论</a>&nbsp;&nbsp;<a href='${pageContext.request.contextPath }/news/showAddNewsc?newsid="+b.id+"' class=\"btn btn-warning\">评论</a>&nbsp;&nbsp;<a href='${pageContext.request.contextPath }/user/showUpdUser?id="+b.id+"' class=\"btn btn-warning\">修改</a>&nbsp;&nbsp;<a href=javascript:del("+b.id+") onclick=\"if(confirm('确认要删除吗？')==false)return false;\" class=\"btn btn-danger\">删除</a>&nbsp;&nbsp;</td>";
				          h=h+"</tr>";
                        });
                        $("#a").html(h);
                },
                error:function(){
                    alert("ajax错误");
                }
 --%>



<script type="text/javascript"><!--打开页面时显示数据 -->
    $("document").ready(function(){
    	//当前页码 
  		var curPage = 1;
  		//总记录数，每页显示数，总页数
  		var total,pageSize,totalPage;
  		
  		
    	$.ajax({ 
            type:"post",
            url:"${pageContext.request.contextPath }/user/showfindUserData",
            data:{
            	name:$("#name").val(),
            	pageNo:curPage
            },
            dataType:"JSON",
            success:function(data){
            	 var h="";
				 //页码大于最大页数 
				 var pageStr="";
				 totalPage=data.page;
				
					if(curPage>totalPage)curPage=totalPage; 
					//页码小于1
					if(curPage<1)curPage=1;
				    //如果是第一页
		            if(curPage==1){
		              pageStr+="<div id='dd'><button type='button' class='btn'>首页</button>&nbsp;";
		              pageStr+="<button type='button' class='btn'>上一页</button>&nbsp;";
		            }else{
		            	pageStr+="<div id='dd'>";
		            	pageStr+="<button type='button' class='btn'>";
		            	pageStr+="<a href='javascript:show(1)'>首页</a></button>&nbsp;";
		            	pageStr+="<button type='button' class='btn'>";
		            	pageStr+="<a href='javascript:show("+(curPage-1)+")'>上一页</a></button>&nbsp;";
		            }

		            //如果是最后页
					if(curPage>=totalPage){
					  pageStr+="<button type='button' class='btn'>下一页</button>&nbsp;";
					  pageStr+="<button type='button' class='btn'>尾页</button>&nbsp;";
					}else{
					     pageStr+="<button type='button' class='btn'>";
					     pageStr+="<a href='javascript:show("+(curPage+1)+")'>下一页</a></button>&nbsp;";
					     pageStr+="<button type='button' class='btn'>";
					     pageStr+="<a href='javascript:show("+totalPage+")'>尾页</a></button>&nbsp;";
					}
		           
		            pageStr+="<button type='button' class='btn btn-primary'>";
		            pageStr+="<span>第"+curPage+'页/共'+totalPage+"页</span></button></div>";
		            
					$("#fenye").html(pageStr);
					$.each(data,function(a,b){
		    			$.each(b,function(a1,b2){
		    			h=h+"<tr>";
						h=h+"<td>"+b2.id+"</td>";
						h=h+"<td>"+b2.name+"</td>";
						h=h+"<td>"+b2.telephone+"</td>";
						h=h+"<td>";
						h=h+"<button onclick='del("+b2.id+")' class='btn btn-danger'>删除</button>";
					    h=h+"<a href='${pageContext.request.contextPath }/user/showUpdUser?id="+b2.id+"' class=\"btn btn-warning\">修改</a></td>";
						h=h+"<tr>"; 
		    			});
		    			});
		    			$("#a").html(h);
		    		},
            error:function(){
                alert("ajax错误");
            }
        });
    	
    	//查询
        $("#btnOk").click(function(){
            $.ajax({ 
                type:"post",
                url:"${pageContext.request.contextPath }/user/showfindUserData",
                data:{
                	name:$("#name").val(),
                	pageNo:curPage
                },
                dataType:"JSON",
                success:function(data){
                	 var h="";
                     //页码大于最大页数 
      				 var pageStr="";
      				totalPage=data.page;
					if(curPage>totalPage)curPage=totalPage; 
					//页码小于1 
					if(curPage<1)curPage=1;
					 //如果是第一页
		            if(curPage==1){
		              pageStr+="<div id='dd'><button type='button' class='btn'>首页</button>&nbsp;";
		              pageStr+="<button type='button' class='btn'>上一页</button>&nbsp;";
		            }else{
		            	pageStr+="<div id='dd'>";
		            	pageStr+="<button type='button' class='btn'>";
		            	pageStr+="<a href='javascript:show(1)'>首页</a></button>&nbsp;";
		            	pageStr+="<button type='button' class='btn'>";
		            	pageStr+="<a href='javascript:show("+(curPage-1)+")'>上一页</a></button>&nbsp;";
		            }

		            //如果是最后页
					if(curPage>=totalPage){
					  pageStr+="<button type='button' class='btn'>下一页</button>&nbsp;";
					  pageStr+="<button type='button' class='btn'>尾页</button>&nbsp;";
					}else{
					     pageStr+="<button type='button' class='btn'>";
					     pageStr+="<a href='javascript:show("+(curPage+1)+")'>下一页</a></button>&nbsp;";
					     pageStr+="<button type='button' class='btn'>";
					     pageStr+="<a href='javascript:show("+totalPage+")'>尾页</a></button>&nbsp;";
					} 
		           
		            pageStr+="<button type='button' class='btn btn-primary'>";
		            pageStr+="<span>第"+curPage+'页/共'+totalPage+"页</span></button></div>";
      			   
   					$("#fenye").html(pageStr);
					$.each(data,function(a,b){
		    			$.each(b,function(a1,b2){
		    			h=h+"<tr>";
						h=h+"<td>"+b2.id+"</td>";
						h=h+"<td>"+b2.name+"</td>";
						h=h+"<td>"+b2.telephone+"</td>";
						h=h+"<td>";
						h=h+"<button onclick='del("+b2.id+")' class='btn btn-danger'>删除</button>";
					    h=h+"<a href='${pageContext.request.contextPath }/user/showUpdUser?id="+b2.id+"' class=\"btn btn-warning\">修改</a></td>";
						h=h+"<tr>"; 
		    			});
		    			});
		    			$("#a").html(h);
		    		},
            error:function(){
                alert("ajax错误");
            }
            });
        });
    });
    //删除
		function del(id){
			$.ajax({
				type:"post",//提交方式
				url:"${pageContext.request.contextPath }/user/delUserData",//提交数据的路径
				data:{
					id:id
				},//提交的数据
				dataType:"json",//返回数据的格式
				success:function(data){
					if(data>0){
						alert("删除成功！");
						window.location.href="${pageContext.request.contextPath }/user/showfindUser";
					}else{
						alert("删除失败！");
						window.location.href="${pageContext.request.contextPath }/user/showfindUser";
					}
				},
				error:function(){
					alert("ajax错误！");
				}
			});
		};
</script>



<script type="text/javascript">
		
		function show(curPage) {
	    	$.ajax({ 
	            type:"post",
	            url:"${pageContext.request.contextPath }/user/showfindUserData",
	            data:{
	            	name:$("#name").val(),
	            	pageNo:curPage
	            },
	            dataType:"JSON",
	            success:function(data){
	            	var h="";
                    //页码大于最大页数 
					 var pageStr="";
					 totalPage=data.page;
						if(curPage>totalPage)curPage=totalPage;
						//页码小于1 
						if(curPage<1)curPage=1;
						 //如果是第一页
			            if(curPage==1){
			              pageStr+="<div id='dd'><button type='button' class='btn'>首页</button>&nbsp;";
			              pageStr+="<button type='button' class='btn'>上一页</button>&nbsp;";
			            }else{
			            	pageStr+="<div id='dd'>";
			            	pageStr+="<button type='button' class='btn'>";
			            	pageStr+="<a href='javascript:show(1)'>首页</a></button>&nbsp;";
			            	pageStr+="<button type='button' class='btn'>";
			            	pageStr+="<a href='javascript:show("+(curPage-1)+")'>上一页</a></button>&nbsp;";
			            }

			            //如果是最后页
						if(curPage>=totalPage){
						  pageStr+="<button type='button' class='btn'>下一页</button>&nbsp;";
						  pageStr+="<button type='button' class='btn'>尾页</button>&nbsp;";
						}else{
						     pageStr+="<button type='button' class='btn'>";
						     pageStr+="<a href='javascript:show("+(curPage+1)+")'>下一页</a></button>&nbsp;";
						     pageStr+="<button type='button' class='btn'>";
						     pageStr+="<a href='javascript:show("+totalPage+")'>尾页</a></button>&nbsp;";
						} 
			           
			            pageStr+="<button type='button' class='btn btn-primary'>";
			            pageStr+="<span>第"+curPage+'页/共'+totalPage+"页</span></button></div>";
					    $("#fenye").html(pageStr);
						$.each(data,function(a,b){
			    			 $.each(b,function(a1,b2){
					    	        h=h+"<tr>";
									h=h+"<td>"+b2.id+"</td>";
									h=h+"<td>"+b2.name+"</td>";
									h=h+"<td>"+b2.telephone+"</td>";
									h=h+"<td>";
									h=h+"<button onclick='del("+b2.id+")' class='btn btn-danger'>删除</button>";
								    h=h+"<a href='${pageContext.request.contextPath }/user/showUpdUser?id="+b2.id+"' class=\"btn btn-warning\">修改</a></td>";
									h=h+"<tr>"; 
				    			});
			    			});
			    			$("#a").html(h);
			    		},
	            error:function(){
	                alert("ajax错误");
	            }
	        });
			
		}
	</script>





