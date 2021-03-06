

/*
=========================================
|                                       |
|          Variables Definations        |
|                                       |
=========================================
*/

var Container = {
    scrumboard: $('.scrumboard'),
    card: $('.scrumboard .card')
}

// Containers
var scrumboard = Container.scrumboard;
var card = Container.card;


//칸반카드 이동...
function $_taskSortable() {
	
    var kbcardnoA = '';
	var oldkbnoA = '';
	var positionA = '';
	
	var newkbnoB = '';
	var kbcardnoB = '';
	var positionB = '';
	
	
    $('[data-sortable="true"]').sortable({
        connectWith: '.connect-sorting-content',
        items: ".card",
        cursor: 'move',
        placeholder: "ui-state-highlight",
        refreshPosition: true,
        
		start: function( event, ui ){
			//칸반 번호 이동 전
			//이동 전 칸반번호
			oldkbnoA = parseInt($(this).attr('value'));
			
			//칸반 카드 번호
        	kbcardnoA = parseInt(ui.item.attr('value'));
			
			//이동 전 칸반 카드 인덱스 번호
			positionA= ui.item.index()+1;
			
			console.log(typeof(oldkbnoA));
			console.log(typeof(kbcardnoA));
			console.log(typeof(positionA));
			console.log("카드번호 : " + kbcardnoA);
			console.log("이동 전 칸반번호 : " + oldkbnoA);
			console.log("이동 전 인덱스 : "+positionA);
			console.log("--------------------------------------");
		
		},
		
        update: function( event, ui ) {
        	//칸반 번호 이동 후
			//이동 후 칸반 번호
			newkbnoB = parseInt($(this).attr('value'));
			
			//칸반 카드 번호
			kbcardnoB = parseInt(ui.item.attr('value'));

			//이동 후 칸반 카드 인덱스 번호
        	positionB = ui.item.index()+1;

			if (this === ui.item.parent()[0]) {
				console.log(typeof(newkbnoB));
				console.log(typeof(kbcardnoB));
				console.log("카드번호 : " + kbcardnoB);
				console.log("이동 후 칸반번호 : " + newkbnoB);
				console.log("이동 후 인덱스 : "+positionB);
				console.log("--------------------------------------");
				
					console.log("positionA : "+positionA);
					console.log("positionB : "+positionB);
					console.log("newkbnoB : "+newkbnoB);
					
					
					//같은 칸반내에서 1->4로 이동 update 
					if(kbcardnoA === kbcardnoB && positionA < positionB) {
					
				        $.ajax({
							url : '/project/kanbanCard/update2',
							data : {positionA : positionA,
									positionB : positionB,
									kbNo : newkbnoB },
							type : 'post',
							success : function(res){
								console.log("칸반 카드 이동 성공 1 -> 4 ");
							},
							error : function(xhr){
								//alert("상태 : " + xhr.status);
							},
							dataType : 'text'
						})
						
					} 
					
					if(kbcardnoA === kbcardnoB && positionA > positionB) {
						
						$.ajax({
							url : '/project/kanbanCard/update3',
							data : {positionA : positionA,
									positionB : positionB,
									kbNo : newkbnoB },
							type : 'post',
							success : function(res){
								console.log("칸반 카드 이동 성공 4 -> 1 ");
							},
							error : function(xhr){
								//alert("상태 : " + xhr.status);
							},
							dataType : 'text'
						})
						
					}
				
    		}
        }
    }).disableSelection();
}

// Issuemain에서 Add Task 버튼 클릭했을때 열리는 모달....
// kanban에서 Add Task 버튼 클릭했을때 열리는 모달...

function addTask() {
    $('.addTask').on('click', function(event) {
        event.preventDefault();
        getParentElement = $(this).parents('[data-connect="sorting"]').attr('data-section');
        $('.edit-task-title').hide();
        $('.add-task-title').show();
        $('[data-btnfn="addTask"]').show();
        $('[data-btnfn="editTask"]').hide();
        $('.addTaskAccordion .collapse').collapse('hide');
        $('#addTaskModal').modal('show');
        $_taskAdd(getParentElement);
    });
}

