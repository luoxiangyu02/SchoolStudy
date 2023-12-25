<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_menu.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="../manage/admin_index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">装维管理</span></div>
        </div>
      <div class="search-wrap">
            <div class="search-content">
                <form action="../manage/admin_zwservlet" method="get">
                    <table class="search-tab">
                        <tr>
                        
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="订单编号" name="keyword" value="${param.keyword}" id="keyword" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                            			<td><input class="btn btn-primary btn2" id="excelout" onclick="daochu()"
								value="导出" type="button"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div id="register" class="result-wrap">
            <form action="../manage/admin_douserdel" id="myform" method="post">
            
            <c:if test="${ sessionScope.type=='2' }">
                <div class="result-title">
                    <div class="result-list">
                        <a href="../manage/admin_tozwadd"><i class="icon-font"></i>新增装维</a>
                    </div>
                    
                </div>
                </c:if>
                <div class="result-content">
                    <table class="result-tab"width=100%" >
                        <tr>
                            <th>id</th>
                            <th>订单编号</th>
                           <th>负责员工</th>
                           <th>派发时间</th>
                           <th>完成时间</th>
                           <th>用户满意度</th>
                           <th>操作</th>
                        </tr>
                        
                        <c:forEach var="p" items="${plist }">
                        	<tr>
                        		<td>${p.id }</td>
                        		<td>${p.order_id }</td>
                        		
                        		<td>${p.name }</td>
                        		<td>${p.pay_time }</td>
                        		<td>${p.finish_time }</td>
                        		<td>${p.score }</td>
                        		 <td>
	                                
	                             <a class="link-update"href="admin_tozwupdate?id=${p.id}&cpage=${cpage}">修改</a>
	                             
	                            
	                                <a class="link-del" href="javascript:Delete('你确定要删除【${p.order_id}】吗？', '../manage/admin_dozwdel?id=${p.id}&cpage=${cpage }')">删除</a>
	                          
	                            </td>
                        	</tr>
	                    </c:forEach>
                        
                        
                
                        
                    </table>
                     <div class="list-page"> 
                    	共 ${tsum} 条记录， 当前 ${cpage}/${tpage} 页
                    	<a href="admin_zwservlet?cp=1${searchParams}">首页</a>
                    	<a href="admin_zwservlet?cp=${cpage-1<1?1:cpage-1}${searchParams}">上一页</a>
                    	<a href="admin_zwservlet?cp=${cpage+1>tpage?tpage:cpage+1}${searchParams}">下一页</a>
                    	<a href="admin_zwservlet?cp=${tpage}${searchParams}">尾页</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
    
     <script>
                        	function Delete(str,href) {
                        		if(confirm(str)) {
                        			location.href=href;
                        			
                        		}
                        	}
                        	function daochu(){		
                        		window.open('../manage/export_zw?keyword='+document.getElementById("keyword").value,'_blank');
                        	}
                        </script>
</div>
</body>
</html>