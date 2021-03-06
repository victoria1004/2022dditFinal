<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/resources/assets/js/jsa/cloud.js"></script>

<link rel="stylesheet"
	href="/resources/assets/css/components/cards/card.css" />
<link rel="stylesheet" href="/resources/assets/css/apps/todolist.css" />
<link rel="stylesheet"
	href="/resources/assets/css/elements/custom-tree_view.css" />
<link rel="stylesheet"
	href="/resources/assets/css/elements/custom-pagination.css" />
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/elements/miscellaneous.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="/resources/assets/css/jsa/cloud.css" />
<link rel="stylesheet" href="/resources/assets/css/apps/notes.css" />
<link rel="stylesheet"
	href="/resources/assets/plugins/highlight/styles/monokai-sublime.css" />
<link rel="stylesheet"
	href="/resources/assets/plugins/perfect-scrollbar/perfect-scrollbar.css" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- sweet alert -->
<script src="/resources/plugins/sweetalerts/promise-polyfill.js"></script>
<link href="/resources/plugins/animate/animate.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert2.min.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css">	
<link href="/resources/assets/css/elements/miscellaneous.css" rel="stylesheet" type="text/css">	
	
<style>
.file-tree-folder span:before {
	display: inline-block;
	text-align: center;
	width: 30px;
	margin-right: 0.25rem;
	vertical-align: middle;
	font-size: 1rem;
	color: #2196f3;

	/* 	    content: url(data:image/svg+xml, <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="%232b50ed" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>); */
}

.text-center {
	cursor: pointer;
}
</style>
<script>
	var pjtNo = "<c:out value='${project.pjtNo}' />";
	var pjtNm = "<c:out value='${project.pjtNm}' />"; //????????? ???????????? ?????? ???????????? ????????? ???????????????.
	var mbrId = "<c:out value='${member.mbrId}' />";
	var start = 1; //?????? ?????? ????????? ??? ?????? rownum???
	var end = start + 19; //?????? ?????? ????????? ??? ??? rownum??? - 20?????? ????????? ???????????? ??????.

	//?????? ?????? ?????? ??? 
	function dirOpen(el) {
		$(el.closest('li')).toggleClass('open');
		el.closest('li').children('ul').slideToggle();
		console.log(">>" + el[0].innerText);
		var folderNm = el[0].innerText;
		getLeaf(pjtNo, folderNm); //????????? ?????? ????????? ?????? ?????? ?????? ????????? ????????????.
		getfldrFiles(pjtNo, folderNm); //????????? ?????? ????????? ?????? ?????? ????????? ????????????.

	}

	$(function() {

		getAllFiles(pjtNo, start, end); //?????? ?????? ??? ?????? ajax??? ?????? ?????? ????????? ????????????.

		//?????? ?????? ??? ???????????????????????? ????????? ?????????  ?????? ????????? ????????????.
		getParentFolder(pjtNm);

		// ?????? ????????? ?????? ?????? ??? ?????? ??????????????? ????????? ?????? ???????????? ?????????
		getAllLeafFolders(pjtNo);

		//????????? ????????? ????????? ??? ???????????? 
		$(window).scroll(
				function() {
					if ($(document).height() <= Math.floor($(window)
							.scrollTop())
							+ $(window).height() + 50) {
						start = end;
						end += 19;
						getAllFiles(pjtNo, start, end);
					}
				});

		//?????? ????????? ?????? ?????? ???
		$("#addTask").on("click", function() {
			$("#fldrDiv").css("display", "none");
			$("#n-title").attr("type", "hidden");
			$("#fileDiv").css("display", "block");
			$("#fileDiv1").css("display", "block");
			getFolder(pjtNo, pjtNm);
		})

		//?????? ?????? ?????? ?????? ???
		$("#addFldr").on("click", function() {
			$("#fileDiv").css("display", "none");
			$("#fileDiv1").css("display", "none");
			$("#n-title").attr("type", "text");
			$("#fldrDiv").css("display", "block");
			getFolder(pjtNo, pjtNm);
		})

		//?????? ?????? ??? ??????????????? ????????? ???????????? ????????? ????????? ?????????
		$(document).on("keyup", "#searchName", function() {
			var fileNm = $(this).val();
			console.log(fileNm);
			searchFiles(pjtNo, fileNm);
		})

		//cloud ?????? ?????? ??? ?????? ?????????
		$(".text-center").on("click", function() {
			window.location.href = "/cloud/main.do?pjtNo=" + pjtNo;
		})

		//?????????????????? ?????? ??????????????? ?????? ????????? ??????????????? ????????? ?????????
		$(document).on("click", ".fldrList", function() {
			var folderNm = $(this).closest(".fldrList").children()[1];
			folderNm = $(folderNm).text().trim();
			console.log("????????????", pjtNo, "folderNm", folderNm);
			getLeaf(pjtNo, folderNm);
		})

	});
</script>

