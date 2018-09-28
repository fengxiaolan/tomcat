<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="none"%>
<%@ taglib uri="/tags/website" prefix="website"%>
<%@ taglib uri="/tags/website-function" prefix="fn"%>
<!-- 公用样式表 -->
<website:style href="libs/vendor/font-awesome/font-awesome.min.css"
	rel="stylesheet" />
<website:style href="libs/vendor/monui/css/monui.css" rel="stylesheet" />
<website:style
	href="libs/assets/jquery.dataTables/jquery.dataTables.min.css"
	rel="stylesheet" />
<website:style href="css/common/common.css" rel="stylesheet" />

<website:style href="css/uc/menuleft.css" />
<website:style href="css-open/core.css" />
<website:style href="css/uc/base.css" />
<website:style href="js/utils/layer/skin/layer.css" />

<!-- 公用js -->
<website:script src="libs/vendor/jquery.min.js" />
<website:script src="libs/vendor/monui/js/form.js" />
<website:script src="libs/assets/dialog/dialog.js" />
<website:script src="libs/assets/jquery.pagination.js" />
<website:script src="libs/assets/jquery.dcjqaccordion.2.7.js" />
<website:script
	src="libs/assets/jquery.dataTables/jquery.dataTables.min.js" />
<website:script src="libs/assets/jquery.dataTables/dmp-datatable.js" />

<website:script src="libs/assets/jquery.validate/jquery.validate.min.js" />
<website:script src="libs/assets/jquery.validate/messages_cn.js" />

<website:script src="js/common/common.js" />
<website:script src="js/utils/jquery.form.js" />
<website:script src="js/utils/highcharts.js"/>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
	<script src="${fn:getUrl('js/libs/html5shiv.js')}"></script>
	<script src="${fn:getUrl('js/libs/respond.min.js')}"></script>
<![endif]-->


