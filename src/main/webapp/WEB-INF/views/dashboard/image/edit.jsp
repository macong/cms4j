<%--
 上传图片到相册
  User: Deng Xiaolan (824688439@qq.com)
  Date: 12-4-2
  Time: 下午8:24
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>上传活动图片</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/Ueditor/themes/default/ueditor.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-validation/1.9.0/validate.min.css">
    <script type="text/javascript" src="${ctx}/static/Ueditor/editor_config.js"></script>
    <script type="text/javascript" src="${ctx}/static/Ueditor/editor_all.js"></script>
</head>
<body>
<div id="main_container" class="main_container container_16 clearfix">
    <div class="flat_area grid_16">
        <h2>上传活动图片</h2>

        <p>上传活动图片</p>
    </div>
</div>
<div class="main_container container_16 clearfix">
    <form:form id="image" modelAttribute="image" action="${ctx}/image/save/${image.id}" method="post" enctype="multipart/form-data">
        <div class="box grid_16">
            <h2 class="box_head grad_colour round_top">上传活动图片</h2>

            <div class="toggle_container">
                <div style="float: left;width: 200px;margin-left:20%;margin-top: 15px;">
                    <input type="file" id="upload" name="file"><br>
                    <img name="image" src="${image.imageUrl}" width="190px">
                </div>
                <div class="info" style="float:left;margin-left: 5%;margin-top: 15px;">
                    图片标题：<br/><input type="text" name="title" size="52" value="${image.title}"> <br/> <br/>
                    描述：<br/><textarea type="text" name="description" cols="55" rows="5">${image.description}</textarea> <br/><br/>
                    <button type="submit" style="margin-top: 10px;width: 100px;">提交</button>
                </div>
            </div>
        </div>
    </form:form>
</div>
<script type="text/javascript">
    $(function(){
        $('#upload').live('change',function(){
        });
    })
</script>
</body>
</html>