<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>error</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="frontstageresource/css/404.css">
</head>
<body>
<div class="container">
    <div class="item" id="pink">
        <div class="chewing">
            <div class="eye left"><span></span></div>
            <div class="eye right"><span></span></div>
            <div class="mounth"></div>
            <div class="arm left"></div>
            <div class="arm right"></div>
        </div>
        <div class="shadow"></div>
    </div>

    <div class="item" id="orange">
        <div class="chewing">
            <div class="eye left"><span></span></div>
            <div class="eye right"><span></span></div>
            <div class="mounth"></div>
            <div class="arm left"></div>
            <div class="arm right"></div>
        </div>
        <div class="shadow"></div>
    </div>

    <div class="item" id="blue">
        <div class="chewing">
            <div class="eye left"><span></span></div>
            <div class="eye right"><span></span></div>
            <div class="mounth"></div>
            <div class="arm left"></div>
            <div class="arm right"></div>
        </div>
        <div class="shadow"></div>
    </div>
</div>
</body>
</html>
