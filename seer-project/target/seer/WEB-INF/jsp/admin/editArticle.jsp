<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>


<title>编辑预言</title>
<script>
    $(function(){
        var status = ${a.status};
        $('#statusList li').on('click',function(){
            var txt = $(this).text();

            if("待验证" == txt){
                status = 0;
            }else if("预言成功" == txt){
                status = 1;
            }else{
                status = 2;
            }
            $('#statusBtn').text(txt);
        });
        $('#editBtn').on('click',function(){
            var title = $('#title').val();
            var content = articleEditor.txt.html();
            var id = ${a.id};
            $.ajax({
                url:"admin_article_update",
                data:{
                    id : id,
                    title:title,
                    content:content,
                    status:status
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data.result == "SUCCESS"){
                        alert(data.resultMsg);
                        window.location.href='/seer/admin/admin_article_list';
                    }else{
                        alert("失败");
                    }
                },
                error:function(){
                    // 状态码
                    console.log(XMLHttpRequest.status);
                    // 状态
                    console.log(XMLHttpRequest.readyState);
                    // 错误信息
                    console.log(textStatus);

                }

            })
            console.log(articleEditor.txt.html());
        });
    });
</script>
<div class="workingArea">


            <form method="post" id="addForm"class="form-horizontal"enctype="multipart/form-data">

                <div class="form-group">
                    <label for="title" class="col-md-1 control-label">预言标题</label>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="title" value="${a.title}">
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-md-12">
                        <div id="content">${a.content}</div>
                        <script src="../js/wangEditor/wangEditor.min.js"></script>
                        <script type="text/javascript">
                            var E = window.wangEditor;
                            var articleEditor = new E('#content');
                            articleEditor.create();
                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-1 control-label">预言状态</label>
                    <div class="col-md-11">
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="true" >
                                <span id="statusBtn">
                                <c:if test="${a.status == 0}">待验证</c:if>
                                <c:if test="${a.status == 1}">预言成功</c:if>
                                <c:if test="${a.status == 2}">预言失败</c:if>
                                    </span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="statusList">
                                <li><a href="javascript:void(0);">待验证</a></li>
                                <li><a href="javascript:void(0);">预言成功</a></li>
                                <li><a href="javascript:void(0);">预言失败</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-success" id="editBtn">编辑</button>
            </form>
        </div>


<%@include file="../include/admin/adminFooter.jsp"%>