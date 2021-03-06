$(document).ready(function() {

  	    var filterKey=window.location.search;
    	console.log("filterKey: " ,filterKey.split("=")[1]);
    	filterKey = filterKey.split("=")[1];
    	
    	var checkArr=[];
    	checkArr=document.querySelectorAll('input[type=checkbox]');
    	//console.log(checkArr); 
    	for(var i=0; i<checkArr.length;i++){
    		if(checkArr[i].defaultValue==filterKey){
    			console.log(checkArr[i]);
    			checkArr[i].checked = true;    			
    		}
    		
    	}

	v_len = $("input:checkbox[name=filter]:checked").length;
	console.log("len",v_len);
	
	var v_data=[];
	v_filter = $("input:checkbox[name=filter]:checked").val();
	//console.log('v_filter : ',v_filter);
	
	//필터가 없을 때
	if(v_len==0) nonFilter();
	
	//필터 체크가 있을 때
	if(v_len>0) {
  		v_filter = $("input:checkbox[name=filter]:checked").val();
		onFilter(v_filter);
	
    }

    // Get the modal
    var modal = document.getElementById("addEventsModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the Add Event button
    var addEvent = document.getElementById("add-e");
    // Get the Edit Event button
    var editEvent = document.getElementById("edit-event");
    // Get the Discard Modal button
    var discardModal = document.querySelectorAll("[data-dismiss='modal']")[0];
    
    var delBtn = document.getElementById("delBtn");
    
    // Get the Add Event button
    var addEventTitle = document.getElementsByClassName("add-event-title")[0];
    // Get the Edit Event button
    var editEventTitle = document.getElementsByClassName("edit-event-title")[0];

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // Get the all <input> elements insdie the modal
    var input = document.querySelectorAll('input[type="text"]');
    var radioInput = document.querySelectorAll('input[type="radio"]');

    // Get the all <textarea> elements insdie the modal
    var textarea = document.getElementsByTagName('textarea');

    // Create BackDrop ( Overlay ) Element
    function createBackdropElement () {
        var btn = document.createElement("div");
        btn.setAttribute('class', 'modal-backdrop fade show')
        document.body.appendChild(btn);
    }

    // Reset radio buttons

    function clearRadioGroup(GroupName) {
      var ele = document.getElementsByName(GroupName);
        for(var i=0;i<ele.length;i++)
        ele[i].checked = false;
    }

    // Reset Modal Data on when modal gets closed
    function modalResetData() {
        modal.style.display = "none";
        for (i = 0; i < input.length; i++) {
            input[i].value = '';
        }
        for (j = 0; j < textarea.length; j++) {
            textarea[j].value = '';
          i
        }
        clearRadioGroup("marker");
        // Get Modal Backdrop
        var getModalBackdrop = document.getElementsByClassName('modal-backdrop')[0];
        document.body.removeChild(getModalBackdrop)
    }

    // When the user clicks on the button, open the modal
    btn.onclick = function() {
    	delBtn.style.display ="none";
        modal.style.display = "block";
        addEvent.style.display = 'block';
        editEvent.style.display = 'none';
        addEventTitle.style.display = 'block';
        editEventTitle.style.display = 'none';
        document.getElementsByTagName('body')[0].style.overflow = 'hidden';
        createBackdropElement();
        enableDatePicker();
    }

    // Clear Data and close the modal when the user clicks on Discard button
    discardModal.onclick = function() {
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
    }

    // Clear Data and close the modal when the user clicks on <span> (x).
    span.onclick = function() {
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
    }

    // Clear Data and close the modal when the user clicks anywhere outside of the modal.
    window.onclick = function(event) {
        if (event.target == modal) {
            modalResetData();
            document.getElementsByTagName('body')[0].removeAttribute('style');
        }
    }

    newDate = new Date()
    monthArray = [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ]

    function getDynamicMonth( monthOrder ) {
        var getNumericMonth = parseInt(monthArray[newDate.getMonth()]);
        var getNumericMonthInc = parseInt(monthArray[newDate.getMonth()]) + 1;
        var getNumericMonthDec = parseInt(monthArray[newDate.getMonth()]) - 1;

        if (monthOrder === 'default') {

            if (getNumericMonth < 10 ) {
                return '0' + getNumericMonth;
            } else if (getNumericMonth >= 10) {
                return getNumericMonth;
            }

        } else if (monthOrder === 'inc') {

            if (getNumericMonthInc < 10 ) {
                return '0' + getNumericMonthInc;
            } else if (getNumericMonthInc >= 10) {
                return getNumericMonthInc;
            }

        } else if (monthOrder === 'dec') {

            if (getNumericMonthDec < 10 ) {
                return '0' + getNumericMonthDec;
            } else if (getNumericMonthDec >= 10) {
                return getNumericMonthDec;
            }
        }
    }

  
 
    function nonFilter(){
    	v_data=[];
		    $.ajax({
			        url:'/project/calendarAll.do',	        		
			        type:'get',
			        async: false,  // 일단 동기식
					data:{
						pjtNo:pjtNo
					},
			        success : function(data) {				        				        		
			            	console.log(data);
							for(var i=0; i<data.length; i++){
							   var v_each = {};
							   v_each.id = data[i].schdlNo;		
			            	   v_each.title = data[i].schdlTtl;		
			            	   v_each.start = data[i].schdlSrtDt.split(" ")[0] + "T"+data[i].schdlSrtDt.split(" ")[1];		
			            	   v_each.end =  data[i].schdlNdDt.split(" ")[0] + "T"+data[i].schdlNdDt.split(" ")[1];		
			            	   v_each.className = '';
			            	   
			            	   console.log(v_each.start);
			            	   
			            	   //console.log(data[i].schdlCtgrCd);
			            	   
			            	   var v_check = data[i].schdlCtgrCd;
			            	   
			            	   if( v_check == 'C01'){
			            	   		//console.log('hello');
			            	   		v_each.className ='bg-primary';
			            	   }else if(v_check == 'C02'){ 
			            	    	v_each.className ='bg-warning';
			            	   }else if(v_check == 'C03'){ 
			            	   		v_each.className ='bg-danger';
			            	   }
			            	   
			            	   console.log('after: ',v_each.className);
			            	   v_each.description = data[i].schdlCn;
			            	  
			            	   v_data.push(v_each);   
							}
			         },
			        error : function() {
			        	  alert("error");
			        }
			});
	}
	
	function onFilter(val){
		v_data=[];
	 $.ajax({
			        url:'/project/calendarFiltering.do',	        		
			        type:'post',
			        async: false,  // 일단 동기식
			        data : {
						pjtNo:pjtNo,
            			schdlCtgrCd:val           		
            		},
			        success : function(data) {	
			        	console.log("filtering data : ", data);	
			        	console.log("lenlen : ",data.length);		        				        					            	
							for(var i=0; i<data.length; i++){
								console.log("hello");
							   var v_each = {};
							   v_each.id = data[i].schdlNo;		
			            	   v_each.title = data[i].schdlTtl;		
			            	   v_each.start = data[i].schdlSrtDt.split(" ")[0] + "T"+data[i].schdlSrtDt.split(" ")[1];		
			            	   v_each.end =  data[i].schdlNdDt.split(" ")[0] + "T"+data[i].schdlNdDt.split(" ")[1];		
			            	   v_each.className = '';
			            	   
			            	  // console.log(v_each.start);
			            	   
			            	   //console.log(data[i].schdlCtgrCd);
			            	   //console.log("an",data[i].schdlCtgrCd.trim(),"an");
			            	   
			            	   var v_check = data[i].schdlCtgrCd;
			            	   //console.log("ck:",v_check);
			            	   if( v_check == 'C01'){
			            	   		//console.log('hello');
			            	   		v_each.className ='bg-primary';
			            	   }else if(v_check == 'C02'){ 
			            	    	v_each.className ='bg-warning';
			            	   }else if(v_check == 'C03'){ 
			            	   		v_each.className ='bg-danger';
			            	   }else if(v_check =='null'){
			            	   		v_each.className=undefined;
			            	   }
			            	   
			            	   v_each.description = data[i].schdlCn;
			            	  
			            	   v_data.push(v_each);  
			            	   	
							}
			         },
			        error : function() {
			        	  alert("error");
			        }
			});
			
	}
	
	
	
    var calendar = $('#calendar').fullCalendar({
  
        header: {
            left: 'prev,next',
            center: 'title',
            right:''
           
        },
        events:v_data,
        editable: true,
        eventLimit: true,
        eventMouseover: function(event, jsEvent, view) {
            $(this).attr('id', event.id);

            $('#'+event.id).popover({
                template: '<div class="popover popover-primary" role="tooltip"><div class="arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>',
                title: event.title,
                content: event.description,
                placement: 'top',
            });

            $('#'+event.id).popover('show');
        },
        eventMouseout: function(event, jsEvent, view) {
            $('#'+event.id).popover('hide');
        },
        eventClick: function(info) {

            addEvent.style.display = 'none';
            editEvent.style.display = 'block';

			delBtn.style.display='block';
            addEventTitle.style.display = 'none';
            editEventTitle.style.display = 'block';
            modal.style.display = "block";
            document.getElementsByTagName('body')[0].style.overflow = 'hidden';
            createBackdropElement();

            // Calendar Event Featch
            var eventTitle = info.title;
            var eventDescription = info.description;

            // Task Modal Input
            var taskTitle = $('#write-e');
            var taskTitleValue = taskTitle.val(eventTitle);

            var taskDescription = $('#taskdescription');
            var taskDescriptionValue = taskDescription.val(eventDescription);

            var taskInputStarttDate = $("#start-date");
            var taskInputStarttDateValue = taskInputStarttDate.val(info.start.format("YYYY-MM-DD HH:mm:ss"));

            var taskInputEndDate = $("#end-date");
            var taskInputEndtDateValue = taskInputEndDate.val(info.end.format("YYYY-MM-DD HH:mm:ss"));
        
            var startDate = flatpickr(document.getElementById('start-date'), {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                defaultDate: info.start.format("YYYY-MM-DD HH:mm:ss"),
            });

            var abv = startDate.config.onChange.push(function(selectedDates, dateStr, instance) {
            	console.log("dddd");
                var endtDate = flatpickr(document.getElementById('end-date'), {
                    enableTime: true,
                    dateFormat: "Y-m-d H:i",
                    minDate: dateStr
                });
            })

            var endtDate = flatpickr(document.getElementById('end-date'), {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                defaultDate: info.end.format("YYYY-MM-DD HH:mm:ss"),
                minDate: info.start.format("YYYY-MM-DD HH:mm:ss")
            });
            
         
         //삭제 버튼 클릭
            $('#delBtn').off('click').on('click', function(event) {
             	console.log(info.id);
             	
		  const swalWithBootstrapButtons = swal.mixin({
		    confirmButtonClass: 'btn btn-success btn-rounded',
		    cancelButtonClass: 'btn btn-danger btn-rounded mr-3',
		    buttonsStyling: false,
		  })
		  
		  
		  swalWithBootstrapButtons({
		    title: '일정을 삭제하시겠습니까?',
		    text: "삭제한 일정은 복구할 수 없습니다",
		    type: 'warning',
		    showCancelButton: true,
		    confirmButtonText: '삭제',
		    cancelButtonText: '삭제 취소',
		    reverseButtons: true,
		    padding: '2em'
		  }).then(function(result) {
		    if (result.value) {
		    
		      swalWithBootstrapButtons(
		        '삭제 완료',
		        '일정이 삭제되었습니다',
		        'success'
		      )
		      
          		//console.log (info.id);
         		
          		$.ajax({
            		url : "/project/calendarDelete.do",
            		type : 'post',
            		async: false,
            		data : {
            			schdlNo:info.id,
            		},
            		success : function(data) {
            			location.href="/project/calendar.do";		
            	     },
            		error : function() {
            			alert("error");
            		}
            	});
		      
             		
		    } else if (
		      // Read more about handling dismissals
		      result.dismiss === swal.DismissReason.cancel
		    ) {
		      swalWithBootstrapButtons(
		        '삭제 취소',
		        '일정 삭제를 취소하였습니다',
		        'error'
		      )
		    }
		  })	
		  
             });
             
        

            $('#edit-event').off('click').on('click', function(event) {
                event.preventDefault();
                /* Act on the event */
                var radioValue = $("input[name='schdlCtgrCd']:checked").val();

                var taskStartTimeValue = document.getElementById("start-date").value;
                var taskEndTimeValue = document.getElementById("end-date").value;
				
                info.title = taskTitle.val();
                info.description = taskDescription.val();
                info.start = taskStartTimeValue;
                info.end = taskEndTimeValue;
                info.className = radioValue;
                
                if(info.className==undefined){
                	info.className="null";
                }
                            
				console.log("수정 : ",info);
				
				 //db update ajax
               $.ajax({
            		url : "/project/calendarUpdate.do",
            		type : 'post',
            		async: false,
            		data : {
            			schdlNo:info.id,
            			schdlTtl:info.title, 
            			schdlSrtDt:info.start,
            			schdlNdDt:info.end,
            			schdlCn:info.description,
            			color:info.className            		
            		},
            		success : function(data) {
            	     },
            		error : function() {
            			alert("error");
            		}
            	});

                $('#calendar').fullCalendar('updateEvent', info);
                modal.style.display = "none";
                modalResetData();
                document.getElementsByTagName('body')[0].removeAttribute('style');
                
                
            });
        }
    })
    

    function enableDatePicker() {
        var startDate = flatpickr(document.getElementById('start-date'), {
            enableTime: true,
            dateFormat: "Y-m-d H:i",
            minDate: new Date()
        });

        var abv = startDate.config.onChange.push(function(selectedDates, dateStr, instance) {

            var endtDate = flatpickr(document.getElementById('end-date'), {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                minDate: dateStr
            });
        })

        var endtDate = flatpickr(document.getElementById('end-date'), {
            enableTime: true,
            dateFormat: "Y-m-d H:i",
            minDate: new Date()
        });
    }

	console.log("hihi");
    function randomString(length, chars) {
        var result = '';
        for (var i = length; i > 0; --i) result += chars[Math.round(Math.random() * (chars.length - 1))];
        return result;
    }
    $("#add-e").off('click').on('click', function(event) {
        var radioValue = $("input[id='marker']:checked").val();
        var randomAlphaNumeric = randomString(10, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
        var inputValue = $("#write-e").val();
        var inputStarttDate = document.getElementById("start-date").value;
        var inputEndDate = document.getElementById("end-date").value;

        var arrayStartDate = inputStarttDate.split(' ');

        var arrayEndDate = inputEndDate.split(' ');

        var startDate = arrayStartDate[0];
        var startTime = arrayStartDate[1];

        var endDate = arrayEndDate[0];
        var endTime = arrayEndDate[1];

        var concatenateStartDateTime = startDate+'T'+startTime+':00';
        var concatenateEndDateTime = endDate+'T'+endTime+':00';

        var inputDescription = document.getElementById("taskdescription").value;
        var myCalendar = $('#calendar');
        myCalendar.fullCalendar();
        var myEvent = {
          timeZone: 'UTC',
          allDay : false,
          id: randomAlphaNumeric,
          title:inputValue,
          start: concatenateStartDateTime,
          end: concatenateEndDateTime,
          className: radioValue,
          description: inputDescription
        };
        myCalendar.fullCalendar( 'renderEvent', myEvent, true );
        modal.style.display = "none";
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
       
       c_start = concatenateStartDateTime.split("T")[0]+" "+concatenateStartDateTime.split("T")[1];
       console.log(c_start);
       
        //db insert ajax
               $.ajax({
            		url : "/project/calendarInsert.do",
            		type : 'post',
            		data : {
            			schdlTtl:inputValue, 
            			schdlSrtDt:inputStarttDate,
            			schdlNdDt:inputEndDate,
            			schdlCn:inputDescription,
						pjtNo:pjtNo,
            			color:$('input[name="schdlCtgrCd"]:checked').val()
            		},
            		success : function(data) {
            	     },
            		error : function() {
            			alert("error");
            		}
            	}); 
        
        
        
    });


    // Setting dynamic style ( padding ) of the highlited ( current ) date

    function setCurrentDateHighlightStyle() {
        getCurrentDate = $('.fc-content-skeleton .fc-today').attr('data-date');
        if (getCurrentDate === undefined) {
            return;
        }
        splitDate = getCurrentDate.split('-');
        if (splitDate[2] < 10) {
            $('.fc-content-skeleton .fc-today .fc-day-number').css('padding', '3px 8px');
        } else if (splitDate[2] >= 10) {
            $('.fc-content-skeleton .fc-today .fc-day-number').css('padding', '3px 4px');
        }
    }
    setCurrentDateHighlightStyle();

    const mailScroll = new PerfectScrollbar('.fc-scroller', {
        suppressScrollX : true
    });
    
    var fcButtons = document.getElementsByClassName('fc-button');
    for(var i = 0; i < fcButtons.length; i++) {
        fcButtons[i].addEventListener('click', function() {
            const mailScroll = new PerfectScrollbar('.fc-scroller', {
                suppressScrollX : true
            });        
            $('.fc-scroller').animate({ scrollTop: 0 }, 100);
            setCurrentDateHighlightStyle();
        })
    }
});