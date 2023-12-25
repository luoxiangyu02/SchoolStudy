<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_menu.jsp"%>

<!--/sidebar-->
<div class="main-wrap">
	<c:if test="${ sessionScope.type=='2' }">
<%--	<div class="result-wrap">--%>
<%--		<div class="result-title">--%>
<%--			<h1>快捷操作</h1>--%>
<%--		</div>--%>
<%--		<div class="result-content">--%>
<%--			<div class="short-wrap">--%>
<%--				<a href="../manage/admin_useradd.jsp"><i class="icon-font">&#xe001;</i>新增员工</a>--%>
<%--				<a href="../manage/admin_tozwadd"><i class="icon-font">&#xe048;</i>新增装维信息</a>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
	</c:if>
	<c:if test="${ sessionScope.type=='1' }"> 
	  <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                </div>
            </div>
        </div>
        </c:if>
</div>
<!--/main-->
</div>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
</body>
</html>