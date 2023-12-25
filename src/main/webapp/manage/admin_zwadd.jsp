<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="../js/jquery-1.10.2.js"></script>
            <script src="../js/calendar.js"></script>
            <script src="../js/starScore.js"></script>	
            <style>
		body,li,p,ul { 
		    margin: 0;
		    padding: 0;
		    font: 12px/1 Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
		}
		ul, li, ol { list-style: none; }

		/* 重置文本格式元素 */
		a { 
			text-decoration: none; 
			cursor: pointer; 
			color:#333333; 
			font-size:14px;
		}
		a:hover { 
			text-decoration: none; 
		}
		.clearfix::after{ 
			display:block; 
			content:''; 
			height:0; 
			overflow:hidden; 
			clear:both;
		} 

		/*星星样式*/
		.content{ 
			width:600px; 
			padding-top:20px;
		}
		.title{ 
			font-size:14px; 
			background:#dfdfdf; 
			padding:10px; 
			margin-bottom:10px;
		}
		.block{ 
			width:100%; 
			margin:0 0 20px 0; 
			padding-top:10px; 
			padding-left:50px; 
			line-height:21px;
		}
		.block .star_score{ 
			float:left;
		}
		.star_list{
			height:21px;
			margin:50px; 
			line-height:21px;
		}
		.block p,.block .attitude{ 
			padding-left:20px; 
			line-height:21px; 
			display:inline-block;
		}
		.block p span{ 
			color:#C00; 
			font-size:16px; 
			font-family:Georgia, "Times New Roman", Times, serif;
		}

		.star_score { 
			background:url(images/stark2.png); 
			width:160px; 
			height:21px;  
			position:relative; 
		}

		.star_score a{ 
			height:21px; 
			display:block; 
			text-indent:-999em; 
			position:absolute;
			left:0;
		}

		.star_score a:hover{ 
			background:url(images/stars2.png);
			left:0;
		}

		.star_score a.clibg{ 
			background:url(images/stars2.png);
			left:0;
		}

		#starttwo .star_score { 
			background:url(images/starky.png);
		}

		#starttwo .star_score a:hover{ 
			background:url(images/starsy.png);
			left:0;
		}

		#starttwo .star_score a.clibg{ 
			background:url(images/starsy.png);
			left:0;
		}

		/*星星样式*/

		.show_number{ 
			padding-left:50px; 
			padding-top:20px;
		}

		.show_number li{ 
			width:240px; 
			border:1px solid #ccc; 
			padding:10px; 
			margin-right:5px; 
			margin-bottom:20px;
		}

		.atar_Show{
			background:url(images/stark2.png); 
			width:160px; height:21px;  
			position:relative; 
			float:left; 
		}

		.atar_Show p{ 
			background:url(images/stars2.png);
			left:0; 
			height:21px; 
			width:134px;
		}

		.show_number li span{ 
			display:inline-block; 
			line-height:21px;
		}


        .input-wrap {
            position: fixed;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
            /*max-width: 400px; !* 可根据需要调整宽度 *!*/
            padding: 10px;
            background-color: #f1f1f1;
            text-align: center;
        }

        #conversation p{
            font-size: 18px;
        }
</style>
            
<%@ include file="admin_menu.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="../manage/admin_index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-step">&gt;</span><span>新建会话</span></div>
        </div>


        <div style="width: 50%">
            <div id="conversation" style="float: left; width: 50%;">&nbsp;</div>
            <div  style="float: right; width: 50%; font-size: 16px;">
<%--                    <p>问题：你好</p>--%>
<%--                <p> 回答：你好，有什么可以帮到您的吗？</p>--%>

<%--                <p>问题：再见</p>--%>

<%--                <p> 回答：再见，祝您有美好的一天！</p>--%>

<%--                <p>问题：你好吗</p>--%>

<%--                <p>回答：我感觉很好，谢谢您！</p>--%>

<%--                <p>问题：你叫什么名字</p>--%>

<%--                <p> 回答：我的名字是ChatBot！</p>--%>

<%--                <p>问题：给我讲个笑话</p>--%>

<%--                <p>回答：为什么科学家不相信原子？因为它们组成了一切！</p>--%>

<%--                <p> 问题：今天天气如何</p>--%>

<%--                <p>回答：很抱歉，作为一个语言模型，我无法提供实时天气信息。建议您使用天气预报应用程序或者访问天气预报网站来获取准确的天气信息。</p>--%>

<%--                <p>问题：你能推荐一本书吗</p>--%>

<%--                <p> 回答：当然，我可以为您推荐一本书。请告诉我您感兴趣的类型或者主题，我将为您提供相关的推荐。</p>--%>

<%--                <p>问题：如何联系客服</p>--%>

<%--                <p>回答：您可以通过123-456-7890与我们的客户支持团队取得联系。</p>--%>

<%--                <p>问题：其他</p>--%>

<%--                <p>回答：对不起，我无法理解您的问题。</p>--%>


            </div>
        </div>


        <div class="input-wrap">
<%--            <input type="text" id="userInput" placeholder="请输入对话内容">--%>
            <button id="endButton" style="float:left;margin-left: 100px">结束会话</button>
            <textarea id="userInput" placeholder="请输入对话内容" style="width: 80%"></textarea>
            <button id="sendButton" style="float:right; margin-right: 100px;">发送</button>
        </div>



    </div>
    <!--/main-->
</div>
  <script>
      $(document).ready(function() {
          // 监听发送按钮点击事件
          $("#sendButton").click(function() {
              // 获取用户输入的对话内容
              var userInput = $("#userInput").val();

              // 发送用户输入的请求到后端
              $.ajax({
                  url: "../api/session?type=interact", // 后端接口的URL
                  method: "POST",
                  data: { userInput: userInput },
                  success: function(response) {
                      // 显示 AI 的响应
                      $("#conversation").append("<p><strong>用户：</strong>" + userInput + "</p>");
                      $("#conversation").append("<p><strong>AI：</strong>" + response + "</p>");

                      // 清空输入框
                      $("#userInput").val("");
                  }
              });
          });


          $("#endButton").click(function() {
              // 发送用户输入的请求到后端
              $.ajax({
                  url: "../api/session?type=endSession", // 后端接口的URL
                  method: "POST",
                  data: { userInput: '' },
                  success: function(response) {
                      if(response=='ok'){
                          location.href='admin_pingfen.jsp'
                      }else{
                          alert(response)
                      }

                  }
              });
          });
      });
    </script>
</body>
</html>