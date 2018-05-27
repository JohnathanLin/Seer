<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<nav class="navbar navbar-default my-navbar-style" >
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">预言</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="./index"  target="_blank">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="list.html" 	>预言列表</a></li>
                <li><a href="list.html" 	>分类大全</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:;"data-toggle="modal" data-target="#loginModal">登录</a></li>
                <li><a href="javascript:;"data-toggle="modal" data-target="#registerModal">注册</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<!--登录 Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户登录</h4>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <input type="tel" class="form-control" id="loginMobile" placeholder="请输入手机号码">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="loginPassword" placeholder="输入密码">
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="loginBtn">登录</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div>
    </div>
</div>
<!--注册 Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >用户注册</h4>
            </div>
            <div class="modal-body " >

                <div class="form-group "style="height:34px;">
                    <div class=" col-xs-9">
                        <input type="tel" class="form-control" id="regMobile" placeholder="请输入手机号码">
                    </div>
                    <div class="col-xs-3">
                        <button class="btn btn-success" style="width:100%;">获取验证码</button>
                    </div>
                </div>
                <div class="form-group "style="height:34px;">
                    <div class=" col-xs-12">
                        <input type="number" class="form-control" id="verifyCode" placeholder="输入手机验证码">
                    </div>
                </div>
                <div class="form-group "style="height:34px;">
                    <div class=" col-xs-12">
                        <input type="password" class="form-control" id="regPassword" placeholder="设置您账号的密码">
                    </div>
                </div>
                <div class="form-group "style="height:34px;">
                    <div class=" col-xs-12">
                        <input type="password" class="form-control" id="regPasswordCheck" placeholder="再次输入密码">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="regBtn">注册</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div>
    </div>
</div>