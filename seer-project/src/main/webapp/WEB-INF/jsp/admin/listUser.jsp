<!-- 模仿天猫整站ssm 教程 为how2j.cn 版权所有-->
<!-- 本教程仅用于学习使用，切勿用于非法用途，由此引起一切后果与本站无关-->
<!-- 供购买者学习，请勿私自传播，否则自行承担相关法律责任-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
	var id;
	$(function(){
     	$('#submitResetPwd').on('click',function (event) {
     	    var newPwd = $('#newPwd').val();
     	    var checkNewPwd = $('#checkNewPwd').val();
     	    if(newPwd === checkNewPwd){
                $.ajax({
					url:"admin_user_password_update",
					data:{
                        userID:id,
                        newPwd:newPwd
					},
					dataType:'json',
					type:'post',
					success:function(data){

					    if(data.result == "SUCCESS"){
                            alert(data.resultMsg);
                            id= -1;
                            $('#newPwd').val("");
                            $('#checkNewPwd').val("");
                            $('#resetPwdModal').modal('hide');
						}else{
					        alert("失败");
						}

					    console.log(data);
					},
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        // 状态码
                        console.log(XMLHttpRequest.status);
                        // 状态
                        console.log(XMLHttpRequest.readyState);
                        // 错误信息
                        console.log(textStatus);
                        $('#resetPwdModal').modal('hide');
                    }
				});
			}else{
     	        alert("两次输入的密码不相同！");
			}
        });
        $('#resetPwdModal').on('show.bs.modal', function (event) {
            $("#resetUser").text(name);
        });
        $('#resetPwdModal').on('hide.bs.modal', function (event) {
            id=-1;
            $('#newPwd').val("");
            $('#checkNewPwd').val("");
        });

    });
    function resetPwd(userID,name){
        id = userID;
		$('#resetPwdModal').modal('show');
	}
</script>

<title>用户管理</title>


<div class="workingArea">
	<h1 class="label label-info" >用户管理</h1>

	<br>
	<br>

	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
			<tr class="success">
				<th>ID</th>
				<th>用户账号</th>
				<th>用户昵称</th>
				<th>手机号码</th>
				<th>电子邮箱</th>
				<th>性别</th>
				<th>用户状态</th>
				<th>用户等级</th>
				<th>重置密码</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${us}" var="u">
				<tr>
					<td>${u.id}</td>
					<td>${u.username}</td>
					<td>${u.name}</td>
					<td>${u.mobile}</td>
					<td>${u.email}</td>
					<td>${u.gender}</td>
					<td><c:choose>
						<c:when test="${u.status == 0}">
							待验证
						</c:when>
						<c:when test="${u.status == 1}">
							已验证
						</c:when>
						<c:when test="${u.status == 2}">
							已冻结
						</c:when>
					</c:choose></td>
						<td>${u.level}</td>
					<td><a href="javascript:;" onclick="resetPwd(${u.id},'${u.name}')">重置密码</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>


</div>
<!-- Modal -->
<div class="modal fade" id="resetPwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">重置用户密码</h4>
			</div>
			<div class="modal-body">
				您将重置&nbsp;<span id="resetUser"></span>&nbsp;的密码。

					<table class="editTable">
						<tr>
							<td>新的密码</td>
							<td><input id="newPwd" name="newPwd" value=""
									   type="password" class="form-control"></td>
						</tr>
						<tr>
							<td>密码确认</td>
							<td><input id="checkNewPwd" name="checkNewPwd" type="password"
									   value=""
									   class="form-control"></td>
						</tr>

					</table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
				<button type="button"id="submitResetPwd" class="btn btn-primary">重置密码</button>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/admin/adminFooter.jsp"%>
