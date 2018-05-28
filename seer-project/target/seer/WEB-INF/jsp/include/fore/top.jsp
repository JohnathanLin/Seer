<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<link href="css/bootstrap/validator/bootstrapValidator.css" rel="stylesheet"/>
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
            <a class="navbar-brand" href="#">预言家</a>
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
            <form id="regForm">
                <div class="modal-body" >

                    <div class="form-group "style="height:34px;">
                        <div class=" col-xs-9">
                            <input type="tel" class="form-control" id="regMobile" name="regMobile" placeholder="请输入手机号码">
                        </div>
                        <div class="col-xs-3">
                            <button class="btn btn-success" id="getVerifyCode" style="width:100%;">获取验证码</button>
                        </div>
                    </div>
                    <div class="form-group "style="height:34px;">
                        <div class=" col-xs-12">
                            <input type="text" class="form-control" id="verifyCode" name="verifyCode" placeholder="输入手机验证码">
                        </div>
                    </div>
                    <div class="form-group "style="height:34px;">
                        <div class=" col-xs-12">
                            <input type="password" class="form-control" id="regPassword" name="regPassword" placeholder="设置您账号的密码（6~15位）">
                        </div>
                    </div>
                    <div class="form-group "style="height:34px;">
                        <div class=" col-xs-12">
                            <input type="password" class="form-control" id="regPasswordCheck" name="regPasswordCheck" placeholder="再次输入密码（6~15位）">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="regBtn">注册</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/bmob/bmob-min.js"></script>
<script src="js/bootstrap/validator/bootstrapValidator.js"></script>
<script>
    $(function(){
        Bmob.initialize("7e3d3c83f9c9fa669a49f554df0db3c4", "fa5484bb0ba6fa87119742f897556a85");
        $('#getVerifyCode').on('click',function(e){
            e.preventDefault();
            var mobile = $('#regMobile').val();
            Bmob.Sms.requestSmsCode({"mobilePhoneNumber": mobile,"template":"yuyanjia"} ).then(function(obj) {
                alert("验证码发送成功！请注意查收。"); //
            }, function(err){
                alert("发送失败:"+err);
                console.log(err);
            });
        });

        $('#regForm').bootstrapValidator({
           message:'输入值不合法',
           feedbackIcons:{
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
           },
            fields:{
                regMobile:{
                    message:'手机号码不合法',
                    validators:{
                        notEmpty:{
                            message:'手机号码不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '手机号码长度不正确'
                        },
                        regexp:{
                            regexp:"^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$",
                            message:'手机号码不合法'
                        }
                    }
                },
                verifyCode:{
                    message:'验证码不合法',
                    validators:{
                        notEmpty:{
                            message:'验证码不能为空'
                        },
                        stringLength:{
                            min:6,
                            max:6,
                            message:'验证码长度不正确'
                        }
                    }
                },
                regPassword:{
                    message:'密码不合法',
                    validators:{
                        notEmpty:{
                            message:'密码不能为空'
                        },
                        stringLength:{
                            min:6,
                            max:15,
                            message:'密码长度不正确（6~15位）'
                        },
                        different:{
                            field:'regMobile',
                            message:'密码不能与手机号码相同'
                        }
                    }
                },
                regPasswordCheck:{
                    message:'确认密码不合法',
                    validators:{
                        notEmpty:{
                            message:'确认密码不能为空'
                        },
                        stringLength:{
                            min:6,
                            max:15,
                            message:'确认密码长度不正确（6~15位）'
                        },
                        identical:{
                            field:'regPassword',
                            message:'两次密码输入不一致'
                        }
                    }
                }
            }
        });

        $('#regBtn').on('click',function(){
            $("#regForm").bootstrapValidator('validate');//提交验证
            if ($("#regForm").data('bootstrapValidator').isValid()) {//获取验证结果，如果成功，执行下面代码
                var mobile = $('#regMobile').val();
                var verifyCode = $('#verifyCode').val();
                var password = $('#regPassword').val();
                console.log(mobile + " "+verifyCode);
                Bmob.Sms.verifySmsCode(mobile,verifyCode ).then(function(obj) {
                    if(obj.msg == 'ok'){
                         $.ajax({
                             url:'register',
                             data:{
                                 mobile:mobile,
                                 password:password
                             },
                             dataType:'text',
                             type:'post',
                             success:function(data){
                                 if(data == "SUCCESS"){
                                     alert("注册成功！");
                                     window.location.reload();
                                 }else if(data == "EXIST"){
                                     alert("手机号已存在");
                                 }else{
                                     alert("注册失败");
                                 }
                             },
                             error: function (XMLHttpRequest, textStatus, errorThrown) {
                                 // 状态码
                                 console.log(XMLHttpRequest.status);
                                 // 状态
                                 console.log(XMLHttpRequest.readyState);
                                 // 错误信息
                                 console.log(textStatus);
                             }
                         });
                    }else{
                        alert("短信验证码错误!");
                        $('#verifyCode').val('');
                        $('#regPassword').val('');
                        $('#regPasswordCheck').val('');
                    }
                }, function(err){
                    alert("发送失败:"+err);
                    console.log(err);
                });
            }else{
                alert('no');
            }
            /*

            */
        });
    });

</script>