<%@page import="kr.or.ddit.project.vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>do IT</title>
    <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico"/>
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <link href="/resources/assets/css/loader.css" rel="stylesheet" type="text/css" />

    
    <link href="/resources/assets/css/users/user-profile.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/main.css" rel="stylesheet" type="text/css" />
    
   
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet"> -->
	<!-- END GLOBAL MANDATORY STYLES -->
	
	<!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
	<link href="/resources/plugins/apex/apexcharts.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/dashboard/dash_1.css" rel="stylesheet" type="text/css" class="dashboard-analytics" />
	<!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="/resources/plugins/animate/animate.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/editors/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/editors/quill/quill.snow.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
	

<style type="text/css">

@font-face {
    font-family: 'SpoqaHanSansNeo-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.apexcharts-legend {
  display: flex;
  overflow: auto;
  padding: 0 10px;
}

.apexcharts-legend.position-bottom, .apexcharts-legend.position-top {
  flex-wrap: wrap
}
.apexcharts-legend.position-right, .apexcharts-legend.position-left {
  flex-direction: column;
  bottom: 0;
}

.apexcharts-legend.position-bottom.left, .apexcharts-legend.position-top.left, .apexcharts-legend.position-right, .apexcharts-legend.position-left {
  justify-content: flex-start;
}

.apexcharts-legend.position-bottom.center, .apexcharts-legend.position-top.center {
  justify-content: center;  
}

.apexcharts-legend.position-bottom.right, .apexcharts-legend.position-top.right {
  justify-content: flex-end;
}

.apexcharts-legend-series {
  cursor: pointer;
  line-height: normal;
}

.apexcharts-legend.position-bottom .apexcharts-legend-series, .apexcharts-legend.position-top .apexcharts-legend-series{
  display: flex;
  align-items: center;
}

.apexcharts-legend-text {
  position: relative;
  font-size: 14px;
}

.apexcharts-legend-text *, .apexcharts-legend-marker * {
  pointer-events: none;
}

.apexcharts-legend-marker {
  position: relative;
  display: inline-block;
  cursor: pointer;
  margin-right: 3px;
}

.apexcharts-legend.right .apexcharts-legend-series, .apexcharts-legend.left .apexcharts-legend-series{
  display: inline-block;
}

.apexcharts-legend-series.no-click {
  cursor: auto;
}

.apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series {
  display: none !important;
}

.inactive-legend {
  opacity: 0.45;
}

#leftDiv {
   float : left;
}
#seperatedHr {
   clear : both;
}
#rightDiv {
   float : right;
}
#submenu{
	position: fixed; 
	top: 80px; 
	left: 120px;
	background-color: #fdfdfd;
	width: 170px;
	height: 100%;
}
.submenu-list .active{
	font-weight: 600;
    padding: 6px 8px;
    color: #5c1ac3;
    transition: .300s;
    background-color: #29347a;
    box-shadow: 0px 1px 3px 0.5px rgb(0 0 0 / 5%);
    margin: 2px;
    width: 100%;
    margin-left: 0px;
    padding-left: 20px;
    margin-bottom: 18px;
}
.submenu-list li {
	margin-bottom: 20px;
	margin-left: 20px;
}
.submenu-list li:hover { 
	font-weight: 600;
    padding: 6px 8px;
    color: #fdfdfd; 
    transition: .300s;
    background-color: #29347a;
    box-shadow: 0px 1px 3px 0.5px rgb(0 0 0 / 5%);
    margin: 2px;
    width: 100%;
    margin-left: 0px;
    padding-left: 20px;
    margin-bottom: 18px; 
}

.submenu-list li:hover .whiteFont{
	color: #fdfdfd; 
}
.active .whiteFont {
	color: #fdfdfd;
}
</style>

</head>
<body class="dashboard-analytics">

    <!-- BEGIN LOADER -->
<div id="load_screen"> <div class="loader"> <div class="loader-content">
    <div class="spinner-grow align-self-center"></div>
</div></div></div>
<!--  END LOADER -->

<!-- BEGIN NAVBAR -->
<tiles:insertAttribute name="header" />
<!-- END NAVBAR -->


<!--  BEGIN MAIN CONTAINER  -->
<div class="main-container" id="container">

    <div class="overlay"></div>
    <div class="search-overlay"></div>
       
   <!-- BEGIN SIDEBAR -->
   <tiles:insertAttribute name="aside" />
   <!-- END SIDEBAR -->
   <div id="submenu"></div>
   <script type="text/javascript">
   $(function(){
	   var sessionNo = <%=(String)session.getAttribute("prjNo") %>
   		asideMake(sessionNo);
   })
   </script>
   
   <!--  BEGIN CONTENT AREA  -->
   <div id="content" class="main-content">
        <tiles:insertAttribute name="body"/>
      <!-- BEGIN FOOTER -->
      <tiles:insertAttribute name="footer" />
      <!-- END FOOTER -->
   </div>
   <!--  END CONTENT AREA  -->

</div>
<!-- END MAIN CONTAINER -->
<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="/resources/bootstrap/js/popper.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="/resources/assets/js/loader.js"></script>
    <script src="/resources/assets/js/app.js"></script>
	<script>
	        $(document).ready(function() {
	            App.init();
	        });
	</script>
<script src="/resources/plugins/highlight/highlight.pack.js"></script>
<script src="/resources/assets/js/custom.js"></script>
<script src="/resources/assets/js/scrollspyNav.js"></script>
<script src="/resources/assets/js/indexAside.js"></script>
<!--     <script src="/resources/assets/js/jquery-3.6.0.js"></script> -->
<script src="/resources/plugins/notification/snackbar/snackbar.min.js"></script>
<script src="/resources/assets/js/components/notification/custom-snackbar.js"></script>


</body>
</html>