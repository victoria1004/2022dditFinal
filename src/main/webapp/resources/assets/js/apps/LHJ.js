
$('.input-search').on('keyup', function() {
  var rex = new RegExp($(this).val(), 'i');
    $('.todo-box .todo-item').hide();
    $('.todo-box .todo-item').filter(function() {
        return rex.test($(this).text());
    }).show();
});





function dynamicBadgeNotification( setTodoCategoryCount ) {
  var todoCategoryCount = setTodoCategoryCount;

  // Get Parents Div(s)
  var get_ParentsDiv = $('.todo-item');
  var get_TodoAllListParentsDiv = $('.todo-item .alllist');
  var get_TodoCompletedListParentsDiv = $('.todo-item.todo-task-done');
  var get_TodoImportantListParentsDiv = $('.todo-item.todo-task-important');

  // Get Parents Div(s) Counts
  var get_TodoListElementsCount = get_TodoAllListParentsDiv.length;
  var get_CompletedTaskElementsCount = get_TodoCompletedListParentsDiv.length;
  var get_ImportantTaskElementsCount = get_TodoImportantListParentsDiv.length;

  // Get Badge Div(s)
  var getBadgeTodoAllListDiv = $('.alllist .todo-badge');
  
  var getBadgeCompletedTaskListDiv = $('.nav-link .list-actions .todo-badge');
  
  var getBadgeImportantTaskListDiv = $('#todo-task-important .todo-badge');
  


  if (todoCategoryCount === 'allList') {
    if (get_TodoListElementsCount === 0) {
      getBadgeTodoAllListDiv.text('');
      return;
    }
    if (get_TodoListElementsCount > 9) {
        getBadgeTodoAllListDiv.css({
            padding: '2px 0px',
            height: '25px',
            width: '25px'
        });
    } else if (get_TodoListElementsCount <= 9) {
        getBadgeTodoAllListDiv.removeAttr('style');
    }
    getBadgeTodoAllListDiv.text(get_TodoListElementsCount);
  }
  else if (todoCategoryCount === 'completedList') {
    if (get_CompletedTaskElementsCount === 0) {
      getBadgeCompletedTaskListDiv.text('');
      return;
    }
    if (get_CompletedTaskElementsCount > 9) {
        getBadgeCompletedTaskListDiv.css({
            padding: '2px 0px',
            height: '25px',
            width: '25px'
        });
    } else if (get_CompletedTaskElementsCount <= 9) {
        getBadgeCompletedTaskListDiv.removeAttr('style');
    }
    getBadgeCompletedTaskListDiv.text(get_CompletedTaskElementsCount);
  }
  else if (todoCategoryCount === 'importantList') {
    if (get_ImportantTaskElementsCount === 0) {
      getBadgeImportantTaskListDiv.text('');
      return;
    }
    if (get_ImportantTaskElementsCount > 9) {
        getBadgeImportantTaskListDiv.css({
            padding: '2px 0px',
            height: '25px',
            width: '25px'
        });
    } else if (get_ImportantTaskElementsCount <= 9) {
        getBadgeImportantTaskListDiv.removeAttr('style');
    }
    getBadgeImportantTaskListDiv.text(get_ImportantTaskElementsCount);
  }
}