// Get the range count value

$('#progress-range-counter').on('input', function(event) {
    event.preventDefault();
    /* Act on the event */
    getRangeValue = $(this).val();
    $('.range-count-number').html(getRangeValue);
    $('.range-count-number').attr('data-rangeCountNumber', getRangeValue);
});

// Reset the input Values

$('#addTaskModal, #addListModal').on('hidden.bs.modal', function (e) {
    $('input,textarea').val('');
    $('input[type="range"]').val(0);
    $('.range-count-number').attr('data-rangecountnumber', 0);
    $('.range-count-number').html(0);
})

// change the modal Button class on accordion open 

$('.addTaskAccordion .collapse').on('shown.bs.collapse', function () {

    getClassOfAccordion = $(this).parents('.card').attr('class').split(' ')[1];
    getClassOfAddTaskBtn = $(this).parents('.modal-content').find('[data-btnfn="addTask "]').attr('class').split(' ')[1];
    removeClassOfAddTaskBtn = $(this).parents('.modal-content').find('[data-btnfn="addTask"]').removeClass(getClassOfAddTaskBtn);
    var addClassInAddTaskBtn;

    if (getClassOfAccordion === 'task-simple') {
        addClassInAddTaskBtn = $(this).parents('.modal-content').find('[data-btnfn="addTask"]').addClass('task-simple');
    }
    if (getClassOfAccordion === 'task-text-progress') {
        addClassInAddTaskBtn = $(this).parents('.modal-content').find('[data-btnfn="addTask"]').addClass('task-text-progress');
    } else if (getClassOfAccordion === 'task-checkbox') {
        addClassInAddTaskBtn = $(this).parents('.modal-content').find('[data-btnfn="addTask"]').addClass('task-checkbox');
    } else if (getClassOfAccordion === 'task-image') {
        addClassInAddTaskBtn = $(this).parents('.modal-content').find('[data-btnfn="addTask"]').addClass('task-image');
    }
})

//칸반 카드 생성
function $_taskAdd( getParent ) {

    $('[data-btnfn="addTask"]').off('click').on('click', function(event) {
		
		
		
        getAddBtnClass = $(this).attr('class').split(' ')[1];
        
          var today = new Date();
          var dd = String(today.getDate()).padStart(2, '0');
          var mm = String(today.getMonth()); //January is 0!
          var yyyy = today.getFullYear();

/*
            var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];

            today = dd + ' ' + monthNames[mm] + ', ' + yyyy;
*/
        	var $_getParent = getParent;
        	
        	
            var $_task = document.getElementById('s-task').value;
            var $_taskText = document.getElementById('s-text').value;
            
            var $_taskProgress = $('.range-count-number').attr('data-rangeCountNumber');
            
            var startDateEndDate2 = document.getElementById('rangeCalendarFlatpickr').value.trim().split("~");
            var startDateEndDate = document.getElementById('rangeCalendarFlatpickr').value;
            

			var one = startDateEndDate2.length;
			var two = startDateEndDate2[0]; 
			var three = startDateEndDate2[1].trim(); 
            
            if(three==null){
            	three = 0;
            }
            
            console.log("_getParent : " + $_getParent);  
            
           
            var kbNum = $("[data-section='"+$_getParent+"'] .connect-sorting-content").parent().parent().children().attr('value');
            
            console.log("칸반번호 kbNum PK -> " + kbNum);
            console.log("제목 kbCardTtl : " + $_task);
            console.log("내용 kbCardCn : " + $_taskText);
            console.log("시작날짜 kbCardStrtDt : " + two);
            console.log("끝날짜 kbCardEndDt : " + three);
            console.log("진척도 kbPrgrs : " + $_taskProgress);
            
        $('#addTaskModal').modal('hide');

		//칸반 카드 등록
		$.ajax({
			url : '/project/kanbanCard/insert',
			data : {'kbNo' : kbNum ,
					'kbCardTtl' : $_task, 
					'kbCardCn' : $_taskText, 
					'kbCardStrtDt' : two, 
					'kbCardEndDt' : three, 
					'kbPrgrs' : $_taskProgress },
			type : 'post',
			success : function(res){
				//alert("칸반 카드 등록 성공");
				window.location.reload();
			},
			error : function(xhr){
				//alert("상태 : " + xhr.status);
			},
			dataType : 'text'
		})
		//칸반 카드 등록 끝
		

        $_taskEdit();
        $_taskDelete();
    });
}//칸반카드생성끝
    
