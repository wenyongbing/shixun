<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/js/base.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/base.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function doupload(){
		frm.action="upload";
		frm.submit();
	}
</script>
</head>
<body>
	<form action="list" method="post" id="frm" name="frm" enctype="multipart/form-data">
	文件:<input type="file" name="file" />
	<input type="button" value="上传" onclick="doupload()"/>
		<table>
			<tr>
				<td>图片ID</td>
				<td>查看图片</td>
			</tr>
			<c:forEach items="${files }" var="f">
				<tr>
					<td>${f.id }</td>
					<td><a href="${f.filepath }" target="_blank"><font color="red">查看</font></a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>