/*
function dynamicBadgeNotification( setTodoCategoryCount ) {
  var todoCategoryCount = setTodoCategoryCount;

  // Get Parents Div(s)
  var get_ParentsDiv = $('.todo-item');
  var get_TodoAllListParentsDiv = $('.todo-item.all-list');
  var get_TodoCompletedListParentsDiv = $('.todo-item.todo-task-done');
  var get_TodoImportantListParentsDiv = $('.todo-item.todo-task-important');

  // Get Parents Div(s) Counts
  var get_TodoListElementsCount = get_TodoAllListParentsDiv.length;
  var get_CompletedTaskElementsCount = get_TodoCompletedListParentsDiv.length;
  var get_ImportantTaskElementsCount = get_TodoImportantListParentsDiv.length;

  // Get Badge Div(s)
  var getBadgeTodoAllListDiv = $('#all-list .todo-badge');
  
  var getBadgeCompletedTaskListDiv = $('.nav-link .list-actions .todo-badge');
  
  var getBadgeImportantTaskListDiv = $('#todo-task-important .todo-badge');
  


  if (todoCategoryCount === 'allList') {
    if (get_TodoListElementsCount === 0) {
      getBadgeTodoAllListDiv.text('');
      return;
    }
    if (get_TodoListElementsCount > 9) {
        getBadgeTodoAllListDiv.css({
            padding: '2px 0px',
            height: '25px',
            width: '25px'
        });
    } else if (get_TodoListElementsCount <= 9) {
        getBadgeTodoAllListDiv.removeAttr('style');
    }
    getBadgeTodoAllListDiv.text(get_TodoListElementsCount);
  }
  else if (todoCategoryCount === 'completedList') {
    if (get_CompletedTaskElementsCount === 0) {
      getBadgeCompletedTaskListDiv.text('');
      return;
    }
    if (get_CompletedTaskElementsCount > 9) {
        getBadgeCompletedTaskListDiv.css({
            padding: '2px 0px',
            height: '25px',
            width: '25px'
        });
    } else if (get_CompletedTaskElementsCount <= 9) {
        getBadgeCompletedTaskListDiv.removeAttr('style');
    }
    getBadgeCompletedTaskListDiv.text(get_CompletedTaskElementsCount);
  }
  else if (todoCategoryCount === 'importantList') {
    if (get_ImportantTaskElementsCount === 0) {
      getBadgeImportantTaskListDiv.text('');
      return;
    }
    if (get_ImportantTaskElementsCount > 9) {
        getBadgeImportantTaskListDiv.css({
            padding: '2px 0px',
            height: '25px',
            width: '25px'
        });
    } else if (get_ImportantTaskElementsCount <= 9) {
        getBadgeImportantTaskListDiv.removeAttr('style');
    }
    getBadgeImportantTaskListDiv.text(get_ImportantTaskElementsCount);
  }
}
*/


new dynamicBadgeNotification('allList');
new dynamicBadgeNotification('completedList');
new dynamicBadgeNotification('importantList');

/*
  ====================
    Quill Editor
  ====================
*/


$('.mail-menu').on('click', function(event) {
  $('.tab-title').addClass('mail-menu-show');
  $('.mail-overlay').addClass('mail-overlay-show');
})
$('.mail-overlay').on('click', function(event) {
  $('.tab-title').removeClass('mail-menu-show');
  $('.mail-overlay').removeClass('mail-overlay-show');
})

const ps = new PerfectScrollbar('.todo-box-scroll', {
    suppressScrollX : true
  });

const todoListScroll = new PerfectScrollbar('.todoList-sidebar-scroll', {
    suppressScrollX : true
  });

function checkCheckbox() {
  $('.todo-item input[type="checkbox"]').click(function() {
    if ($(this).is(":checked")) {
        $(this).parents('.todo-item').addClass('todo-task-done');
    }
    else if ($(this).is(":not(:checked)")) {
        $(this).parents('.todo-item').removeClass('todo-task-done');
    }
    new dynamicBadgeNotification('completedList');
  });
}




function deletePermanentlyDropdown() {
  $('.action-dropdown .dropdown-menu .permanent-delete.dropdown-item').on('click', function(event) {
    event.preventDefault();
    if($(this).parents('.todo-item').hasClass('todo-task-trash')) {
      $(this).parents('.todo-item').remove();
    }
  });
}