$("#add-list").off('click').on('click', function(event) {
  event.preventDefault();

    $('.add-list').show();
    $('.edit-list').hide();
    $('.edit-list-title').hide();
    $('.add-list-title').show();
    $('#addListModal').modal('show');
});

				



    
    
//칸반 이름 변경    
function $_editList(kbNo) {
    $('.list-edit').off('click').on('click', function(event) {

    var $_outerThis = $(this);
	
	var kbNo = $(this).prev().attr('value');
	console.log("nono -> "+kbNo);
   
    $('.add-list').hide();
    $('.edit-list').show();

    $('.add-list-title').hide();
    $('.edit-list-title').show();

    var $_listTitle = $_outerThis.parents('[data-connect="sorting"]').find('.s-heading').attr('data-listTitle');
    $('#s-list-name').val($_listTitle);

    $('.edit-list').off('click').on('click', function(event) {
        var $_innerThis = $(this);
        var $_getListTitle = document.getElementById('s-list-name').value;

        var $_editedListTitleDataAttr = $_outerThis.parents('[data-connect="sorting"]').find('.s-heading').attr('data-listTitle', $_getListTitle);

		//alert("바꿀이름 " + $_getListTitle);
		
		////////////////////////
		//칸반 수정 alert
		  const swalWithBootstrapButtons = swal.mixin({
		    confirmButtonClass: 'btn btn-success',
		    cancelButtonClass: 'btn btn-danger mr-3',
		    buttonsStyling: false,
		  }) //
		
		  swalWithBootstrapButtons({
		    title: '수정하시겠습니까?',
		    //text: "You won't be able to revert this!",
		    type: 'warning',
		    showCancelButton: true,
		    confirmButtonText: '수정하기',
		    cancelButtonText: '취소하기',
		    reverseButtons: true,
		    padding: '2em'
		  }).then(function(result) {
		    if (result.value) {
		      swalWithBootstrapButtons(
		        '수정되었습니다.',
		        //'Your file has been deleted.',
		        ''
		      ).then(function(result){
			  		if(result){
				  		window.location.reload();
			  		}
		  		})
		      
			    //칸반 update 
		        $.ajax({
					url : '/project/kanban/update',
					data : {'kbNo' : kbNo, 'kbNm': $_getListTitle},
					type : 'post',
					success : function(res){
						//alert("칸반 이름 변경 성공");
					},
					error : function(xhr){
						//alert("상태 : " + xhr.status);
					}
				})
		      	
		    } else if (
		      // Read more about handling dismissals
		      result.dismiss === swal.DismissReason.cancel
		      
		      ) { swalWithBootstrapButtons(
		        	'취소되었습니다.',
		       	 	//'Your imaginary file is safe :)',
		       	 	''
		      	  ).then(function(result){
			  			if(result){
				  			window.location.reload();
			  			}
		  	  		})
		    	}
		    
		  	})///////////////////////////
		
        $('#addListModal').modal('hide');
        $('#s-list-name').val('');
    })
    $('#addListModal').modal('show');
    $('#addListModal').on('hidden.bs.modal', function (e) {
        $('#s-list-name').val('');
    })
})
}
    
