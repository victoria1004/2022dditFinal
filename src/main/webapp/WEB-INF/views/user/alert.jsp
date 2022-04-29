<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alertPage</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
.swal-text{
    font-weight: 700;
    font-size: 18px;
    color: #3b3f5c;
}
.swal-button{
	background-color: #1b55e2;
	color: #fff;
    font-weight: 600;
}
</style>
</head>
<body>
	<script type="text/javascript">
		//alert("aaa");	
		var message = "${msg}";
		var url = "${url}";
		//var type = "${type}";
		var button = "${button}";
		console.log(url);
		console.log(message);
		console.log(button);
			swal({
				  title: "",
				  text: '${msg}',
				  //icon: '${type}',
				  button: '${button}'
			})
			.then(function(){
				document.location.href = '${url}'
			});
			
		
		
	</script>
</body>
</html>
