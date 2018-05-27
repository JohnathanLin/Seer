<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<script type="text/javascript">
    var id = -1,name;
    function resetName (id,name) {
        this.id = id;
        this.name = name;
        $('#resetNameModal').modal('show');
    }
    function createCategory(){
        $('#createCategoryModal').modal('show');

    }
    $(function(){
        $('#resetNameModal').on('show.bs.modal', function (event) {
            $("#resetName").val(name);
        });
        $('#resetNameModal').on('hide.bs.modal', function (event) {
            id=-1;
            $('#resetName').val("");
        });
        $('#submitResetName').on('click',function(){
            var name = jQuery.trim($("#resetName").val());

            $.ajax({
                url:"admin_category_update",
                data:{
                    id:id,
                    name:name
                },
                dataType:'json',
                type:'post',
                success:function(data){

                    if(data.result == "SUCCESS"){
                        alert(data.resultMsg);
                        id= -1;
                        $('#resetPwdModal').modal('hide');
                        location.reload();

                    }else{
                        alert("失败");
                    }
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
        });

        $('#submitCreateCategory').on('click',function(){
            var newName = jQuery.trim( $('#newName').val());
            $('#newName').val('');
            $.ajax({
                url:"admin_category_add",
                data:{
                    newName:newName
                },
                dataType:'json',
                type:'post',
                success:function(data){

                    if(data.result == "SUCCESS"){
                        alert(data.resultMsg);
                        id= -1;
                        $('#submitCreateCategory').modal('hide');
                        location.reload();

                    }else{
                        alert("失败");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 状态码
                    console.log(XMLHttpRequest.status);
                    // 状态
                    console.log(XMLHttpRequest.readyState);
                    // 错误信息
                    console.log(textStatus);
                    $('#submitCreateCategory').modal('hide');
                }
            });

        });
    })
</script>
<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li class="active">分类管理</li>
    </ol>
    <div class="form-group"><button class="btn btn-success" onclick="createCategory()">添加分类</button> </div>
    <div class="listDataTableDiv">
        <table
                class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>分类名称</th>
                <th>编辑名称</th>
                <th>删除分类</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td><a href="javascript:;" onclick="resetName(${c.id},'${c.name}')">编辑名称</a></td>
                    <td><a href="admin_category_delete?id=${c.id}" deleteLink="true">删除分类</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="resetNameModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">编辑分类名称</h4>
            </div>
            <div class="modal-body">


                <table class="editTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input id="resetName" name="resetName" type="text"
                                   value=""
                                   class="form-control"></td>
                    </tr>

                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
                <button type="button"id="submitResetName" class="btn btn-primary">修改名称</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="createCategoryModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >新增分类</h4>
            </div>
            <div class="modal-body">


                <table class="editTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input id="newName" name="newName" type="text"
                                   value=""
                                   class="form-control"></td>
                    </tr>

                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
                <button type="button"id="submitCreateCategory" class="btn btn-primary">修改名称</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/admin/adminFooter.jsp"%>