// 칸반에 카드만 전체삭제
function $_clearList() {
    $('.list-clear-all').off('click').on('click', function(event) {
	
		var kbNo = $(this).parents().children().attr('value');
    		//alert("칸반번호-> " +kbNo);

        event.preventDefault();

		const swalWithBootstrapButtons = swal.mixin({
	    confirmButtonClass: 'btn btn-success',
	    cancelButtonClass: 'btn btn-danger mr-3',
	    buttonsStyling: false,
	  })

	  	swalWithBootstrapButtons({
	    title: '삭제하시겠습니까?',
	    //text: "You won't be able to revert this!",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonText: '삭제하기',
	    cancelButtonText: '취소하기',
	    reverseButtons: true,
	    padding: '2em'
	  }).then(function(result) {
	    if (result.value) {
	      swalWithBootstrapButtons(
	        '삭제되었습니다.',
	        //'Your file has been deleted.',
	        ''
	      ).then(function(result){
		  	if(result){
			  	window.location.reload();
		  	}
	  		})
	      
			var list = document.getElementById("cardT"+kbNo);
			console.log("fffff-> "+list);
				
				$.ajax({
					url : '/project/kanbanNo/delete',
					type : 'post',
					data : {'kbNo' : kbNo},
					success : function(res){
						
					}
				})
						
	    } else if (
	      // Read more about handling dismissals
	      result.dismiss === swal.DismissReason.cancel
	      
	    ) {
	      swalWithBootstrapButtons(
	        '취소되었습니다.',
	        //'Your imaginary file is safe :)',
	        ''
	      ).then(function(result){
		  	if(result){
			  	window.location.reload();
		  	}
	  		})
	    }
	    
	  })
        
    })
}

// 칸반 카드 1개 삭제 
function $_taskDelete() {
    $('.card .s-task-delete').off('click').on('click', function(event) {
        event.preventDefault();

        get_card_parent = $(this).parents('.card');
        var kbCardNo = $(this).parents('.card').attr('value');
		
		console.log("kbval뭐냐 ->" + kbCardNo);
		
		///////////////////////////////////
		const swalWithBootstrapButtons = swal.mixin({
	    confirmButtonClass: 'btn btn-success',
	    cancelButtonClass: 'btn btn-danger mr-3',
	    buttonsStyling: false,
	  })
	
	  swalWithBootstrapButtons({
	    title: '삭제하시겠습니까?',
	    //text: "You won't be able to revert this!",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonText: '삭제하기',
	    cancelButtonText: '취소하기',
	    reverseButtons: true,
	    padding: '2em'
	  }).then(function(result) {
	    if (result.value) {
	      swalWithBootstrapButtons(
	        '삭제되었습니다.',
	        //'Your file has been deleted.',
	        ''
	      ).then(function(result){
		  	if(result){
			  	window.location.reload(); 
		  	}
	  		})
	      
		    $.ajax({
		
			url : '/project/kanbanCard/delete',
			type : 'post',
			data : {'kbCardNo' : kbCardNo},
			success : function(res){
			}
			})
	      	
	    } else if (
	      // Read more about handling dismissals
	      result.dismiss === swal.DismissReason.cancel
	      
	    ) {
	      swalWithBootstrapButtons(
	        '취소되었습니다.',
	        //'Your imaginary file is safe :)',
	        ''
	      ).then(function(result){
		  	if(result){
			  	window.location.reload();
		  	}
	  		})
	    }
	    
	  })
		///////////////////////////////////
    })
}

