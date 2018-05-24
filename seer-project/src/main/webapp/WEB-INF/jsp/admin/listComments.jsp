<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>评论管理</title>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li class="active">评论管理</li>
    </ol>
    <div class="">文章：${a.title}</div>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>发布者</th>
                <th>评论内容</th>
                <th>发布日期</th>
                <th>删除评论</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.user.name}</td>
                    <td>${c.content}</td>
                    <td><fmt:formatDate value="${c.createDate}" pattern="yyyy/MM/dd HH:mm:ss" /></td>

                    <td>
                        <a deleteLink="true" href="admin_comments_delete?id=${a.id}">删除评论</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>