function reviveMailDropdown() {
  $('.action-dropdown .dropdown-menu .revive.dropdown-item').on('click', function(event) {
    event.preventDefault();
    if($(this).parents('.todo-item').hasClass('todo-task-trash')) {
      var getTodoParent = $(this).parents('.todo-item');
      var getTodoClass = getTodoParent.attr('class');
      var getFirstClass = getTodoClass.split(' ')[1];
      $(this).parents('.todo-item').removeClass(getFirstClass);
      $(this).parents('.todo-item').addClass('all-list');
      $(this).parents('.todo-item').hide();
    }
    new dynamicBadgeNotification('allList');
    new dynamicBadgeNotification('completedList');
    new dynamicBadgeNotification('importantList');
  });
}


function priorityDropdown() {
  $('.priority-dropdown .dropdown-menu .dropdown-item').on('click', function(event) {
	console.log("ssssss ??????");
     var getClass = $(this).attr('class').split(' ')[1];
     var getDropdownClass = $(this).parents('.p-dropdown').children('.dropdown-toggle').attr('class').split(' ')[1];
     $(this).parents('.p-dropdown').children('.dropdown-toggle').removeClass(getDropdownClass);

     $(this).parents('.p-dropdown').children('.dropdown-toggle').addClass(getClass);
  })
}






//????????? ?????? ????????? 
$('.tab-title .nav-pills a.nav-link').on('click', function(event) {
	//console.log("??????????????? ", $(this));
  $(this).parents('.mail-box-container').find('.tab-title').removeClass('mail-menu-show')
  //console.log($(this).parents('.mail-box-container').find('.tab-title').removeClass('mail-menu-show'));
  $(this).parents('.mail-box-container').find('.mail-overlay').removeClass('mail-overlay-show')
})



