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

</style>
<%@ include file="admin_menu.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="../manage/admin_index.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="../manage/admin_zwservlet">装维管理</a><span class="crumb-step">&gt;</span><span>修改装维</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="../manage/admin_dozwupdate" method="post"id="myform" name="myform">
                <input type="hidden" name="id" value="${zw.id }">
				<input type="hidden" name="cpage" value="${cpage }">
                    <table class="insert-tab" width="100%">
                       <tbody>
                             <tr>
                                <th><i class="require-red">*</i>订单编号：</th>
                                <td>
                                    <input class="common-text required" id="title" name="order_id" size="50" value="${zw.order_id }" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>负责员工：</th>
                                <td>
                                    <select class="common-text required"  name="uid">
                                    	
                                    	<c:forEach var="f" items="${flist }">
                                    		<c:if test="${zw.uid == f.id}">
                                    				<option value="${f.id }" selected="selected">${f.name} </option>
                                    			</c:if>
                                    			<c:if test="${zw.uid != f.id}">
                                    				<option value="${f.id }">${f.name} </option>
                                    			</c:if>
                                    		
                                    	</c:forEach>
                                    </select>
                                </td>
                            </tr>
                            
                             <tr>
                                <th><i class="require-red">*</i>派发时间：</th>
                                <td>
                                    <input class="common-text required" id="title" onfocus="c.show(this)"  name="pay_time" size="50" value="${zw.pay_time }" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>完成时间：</th>
                                <td>
                                    <input class="common-text required" id="title" onfocus="c.show(this)"  name="finish_time" size="50" value="${zw.finish_time }" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>用户满意度：</th>
                                <td>	
                                <div class="content">
                                      <div id="startone"  class="block clearfix" >
								          <div class="star_score"></div>
								          <p style="float:left;">您的评分：<span class="fenshu">${zw.score }</span> 分</p>
								          <div class="attitude"></div>
								    </div>
									</div>
									<input id="score" name="score" type="hidden" value="${zw.score }">
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
  <script>
     scoreFun($("#startone"))
     scoreFun($("#starttwo"),{
           fen_d:22,//每一个a的宽度
           ScoreGrade:5//a的个数5
         });
     //显示分数
      $(".show_number li p").each(function(index, element) {
        var num=$(this).attr("tip");
        var www=num*2*16;//
        $(this).css("width",www);
        $(this).parent(".atar_Show").siblings("span").text(num+"分");
    });
    </script>
</body>
</html>