//칸반 카드 수정
function $_taskEdit() {
  $('.card .s-task-edit').off('click').on('click', function(event) {

    event.preventDefault();

    var $_outerThis = $(this);
   
    $('.add-task-title').hide();
    $('.edit-task-title').show();

    $('[data-btnfn="addTask"]').hide();
    $('[data-btnfn="editTask"]').show();


		//칸반카드넘버
		var $_taskNo = $_outerThis.parents('.ui-sortable-handle').attr('value');
		
		//제목
        var $_taskTitle = $_outerThis.parents('.card').find('h4').attr('data-taskTitle');
		
        var get_value_title = $('#s-task').val($_taskTitle);
		
		//내용
        var $_taskText = $_outerThis.parents('.card').find('p:not(".progress-count")').attr('data-taskText');
		
        var get_value_text = $('#s-text').val($_taskText);

		//진척도
        var $_taskProgress = $_outerThis.parents('.card').find('div.progress-bar').attr('data-progressState');

		//날짜
		var $_taskDate = $_outerThis.parents('.card').find('span').attr('data-taskdate');
		
		var get_value_date = $('#rangeCalendarFlatpickr').val($_taskDate);

        var get_value_progress = $('#progress-range-counter').val($_taskProgress);
        var get_value_progressHtml = $('.range-count-number').html($_taskProgress);
        var get_value_progressDataAttr = $('.range-count-number').attr('data-rangecountnumber', $_taskProgress);

        $('.task-text-progress .collapse').collapse('show');


    $('[data-btnfn="editTask"]').off('click').on('click', function(event) {
        var $_innerThis = $(this);

		//제목
        var $_taskValue = document.getElementById('s-task').value;
		//alert("$_taskValue"+$_taskValue);
		
		//내용
        var $_taskTextValue = document.getElementById('s-text').value;
		//alert("$_taskTextValue"+$_taskTextValue);
		
		//진척도
        var $_taskProgressValue = $('.range-count-number').attr('data-rangeCountNumber');
		//alert("$_taskProgressValue"+$_taskProgressValue);
		
		//날짜
        var startDateEndDateValue = document.getElementById('rangeCalendarFlatpickr').value;
		//alert("startDateEndDateValue "+startDateEndDateValue);

        var startDateEndDate2Value = document.getElementById('rangeCalendarFlatpickr').value.trim().split("~");
		//alert("startDateEndDate2Value "+startDateEndDate2Value);
		
		var one = startDateEndDate2Value.length;
		//alert("one : " + one);
		
		var two = startDateEndDate2Value[0]; 
		//alert("two"+two);
		
		var three = startDateEndDate2Value[1]; 
		//alert("three"+three);
		
        
        if(three==null){
        	three = 0;
        }
        
        console.log("칸반카드번호 $_taskNo -> " + $_taskNo);
        console.log("제목 kbCardTtl : " + $_taskValue);
        console.log("내용 kbCardCn : " + $_taskTextValue);
        console.log("시작날짜 kbCardStrtDt : " + two);
        console.log("끝날짜 kbCardEndDt : " + three);
        console.log("진척도 kbPrgrs : " + $_taskProgressValue);

		////////////////////////
		//칸반 수정 alert
		  const swalWithBootstrapButtons = swal.mixin({
		    confirmButtonClass: 'btn btn-success',
		    cancelButtonClass: 'btn btn-danger mr-3',
		    buttonsStyling: false,
		  }) //
		
		  swalWithBootstrapButtons({
		    title: '수정하시겠습니까?',
		    //text: "You won't be able to revert this!",
		    type: 'warning',
		    showCancelButton: true,
		    confirmButtonText: '수정하기',
		    cancelButtonText: '취소하기',
		    reverseButtons: true,
		    padding: '2em'
		  }).then(function(result) {
		    if (result.value) {
		      swalWithBootstrapButtons(
		        '수정되었습니다.',
		        //'Your file has been deleted.',
		        ''
		      ).then(function(result){
			  		if(result){
				  		window.location.reload();
			  		}
		  		})
		      
			    //칸반 update 
		        $.ajax({
					url : '/project/kanbanCard/update',
					data : {'kbCardTtl' : $_taskValue, 
							'kbCardCn' : $_taskTextValue,  
							'kbCardStrtDt' : two , 
							'kbCardEndDt' : three, 
							'kbPrgrs' : $_taskProgressValue, 
							'kbCardNo':$_taskNo },
					type : 'post',
					success : function(res){
						//alert("칸반 카드 수정 성공");
					},
					error : function(xhr){
						//alert("상태 : " + xhr.status);
					}
				})
		      	
		    } else if (
		      // Read more about handling dismissals
		      result.dismiss === swal.DismissReason.cancel
		      
		      ) { swalWithBootstrapButtons(
		        	'취소되었습니다.',
		       	 	//'Your imaginary file is safe :)',
		       	 	''
		      	  ).then(function(result){
			  			if(result){
				  			window.location.reload();
			  			}
		  	  		})
		    	}
		    
		  	})///////////////////////////

        $('#addTaskModal').modal('hide');
    })
    $('#addTaskModal').modal('show');
  })
}

$_editList();
//$_deleteList();
$_clearList();
addTask();
$_taskEdit();
$_taskDelete();
$_taskSortable();