<!-- aside submenu space -->
<div class="layout-px-spacing">
	<!-- aside submenu space -->
	<div class="bodyMainDiv">

		<div class="fldrside mail-box-container">
			<div class="tab-title">
				<div class="row">
					<div class="text-center menu-top">
						<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-save">
							<path
								d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"></path>
							<polyline points="17 21 17 13 7 13 7 21"></polyline>
							<polyline points="7 3 7 8 15 8"></polyline></svg>

						<h5 class="app-title">Drive</h5>
					</div>

					<div class="todoList-sidebar-scroll ps">
						<div class="col-md-12 col-sm-12 col-12 mt-4 pl-0">
							<ul class="file-tree">
							</ul>
						</div>
						<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
							<div class="ps__thumb-x" tabindex="0"
								style="left: 0px; width: 0px;"></div>
						</div>
						<div class="ps__rail-y" style="top: 0px; right: 0px;">
							<div class="ps__thumb-y" tabindex="0"
								style="top: 0px; height: 0px;"></div>
						</div>
					</div>
					<!-- <a class="btn" id="addTask" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line> -->
					<!-- line x1="5" y1="12" x2="19" y2="12"></line></svg> New Task</a> -->

					<div class="btnDiv">
						<button id="addFldr" data-toggle="modal"
							data-target="#addTaskModal" class="btn btn-outline-primary mb-2">
							<svg
								viewBox="0 0 24 24" width="24" height="24" stroke="currentColor"
								stroke-width="2" fill="none" stroke-linecap="round"
								stroke-linejoin="round" class="css-i6dzq1">
								<line x1="12" y1="5" x2="12" y2="19"></line>
								<line x1="5" y1="12" x2="19" y2="12"></line></svg>
							</button>
					</div>
				</div>
			</div>




		</div>
		<div class="rightDiv" style="margin-top: 83px;">

			<div class="searchNuploadBtn">
				<div class="search-input-group-style input-group mb-3 searchDiv">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-search">
		         <circle cx="11" cy="11" r="8"></circle>
		         <line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
						</span>
					</div>
					<input style="height: 45px;" type="text" id="searchName"
						class="form-control" placeholder="????????? ???????????????" aria-label="Username"
						aria-describedby="basic-addon1">
				</div>
				<span class="iconBtn"> <a id="addTask" data-toggle="modal"
					href="#addTaskModal"> <svg xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round" class="feather feather-upload-cloud">
							<polyline points="16 16 12 12 8 16"></polyline>
		 <line x1="12" y1="12" x2="12" y2="21"></line>
		 <path d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"></path>
							<polyline points="16 16 12 12 8 16"></polyline></svg>
				</a>
				</span>
			</div>
			<div id="fileZip">
				<div class="allLeafs"></div>
				<div class="allFiles"></div>
			</div>
		</div>
	</div>
</div>






<!-- ?????? ?????? -->
<div class="modal fade" id="addTaskModal" tabindex="-1" role="dialog"
	aria-labelledby="addTaskModalTitle" aria-modal="true"
	style="display: none;">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content" style="height: 280px;">
			<form id="upload" action="#" method="POST"
				enctype="multipart/form-data">
				<div class="modal-body" style="height: 220px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-x close" data-dismiss="modal">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line></svg>
					<div class="compose-box">
						<div class="compose-content" id="addTaskModalTitle">
							<div class="col-md-12">
								<div class="task-badge mb-4">
									<div class="input-group mb-3">
										<div class="disFlex">
											<div id="arrayList"></div>
											<div class="folderList"></div>
											<input type="hidden" id="n-title" name="leafFolder"
												class="form-control" maxlength="20" placeholder="???????????? ???????????????">
											<div id="fileDiv" class="custom-file" style="display: none;">
												<input type="file" class="custom-file-input" name="files"
													onchange="getFileNm()" multiple> <label
													id="fileLabel" class="custom-file-label" for="files">?????????
													??????????????????</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer" id="uploadFooter" style="height: 50px;">
					<input type="hidden" id="hdn" value="">
					<div class="input-group-append" style="margin-top: 5px;">
						<div id="fileDiv1" style="display: none;">
							<a href="#" onclick="fileUpload()"> <span
								class="input-group-text" id="inputGroupFileAddon02"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-upload-cloud">
										<polyline points="16 16 12 12 8 16"></polyline>
										<line x1="12" y1="12" x2="12" y2="21"></line>
										<path d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"></path>
										<polyline points="16 16 12 12 8 16"></polyline></svg>
							</span></a>
						</div>
						<div id="fldrDiv" style="display: none;">
							<a href="#" onclick="addFolder()"> <span
								class="input-group-text" id="inputGroupFileAddon02"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-upload-cloud">
										<polyline points="16 16 12 12 8 16"></polyline>
										<line x1="12" y1="12" x2="12" y2="21"></line>
										<path d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"></path>
										<polyline points="16 16 12 12 8 16"></polyline></svg>
							</span></a>
						</div>
					</div>
				</div>
				<sec:csrfInput />
			</form>
		</div>
	</div>
</div>
<!-- ?????? ??? -->
    <script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="/resources/plugins/highlight/highlight.pack.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
    <script src="/resources/assets/js/scrollspyNav.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<!--     <script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script> -->
    <!-- END THEME GLOBAL STYLE -->    
    <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
    <script src="/resources/plugins/editors/quill/quill.js"></script>
    
<script src="/resources/plugins/treeview/custom-jstree.js"></script>
<script src="/resources/assets/js/apps/todoList.js"></script>
<!-- <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script> -->
<script src="/resources/assets/js/apps/notes.js"></script>
<!-- <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script> -->
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
