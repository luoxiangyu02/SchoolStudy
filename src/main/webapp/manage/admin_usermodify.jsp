<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	        <script src="../js/jquery-1.12.4.min.js"></script>
             <script src="../js/calendar.js"></script>
<%@ include file="admin_menu.jsp"%>

<!--/sidebar-->
<div class="main-wrap">

	<div class="crumb-wrap">
		<div class="crumb-list">
			<i class="icon-font"> </i><a href="../manage/admin_index.jsp">首页</a>
			<span class="crumb-step">&gt;</span> <a class="crumb-name"
				href="../manage/admin_douserselect">用户管理</a> <span
				class="crumb-step">&gt;</span><span>修改用户</span>
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form action="../manage/admin_douserupdate" method="post" id="myform"
				name="myform"  onsubmit="return checkForm(this)">
				<input type="hidden" name="userStatus" value="${user.id_status }">
				<input type="hidden" name="id" value="${user.id }">
				<input type="hidden" name="cpage" value="${cpage }">
				<table class="insert-tab" width="100%">
					<tbody>
						   <tr>
                                <th><i class="require-red">*</i>用户名：</th>
                                <td>
                                    <input class="common-text required"
                                       onfocus="FocusItem(this)" onblur="CheckItem(this)" 
                                     id="title" name="login_id" size="50" value="${user.login_id }" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>姓名：</th>
                                <td>
                                    <input class="common-text required" id="title" name="name" size="50" value="${user.name }" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>登录密码：</th>
                                <td>
                                    <input class="common-text required"
   										onfocus="FocusItem(this)" onblur="CheckItem(this)" 
									id="title" name="pwd" size="50" value="${user.pwd }" type="text">
                                </td>
                            </tr>
                            
                             <tr>
                                <th><i class="require-red">*</i>确认密码：</th>
                                <td>
                                    <input class="common-text required" 
                                       onfocus="FocusItem(this)" onblur="CheckItem(this)" 
                                    id="title" name="rePassWord" size="50" value="${user.pwd }" type="text">
                                </td>
                            </tr>
                            
                             	<tr>
							<th>性别：</th>
							<td><input type="radio" name="sex" value="男"
								${user.sex=='男'?"checked":"" }>男 <input type="radio"
								name="sex" value="女" ${user.sex=='女'?"checked":"" }>女
							</td>
						</tr>

                             <tr>
                                <th><i class="require-red">*</i>年龄：</th>
                                <td>
                                    <input class="common-text required" id="age" name="age" size="50" value="${user.age }" type="text">
                                </td>
                            </tr>
                              <tr>
                                <th><i class="require-red">*</i>所属分公司：</th>
                                <td>
                                    <input class="common-text required" id="company" name="company" size="50" value="${user.company }" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>入职时间：</th>
                                <td><input class="common-text" name="entry_time" size="50" value="${user.entry_time }" onfocus="c.show(this)"  type="text"></td>
                            </tr>
                          
                            <tr>
                                <th><i class="require-red">*</i>联系电话：</th>
                                <td>
                                    <input class="common-text required" id="tel" name="tel" size="50" value="${user.tel }" type="text">
                                </td>
                            </tr>
                             
                              <tr>
                                <th><i class="require-red">*</i>用户平均满意度：</th>
                                <td>
                                    <input class="common-text required" id="average_satisfaction" name="average_satisfaction" size="50" value="${user.average_satisfaction }" type="text">
                                </td>
                            </tr>
                            

						<tr>
							<th></th>
							<td><input class="btn btn-primary btn6 mr10" value="提交"
								type="submit"> <input class="btn btn6"
								onClick="history.go(-1)" value="返回" type="button"></td>
						</tr>
					</tbody>
				</table>
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
				
			}
		
			break;
		case "pwd":
			if(obj.value == "") {
				alert('密码不能为空');
				flag=false;
				return;
			}else{
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
	
	// onblur 这个属性的才是需要验证
	
	for(var i=0; i<els.length; i++) {
		
		if(els[i] !=null ){
			if(els[i].getAttribute("onblur") && flag) {
				CheckItem(els[i]);
			}
		}
	}
	
	return flag;
	
}
</script>
</body>
</html>