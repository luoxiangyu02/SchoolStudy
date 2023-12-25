<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_menu.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="../manage/admin_index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">会话查询</span></div>
        </div>
        <div id="register" class="result-wrap">
            <form action="../manage/admin_douserdel" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab"width=100%" >
                        <tr>
                            <th>id</th>
                            <th>用户</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                           <th>操作</th>
                        </tr>
                        
                        <c:forEach var="p" items="${plist }">
                        	<tr>
                        		<td>${p.sessionId }</td>
                                <td>${p.user.username }</td>
                                <td>${p.startTime }</td>
                                <td>${p.endTime }</td>
                        		 <td>
	                                
	                             <a class="link-update"href="sessionDetail?id=${p.sessionId}&cpage=1">详情</a>
	                             
	                            

	                            </td>
                        	</tr>
	                    </c:forEach>
                        
                        
                
                        
                    </table>
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