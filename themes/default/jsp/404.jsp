<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isErrorPage="true"%>
<html lang="zh-CN">
<%@ taglib uri="/tags/website" prefix="website"%>
<%@ taglib uri="/tags/website-function" prefix="fn"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>出错了-404</title>

<style type="text/css">
body {
	background-color: #fff;
}

.content {
	background-image: url(${ fn : getUrl('css/img/404.png')
}

);
background-repeat
:
 
no-repeat
;

		
margin
:
 
5%
auto
;

		
width
:
 
590
px
;

		
height
:
 
380
px
;

	
}
.content .fa {
	margin-right: 6px;
	font-size: 18px;
}

ul {
	position: relative;
	top: 280px;
	padding-left: 20px;
	padding-top: 10px;
	font-family: Microsoft yahei;
}

li {
	line-height: 30px;
	margin-left: 190px;
	list-style: none;
}

a {
	color: #027bff;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="<l:asset path='html5shiv.js'/>"></script>
      <script src="<l:asset path='respond.js'/>"></script>
    <![endif]-->
</head>
<body>
	<!-- 页面结构 -->
	<div class="content">
		<ul>
			<!--  <li>错误详情，请查看后台日志。</li> -->
			<li><a href="javascript:window.location.reload();"><i
					class="fa fa-angle-double-left"></i>刷新一下</a></li>
			<li><a href="javascript:history.go(-1);"><i
					class="fa fa-angle-double-left"></i>返回上一页</a></li>
		</ul>
	</div>
	<!-- 需要引用的JS -->
</body>
</html>