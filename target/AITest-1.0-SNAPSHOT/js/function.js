function change(img) {
		
	img.src="getcode?"+new Date().getTime();
}


var flag=true;  //标记位


function FocusItem(obj) {
	
	if($(obj).attr('name') == 'veryCode') {
		$(obj).next().next().html('').removeClass('error');
		
	}else {
		$(obj).next('span').html('').removeClass('error');
		
	}
	

	
}

function CheckItem(obj) {
	var msgBox = $(obj).next('span');
	switch($(obj).attr('name')) {
		case "login_id":
			if(obj.value == "") {
				msgBox.html('用户名不能为空');
				msgBox.addClass('error');
				flag=false;
			}else {
				var url="usernamecheck?name="+encodeURI($(obj).val())+"&"+new Date().getTime();
				
				
				
				// "false" "true"
				$.get(url, function(data){
				
					// alert(data);
					if(data == "false") {
						msgBox.html('用户名不能使用！');
						msgBox.addClass('error');
						flag=false;
					}else{
						msgBox.html().removeClass('error');
						flag=true;
					}
					
				});
				
			}
		
			break;
		case "passWord":
			if(obj.value == "") {
				msgBox.html('密码不能为空');
				msgBox.addClass('error');
				flag=false;
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
				msgBox.html('确认密码不能为空');
				msgBox.addClass('error');
				flag=false;
			}else if($(obj).val() !=$('input[name="passWord"]').val() ){
				msgBox.html('两次输入的密码不一致');
				msgBox.addClass('error');
				flag=false;
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
			if(els[i].getAttribute("onblur")) {
				CheckItem(els[i]);
				if(!flag)
					return flag
			}
		}
	}
	
	return flag;
	
}