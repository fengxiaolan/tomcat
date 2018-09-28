<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" buffer="none" %>
<%@ taglib uri="/tags/website" prefix="website" %>
<%@ taglib uri="/tags/website-function" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<website:html>
	<website:widget path="dev/common.jsp"/>
	<body>
		<website:widget path="header.jsp"/>
		<div>
			<website:screenHolder/>
		</div>
		<website:widget path="footer.jsp"/>
	</body>
</website:html>