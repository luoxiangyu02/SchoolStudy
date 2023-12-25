<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_menu.jsp"%>

<!--/sidebar-->
<div class="main-wrap">

	<div class="crumb-wrap">
		<div class="crumb-list">
			<i class="icon-font"></i><a href="admin_index.jsp">首页</a><span
				class="crumb-step">&gt;</span><span class="crumb-name">用户管理</span>
		</div>
	</div>
	<c:if test="${ sessionScope.type=='2' }">
		<div class="search-wrap">
			<div class="search-content">
				<form action="../manage/admin_douserselect" method="get">
					<table class="search-tab">
						<tr>

							<th width="70">关键字:</th>
							<td><input class="common-text" placeholder="名字"
								name="keyword" value="${param.keyword}" id="keyword" type="text"></td>
							<td><input class="btn btn-primary btn2" name="sub"
								value="查询" type="submit"></td>
							<td><input class="btn btn-primary btn2" id="excelout" onclick="daochu()"
								value="导出" type="button"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</c:if>
	<div class="result-wrap">
		<form action="../manage/admin_douserdel" id="myform" method="post">
			<c:if test="${ sessionScope.type=='2' }">
				<div class="result-title">
					<div class="result-list">
						<a href="../manage/admin_useradd.jsp"><i class="icon-font"></i>新增用户</a>
						<a id="batchDel"
							href="javascript:delmore('你确定删除这些用户吗？', 'myform')"><i
							class="icon-font"></i>批量删除</a>

					</div>
				</div>
			</c:if>
			<div class="result-content">
				<table class="result-tab" width="100%">
					<tr>
						<th class="tc" width="5%"><input class="allChoose" name=""
							onclick="selall(this)" type="checkbox"></th>

						<th>ID</th>
						<th>用户名</th>
						<th>姓名</th>
						<th>性别</th>
						<th>年龄</th>
						<th>所属分公司</th>
						<th>入职时间</th>
						<th>联系电话</th>
						<th>用户平均满意度</th>
						<th>操作</th>
					</tr>
					<c:forEach var="u" items="${userlist}">
						<tr>


							<td class="tc"><input name="id[]" value="${u.id}"
								type="checkbox"></td>
							<td>${u.id  }</td>
							<td>${u.login_id  }</td>
							<td>${u.name  }</td>
							<td>${u.sex }</td>
							<td>${u.age  }</td>
							<td>${u.company  }</td>
							<td>${u.entry_time  }</td>
							<td>${u.tel  }</td>
							<td>${u.average_satisfaction  }</td>
							<td><a class="link-update"
								href="admin_touserupdate?id=${u.id}&cpage=${cpage}">修改</a> <c:if
									test="${ sessionScope.type=='2' }">
									<a class="link-del"
										href="javascript:Delete('你确定要删除用户【${u.name}】吗？', '../manage/admin_douserdel?id=${u.id}&cpage=${cpage }')">删除</a>
								</c:if></td>
						</tr>
					</c:forEach>

					<script>
						function Delete(mess, url) {
							if (confirm(mess)) {
								location.href = url;

							}
						}

						function selall(o) {
							var a = document.getElementsByName('id[]');

							for (var i = 0; i < a.length; i++) {
								a[i].checked = o.checked;
							}
						}

						function delmore(mess, formname) {
							if (confirm(mess)) {
								var form = document.getElementById(formname);
								form.submit();
							}
						}
					</script>
				</table>
				<div class="list-page">
					共 ${tsum} 条记录， 当前 ${cpage}/${tpage} 页 <a
						href="admin_douserselect?cp=1${searchParams}">首页</a> <a
						href="admin_douserselect?cp=${cpage-1<1?1:cpage-1}${searchParams}">上一页</a>
					<a
						href="admin_douserselect?cp=${cpage+1>tpage?tpage:cpage+1}${searchParams}">下一页</a>
					<a href="admin_douserselect?cp=${tpage}${searchParams}">尾页</a>
				</div>
			</div>
		</form>
	</div>
</div>
<!--/main-->
</div>
<script type="text/javascript">
function daochu(){		
	window.open('../manage/export_user?keyword='+document.getElementById("keyword").value,'_blank');
}
</script>

</body>
</html>