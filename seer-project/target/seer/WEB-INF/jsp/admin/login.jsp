<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<title>后台登录</title>

<div class="workingArea">
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">后台登录</div>
        <div class="panel-body">
            <form class="form-horizontal" role="form" action="loginAdmin" method="post">
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-9">
                        <input type="text" name="username" class="form-control" id="username" placeholder="请输入后台用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-9">
                        <input type="password" name="password" class="form-control" id="password" placeholder="请输入后台密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../include/admin/adminFooter.jsp"%>