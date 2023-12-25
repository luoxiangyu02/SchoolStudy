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
        <div class="crumb-list"><i class="icon-font"></i><a href="../manage/admin_index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-step">&gt;</span><span>会话详情</span></div>
    </div>


    <div style="width: 100%">
        <div id="conversation" style="float: left; width: 50%;">

            <c:forEach var="p" items="${plist }">
                <p>${p.sendTime}</p>
                <p>${p.userInput}</p>
                <p>${p.content}</p>
            </c:forEach>

        </div>

    </div>


    <div class="input-wrap">

        <button id="backButton" >返回</button>
    </div>



</div>
<!--/main-->
</div>
<script>
    $(document).ready(function() {
        // 监听发送按钮点击事件
        $("#backButton").click(function() {
            history.back(); // 使用 history.back() 方法回退到上一页
        });

    });
</script>
</body>
</html>