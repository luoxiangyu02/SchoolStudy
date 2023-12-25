<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <link rel="stylesheet" type="text/css" href="../css/public.css"/>
    <link rel="stylesheet" type="text/css" href="../css/reg.css"/>
        <script src="../js/jquery-1.12.4.min.js"></script>
            <script src="../js/calendar.js"></script>
<%@ include file="admin_menu.jsp" %>

    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="../manage/admin_index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-step">&gt;</span><span>修改资料</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="admin_douserupdate" method="post" id="myform" name="myform"  onsubmit="return checkForm(this)">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red"></i>用户名：</th>
                                <td>
                                    <input class="common-text required" 
                                    onfocus="FocusItem(this)" onblur="CheckItem(this)" 
                                    id="title" name="login_id" size="50" value="${user.username }"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>登录密码：</th>
                                <td>
                                    <input class="common-text required" 

                                    id="title" name="pwd" size="50" type="text">
                                </td>
                            </tr>
                            
                             <tr>
                                <th><i class="require-red"></i>确认密码：</th>
                                <td>
                                    <input class="common-text required"

                                     id="title" name="rePassWord" size="50" value="" type="text">
                                </td>
                            </tr>
                            
                          <tr>
                                <th><i class="require-red"></i>邮箱：</th>
                                <td>
                                    <input class="common-text required" id="email" name="email" size="50" value="${user.email }" type="text">
                                </td>
                            </tr>

                            <tr>
                                <th><i class="require-red"></i>联系电话：</th>
                                <td>
                                    <input class="common-text required" id="tel" name="tel" size="50" value="${user.phoneNumber }" type="text">
                                </td>
                            </tr>
                             

                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
<script type="text/javascript">
var flag=true;  //标记位


function FocusItem(obj) {
	
	if($(obj).attr('name') == 'veryCode') {
		$(obj).next().next().html('').removeClass('error');
		
	}else {
		$(obj).next('span').html('').removeClass('error');
		
	}
	
	
}

function CheckItem(obj) {
	
	switch($(obj).attr('name')) {
		case "login_id":
			if(obj.value == "") {
				alert('用户名不能为空');
				flag=false;
				return;
			}else {
				var url="../usernamecheck?name="+encodeURI($(obj).val())+"&"++"&"+new Date().getTime();
				
				
				
				// "false" "true"
				$.get(url, function(data){
				
//					alert(data);
					if(data == "false") {
						alert('用户名不能使用！');
                        msgBox.addClass('error');
                        flag=false;
					}else{
                        msgBox.html().removeClass('error');
						flag=true;
					}
					
				});
				
			}
		
			break;
		case "pwd":
			if(obj.value == "") {
				alert('密码不能为空');
				flag=false;
				return;
			}else{
                let ps=$(obj).val();
                if (ps.length < 8 || !ps.match(/[a-zA-Z]/) || !ps.match(/[0-9]/)) {
                    flag=false;
                    alert("密码必须是8位以上的字母和数字组合！");
                }
                flag=true;
            }
			break;
		case "rePassWord":
			if(obj.value == "") {
				alert('确认密码不能为空');
				flag=false;
				return;
			}else if($(obj).val() !=$('input[name="pwd"]').val() ){
				alert('两次输入的密码不一致');
				flag=false;
				return;
			}else{
				flag=true;
			}
			break;
			
	
	}
	
}



function checkForm(frm) {
	var els = frm.getElementsByTagName('input');
    flag=true;
	// onblur 这个属性的才是需要验证
	
	for(var i=0; i<els.length; i++) {
		
		if(els[i] !=null ){
			if(els[i].getAttribute("onblur") && flag) {
				CheckItem(els[i]);
                if(!flag)
                    return flag
			}
		}
	}
	
	return flag;
	
}
</script>
</body>
</html>