// Validation Process

  var $_getValidationField = document.getElementsByClassName('validation-text');

  getTaskTitleInput = document.getElementById('task');

  getTaskTitleInput.addEventListener('input', function() {

      getTaskTitleInputValue = this.value;

      if (getTaskTitleInputValue == "") {
        $_getValidationField[0].innerHTML = 'Title Required';
        $_getValidationField[0].style.display = 'block';
      } else {
        $_getValidationField[0].style.display = 'none';
      }
  })

  getTaskDescriptionInput = document.getElementById('taskdescription');

  getTaskDescriptionInput.addEventListener('input', function() {

    getTaskDescriptionInputValue = this.value;

    if (getTaskDescriptionInputValue == "") {
      $_getValidationField[1].innerHTML = 'Description Required';
      $_getValidationField[1].style.display = 'block';
    } else {
      $_getValidationField[1].style.display = 'none';
    }

  })

	//?????? modal?????? ????????????
	function editIssue(issueNo){

		$('.edit-tsk').off('click').on('click', function(event) {
	        console.log($(this));
	        
			//????????? ??????
			//?????????
			var $_taskNo = document.getElementsByName(issueNo)[0].value;
			console.log("dddddddd - ",$_taskNo);
			
			//????????????
			var mrkrNoo = document.getElementsByName("mrkrNo")[0].value;
			console.log("mkNo - ", mrkrNoo);
			
			//????????????
			var tdNoo = document.getElementsByName("tdNo")[0].value;
			console.log("tdNo - ",tdNoo);
			
			//?????????
			var $_taskTitle = document.getElementById(issueNo+"t").innerHTML;
			
			//console.log($_taskTitle);
			
			//?????????
		    var $_taskText = document.getElementById(issueNo+"c").innerHTML;
			//console.log($_taskText);
			
	        var today = new Date();
	        var dd = String(today.getDate()).padStart(2, '0');
	        var mm = String(today.getMonth()); //January is 0!
	        var yyyy = today.getFullYear();
	        var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];

	        today = monthNames[mm] + ', ' + dd + ' ' + yyyy;

			//alert(today);
			
	        //var $_taskDescriptionText = quill.getText();
	        //var $_taskDescriptionInnerHTML = quill.root.innerHTML;

	        //var delta = quill.getContents();
	        //var $_textDelta = JSON.stringify(delta);

	        var length = 125;

	        var trimmedString = $_taskText.length > length ?
	          $_taskText.substring(0, length - 3) + "..." :
	          $_taskText;
			
			//alert("??????????????? : " + trimmedString);
			
			var issueNoInput = document.createElement("input");
				 issueNoInput.type = "hidden";
				 issueNoInput.name = "issueNo";
				 issueNoInput.value = $_taskNo;
				 document.getElementById('isfrm').appendChild(issueNoInput);	
	        
	    })
		
		
		//????????? ??? ?????? ???????????? ??????
	  	$('.edit-tsk').on('click', function(){
	  		//alert("??????????????????");
		  //????????? ????????? ????????????
		  fdata = $('#addTaskModal form').serializeArray();
		  console.log(fdata);
		  
		  
		  //?????? ?????? alert////////////////////////
		  const swalWithBootstrapButtons = swal.mixin({
		    confirmButtonClass: 'btn btn-success',
		    cancelButtonClass: 'btn btn-danger mr-3',
		    buttonsStyling: false,
		  }) //
		
		
		  swalWithBootstrapButtons({
		    title: '?????????????????????????',
		    //text: "You won't be able to revert this!",
		    type: 'warning',
		    showCancelButton: true,
		    confirmButtonText: '????????????',
		    cancelButtonText: '????????????',
		    reverseButtons: true,
		    padding: '2em'
		  }).then(function(result) {
		    if (result.value) {
		      swalWithBootstrapButtons(
		        '?????????????????????.',
		        //'Your file has been deleted.',
		        ''
		      ).then(function(result){
			  		if(result){
				  		location.reload(true);
			  		}
		  		})
		      
			    $.ajax({
					url : '/project/issuemain/update',
					data : fdata,
					type : 'post',
					success : function(res){
					},
					error : function(xhr){
						alert("?????? : " + xhr.status);
					},
					dataType : 'text'
				})
		      	
		    } else if (
		      // Read more about handling dismissals
		      result.dismiss === swal.DismissReason.cancel
		      
		      ) { swalWithBootstrapButtons(
		        	'?????????????????????.',
		       	 	//'Your imaginary file is safe :)',
		       	 	''
		      	  ).then(function(result){
			  			if(result){
				  			location.reload(true);
			  			}
		  	  		})
		    	}
		    
		  	})///////////////////////////
		  
	  	})
	    
	    $('#addTaskModal').modal('hide');

	}




//?????? ?????? alert
function deleteAlert(issueNo){
	
	  const swalWithBootstrapButtons = swal.mixin({
	    confirmButtonClass: 'btn btn-success',
	    cancelButtonClass: 'btn btn-danger mr-3',
	    buttonsStyling: false,
	  })
	
	  swalWithBootstrapButtons({
	    title: '?????????????????????????',
	    //text: "You won't be able to revert this!",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonText: '????????????',
	    cancelButtonText: '????????????',
	    reverseButtons: true,
	    padding: '2em'
	  }).then(function(result) {
	    if (result.value) {
	      swalWithBootstrapButtons(
	        '?????????????????????.',
	        //'Your file has been deleted.',
	        ''
	      ).then(function(result){
		  	if(result){
			  window.location.reload()
		  	}
	  		})
	      
		    $.ajax({
		
			url : '/project/issuemain/delete',
			type : 'post',
			data : {'issueNo' : issueNo},
			success : function(res){
			}
			})
	      	
	    } else if (
	      // Read more about handling dismissals
	      result.dismiss === swal.DismissReason.cancel
	      
	    ) {
	      swalWithBootstrapButtons(
	        '?????????????????????.',
	        //'Your imaginary file is safe :)',
	        ''
	      ).then(function(result){
		  	if(result){
			  	window.location.reload()
		  	}
	  		})
	    }
	    
	  })
	  
	  
	
}


