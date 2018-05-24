<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>


<title>预言管理</title>

<div class="workingArea">

    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li class="active">预言管理</li>
    </ol>

    <div class="listDataTableDiv">
        <table
                class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>发布者</th>
                <th>预言标题</th>
                <th>赞数</th>
                <th>收藏数</th>
                <th>评论数</th>
                <th>预言状态</th>
                <th>发布日期</th>
                <th>验证日期</th>
                <th>查看评论</th>
                <th>编辑预言</th>
                <th>删除文章</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${as}" var="a">
                <tr>
                    <td>${a.id}</td>
                    <td>${a.user.name}</td>
                    <td>${a.title}</td>
                    <td>${a.likeNum}</td>
                    <td>${a.collectNum}</td>
                    <td>${a.commentNum}</td>
                    <td>
                        <c:choose>
                            <c:when test="${a.status == 0}">
                                待验证
                            </c:when>
                            <c:when test="${a.status == 1}">
                                预言成功
                            </c:when>
                            <c:when test="${a.status == 2}">
                                预言失败
                            </c:when>
                        </c:choose>

                    </td>
                    <td><fmt:formatDate value="${a.createDate}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                    <td>
                        <c:choose>
                            <c:when test="${a.status == 0}">
                                待验证
                            </c:when>
                            <c:otherwise>
                                <fmt:formatDate value="${a.verifyDate}" pattern="yyyy/MM/dd HH:mm:ss" />
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="admin_comments_list?aid=${a.id}" >查看评论</a>
                    </td>
                    <td>
                        <a href="admin_article_edit?id=${a.id}">编辑文章</a>
                    </td>
                    <td>
                        <a deleteLink="true" href="admin_article_delete?id=${a.id}">删除文章</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>
<!--
wangEditor
    <div id="editor">
        <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
    </div>
    <script type="text/javascript" src="js/wangEditor/wangEditor.min.js"></script>

    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create()
    </script>
-->


</div>

<%@include file="../include/admin/adminFooter.jsp"%>