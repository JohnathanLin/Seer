<!-- 模仿天猫整站ssm 教程 为how2j.cn 版权所有-->
<!-- 本教程仅用于学习使用，切勿用于非法用途，由此引起一切后果与本站无关-->
<!-- 供购买者学习，请勿私自传播，否则自行承担相关法律责任-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<div class="navitagorDiv">
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<img style="margin-left:10px;margin-right:0px" class="pull-left" src="../img/site/tmallbuy.png" height="45px">
		<a class="navbar-brand" href="#nowhere">天猫后台</a>
		
		<a class="navbar-brand" href="admin_article_list">预言管理</a>
		<a class="navbar-brand" href="admin_user_list">用户管理</a>
		<a class="navbar-brand" href="admin_category_list">分类管理</a>
		<a class="navbar-text" href="logout" style="float:right;">退出登录</a>
		<!--
		<div class="navbar-text" style="float:right;">${sessionScope.username}</div>
		-->
		<div class="navbar-text" style="float:right;">${sessionScope.admin.username}</div>
	</nav>
</div>