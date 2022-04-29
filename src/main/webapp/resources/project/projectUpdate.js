function keyword_making(e) {
    var keyword = document.querySelector('#keywordName');
    console.log(keyword.value);
    str = '<span class="badge badge-pills outline-badge-primary" style="margin-left:10px;">' + keyword.value + '</span>'
    $('#keywordZone').append(str);
    $('#keywordModal').modal('hide');

}


function keywordShow(e) {
    console.log(e.checked);
    var keywordDiv = document.querySelectorAll('.key');
    if (e.checked) {

        console.log(keywordDiv);
        $(keywordDiv[0]).css('display', 'block');
        $(keywordDiv[1]).css('display', 'block');
    } else {
        $(keywordDiv[0]).css('display', 'none');
        $(keywordDiv[1]).css('display', 'none');
    }
}


function colorSet(e) {
    //alert("hello");
    console.log(e);
    console.log("text: ", document.getElementById('markerName').value);
    markerName = document.getElementById('markerName').value;

    //console.log("colorView:",document.querySelectorAll('#colorView'));

    /* 	var colorView = document.getElementById('colorView');
        var text = document.getElementById('markerName').value;
        colorView.innerHTML=text; */

    document.querySelectorAll('#colorView')[0].style.background = e.id;
    document.querySelectorAll('#colorView')[1].style.background = e.id;
    selectColor = e.id;
}

function fn_naming(e) {
    console.log(e.value);
    var colorView = document.querySelectorAll('#colorView');
    colorView[0].innerHTML = e.value;
    colorView[1].innerHTML = e.value;
}

function fn_mkFin(fade) {
    //alert("hello");

    var colorView = document.querySelectorAll('#colorView');
    var markerZone = document.getElementById('markerZone');

    //console.log("colorView:",colorView[1]);
    marker = "<div id='marker' onclick='addMotion(this)' align='center' style='width:auto; padding-left:10px; padding-right:10px; height: 45px; border-radius: 2em; background:" + selectColor + "';>" + markerName + "<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='red' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-minus-circle' display='none' onclick='fn_remove(this)'><circle cx='12' cy='12' r='10'></circle><line x1='8' y1='12' x2='16' y2='12'></line></svg></div>";
    markerZone.innerHTML += marker;

    var markArray = document.querySelectorAll('#marker');
    markArray[markArray.length - 1].append(icon.cloneNode(true));

    for (var i = 0; i < colorView.length; i++) {
        colorView[i].innerHTML = "";
        colorView[i].style.background = '';
    }

    //$('#tabsModal').modal('hide');
    $('#markerName').val('');
}

function addMotion(e) {
    //console.log("className:",e.className);
    var img = $(e).children('svg:eq(0)');
    console.log(img);

    if (e.className.length == 0) {
        e.className = "motion";
        img.css('display', 'block');
    } else {
        e.className = "";
        img.css('display', 'none');
    }
}

function badgeMotion(e) {
    //console.log("className:",e.className);
    var img = $(e).children('svg:eq(0)');
    console.log(img);

    if (e.id.length == 0) {
        e.id = "motion";
        img.css('display', 'block');
    } else {
        e.id = "";
        img.css('display', 'none');
    }
}
function fn_remove(e) {
    //console.log($(e).parent());
    $(e).parent().remove();
    //marker="";
}

function iconInsert(e) {
    var colorView = document.querySelectorAll('#colorView');
    //console.log("first: ", colorView[1]);
    //console.log("e:",e);
    //console.log("cloneNode:",e.cloneNode(true));

    icon = e;
    console.log('icon', icon);

    // var copyIcon = e.cloneNode(true);
    // copyIcon.currentScale = 0.1; 
    //console.log("iconWidth:",copyIcon);
    //console.log("iconSize:",copyIcon.width.animVal.valueAsString); 

    for (var i = 0; i < colorView.length; i++) {
        if (colorView[i].children.length > 0) {
            colorView[i].removeChild(colorView[i].children[0]);
        }
        colorView[i].append(e.cloneNode(true));

    }

}

$.ajax({
    url: "/project/getLang.do",
    type: "post",
    async: false,
    data:{
		pjtNo:pjtNo
			},
    success: function (result) {

        for (var i = 0; i < result.length; i++) {
            logoArr.push(result[i]);
        }

        $.ajax({
            url: "/project/getLogo.do",
            type: "post",
            dataType: "json",
            success: function (res) {
                console.log('res :', res);
                var str = "";
                $.each(res, function (i, v) {
	                var flag=false;
	                for (var k = 0; k < result.length; k++) {
	                     if (result[k] == v.dvlLng){
	                     	flag=!flag;
	                     }
	                }
                    str += '<li class="list-group-item list-group-item-action">'
                    str += '<div class="media">'
                    str += '<div class="mr-3">'
                    str += '<img alt="' + v.dvlLng
                    if (v.dvlLng == ("Delphi/Object Pascal")) {
                        str += '" src="/resources/logoImage/Delphi%20Object%20Pascal'
                    } else if (v.dvlLng == ("C#")) {
                        str += '" src="/resources/logoImage/C%23'
                    }
                    else {
                        str += '" src="/resources/logoImage/' + v.dvlLng
                    }
                    str += '.png" style="height:50px;">'
                    str += '</div>'
                    str += '<div class="media-body">'
                    str += '<h6 class="tx-inverse">' + v.dvlLng + '</h6>'
                    str += '</div>'
                    if(flag){
                        str += '<a style="cursor:pointer;" data-toggle="" onclick="fn_logoPlus(this)">';
                        str += '<svg style="margin-top:15px;" xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>';
                    	
                     }else{    
                   		str += '<a style="cursor:pointer;" data-toggle="true" onclick="fn_logoPlus(this)">';
                    	str += '<svg id="logoBtn" xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>';
                    }	
                    str += '</a></div>'
                    str += '</li>'
                })
                $("#logoList").html(str);
            }
        })
        fn_logoFin();
    }
})


//로고 추가 시 버튼 모양 바뀌기
function fn_logoPlus(e) {
    var btnDiv = e;
    var icon = '<svg style="margin-top:15px;" xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>';
    var plusIcon = '<svg id="logoBtn" xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>';

    if (!$(btnDiv).data("toggle")) {
        $(btnDiv).html(plusIcon);
        $(btnDiv).data("toggle", "true");
    } else {
        $(btnDiv).html(icon);
        $(btnDiv).data("toggle", "");
    }

    console.log($(e).prev()[0].innerText);
    var langName = $(e).prev()[0].innerText;
    fn_logoArr(langName);
}

function fn_logoArr(langName) {
    for (i = 0; i < logoArr.length; i++) {
        if (logoArr[i] == langName) {
            logoArr.splice(i, 1);
            return;
        }
    }
    logoArr.push(langName);
}
function fn_logoFin() {
    console.log(logoArr);
    var str = "";
    for (var i = 0; i < logoArr.length; i++) {
        str += '<span onclick="badgeMotion(this)" id="" class="badge badge-pills outline-badge-primary" style="margin-left:10px; cursor:pointer;">' + logoArr[i] + '<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="red" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle" display="none" onclick="fn_remove(this)"><circle cx="12" cy="12" r="10"></circle><line x1="8" y1="12" x2="16" y2="12"></line></svg></span>'
    }


    $('#langZone').html(str);
}


function fn_membering() {
    var idArr = [];
    var nameArr = [];

    var memList = document.querySelectorAll('.memList');
    for (var i = 0; i < memList.length; i++) {
        var name = memList[i].innerText;
        console.log("getID:", memList[i].children[0].value);

        nameArr.push(name);
        idArr.push(memList[i].children[0].value);
    }

    //console.log(document.getElementById('mbrCollect'));

    $('#exampleModalCenter').modal('hide');

    for (var i = 0; i < memList.length; i++) {
        document.getElementsByClassName('mbrCollect')[0].removeChild(memList[i]);
    }
    //console.log(nameArr);
    $.ajax({
        url: "/project/getInfo.do",
        data: { nameArr: JSON.stringify(idArr) },
        type: "post",
        success: function (res) {
            console.log("res: ", res);
            var str = ""
            $.each(res, function (i, v) {

                str += "<tr>";
                str += "<td id='td_name'>" + nameArr[i] + "<input type='hidden' name='mbrId' value='" + idArr[i] + "'></td>";
                str += "<td>" + v + "</td>";
                str += '<td id="thirdTd"><div class="btn-group mb-4 mr-2"><button class="btn btn-dark btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">역할 <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></button><div class="dropdown-menu" style="will-change: transform;"><a href="javascript:void(0);" class="dropdown-item">Project Leader</a><a href="javascript:void(0);" class="dropdown-item">Application Architect</a><a href="javascript:void(0);" class="dropdown-item">Technical Architect</a><a href="javascript:void(0);" class="dropdown-item">Data Architect</a><a href="javascript:void(0);" class="dropdown-item">Business Architect</a><a href="javascript:void(0);" class="dropdown-item">Quality Assurance</a></div></div></td>';
                str += "<td><svg onclick='memDel(this)' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash-2 icon'><polyline points='3 6 5 6 21 6'></polyline><path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path><line x1='10' y1='11' x2='10' y2='17'></line><line x1='14' y1='11' x2='14' y2='17'></line></svg></td>";
                str += "</tr>";

            })
            $("#tb_body").append(str);
        }
    })

}

$(document).on("click", ".dropdown-item", function () {
    //console.log($(this)[0].innerHTML);
    console.log($(this).parents('#thirdTd')[0]);
    var clearRole = $(this).parents('#thirdTd')[0];

    var roleBadge = "<div id='roleContent'><span class='badge badge-pills outline-badge-primary'>" + $(this)[0].innerHTML + "</span><div class='icon-container' id='reRole'><svg onclick='reSelect(this)' xmlns='http://www.w3.org/2000/svg' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-edit-2'><path d='M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z'></path></svg></div></div>";

    clearRole.innerHTML = " ";
    clearRole.innerHTML = roleBadge;

})

function reSelect(e) {
    console.log($(e).parents('#thirdTd')[0]);
    var clearRole = $(e).parents('#thirdTd')[0];
    var dropDown = '<td id="thirdTd"><div class="btn-group mb-4 mr-2"><button class="btn btn-dark btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">역할<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></button><div class="dropdown-menu" style="will-change: transform; overflow: auto"><a href="javascript:void(0);" class="dropdown-item">Project Leader</a><a href="javascript:void(0);" class="dropdown-item">Application Architect</a><a href="javascript:void(0);" class="dropdown-item">Technical Architect</a><a href="javascript:void(0);" class="dropdown-item">Data Architect</a><a href="javascript:void(0);" class="dropdown-item">Business Architect</a><a href="javascript:void(0);" class="dropdown-item">Quality Assurance</a></div></div></td>';

    clearRole.innerHTML = " ";
    clearRole.innerHTML = dropDown;

}

function memDel(e) {
    console.log($(e).parents('#tb_body')[0].childElementCount);
    /* if($(e).parents('#tb_body')[0].childElementCount==1){
        $('#memberTable').css('display','none');
    } */
    console.log($(e).parents('tr')[0]);

    var tr = $(e).parents('tr')[0];
    tr.remove();

}

function allFin() {
    var pjtName = document.querySelector('#pjtName').value;
    var pjtLayout = document.querySelector('#pjtLayout').value;
    var pjtExplain = document.querySelector('#pjtExplain').value;
    var rangeCalendarFlatpickr = document.querySelector('#rangeCalendarFlatpickr').value;
    var pjtRcrtStts = "";
    var pjtr = document.querySelector('#pjtRcrtStts');

    if (pjtr.checked) {
        pjtRcrtStts = pjtr.value;
    } else {
        pjtRcrtStts = 'N';
    }

    var ck_modules = [];
    var modules = document.querySelectorAll('#lytNo');
    console.log(modules.length);

    for (var i = 0; i < modules.length; i++) {
        if (modules[i].checked) {
            ck_modules.push(modules[i].value);
        }
    }


    var allId = document.querySelectorAll('#td_name');
    var allRole = document.querySelectorAll('#roleContent');
    for (var i = 0; i < allId.length; i++) {
        //console.log('memId ',allId[i].children[0].value);
        idArr.push(allId[i].children[0].value);
        //console.log('allRole',allRole[i].children[0].innerText);
        roleArr.push(allRole[i].children[0].innerText);
    }

    var langZone = document.querySelector('#langZone');
    //console.log(langZone.children[0].innerText);
    for (var i = 0; i < langZone.childElementCount; i++) {
        langArr.push(langZone.children[i].innerText);
    }


    var keywordZone = document.querySelector('#keywordZone');
    for (var i = 0; i < keywordZone.childElementCount; i++) {
        keywordArr.push(keywordZone.children[i].innerText);
    }

    var markers = document.querySelectorAll('#marker');
    if (markers.length > 0) {
        console.log('markerName: ', markers[0].innerText);
        console.log('markerColor: ', $(markers[0]).css('background').split(")")[0] + ")");
        console.log('markerIcon: ', $(markers[0].children[1]).html());

        for (var i = 0; i < markers.length; i++) {
            mkNameArr.push(markers[i].innerText);
            mkColorArr.push($(markers[i]).css('background').split(")")[0] + ")");
            mkIconArr.push($(markers[i].children[1]).html());
        }
    }

    console.log("pjtNm:", pjtName);
    console.log("pjtOl:", pjtLayout);
    console.log("pjtExpl:", pjtExplain);
    console.log("pjtStrtYmd:", rangeCalendarFlatpickr);
    console.log("idArr:", JSON.stringify(idArr));
    console.log("langArr:", JSON.stringify(langArr));
    console.log("keywordArr:", JSON.stringify(keywordArr));
    console.log("mkNameArr:", JSON.stringify(mkNameArr));
    console.log("mkColorArr:",JSON.stringify(mkColorArr));
    console.log("mkIconArr:", JSON.stringify(mkIconArr));
    console.log("roleArr:", JSON.stringify(roleArr));

     $.ajax({
      url:"/project/allUpdate.do",
      data:{
          pjtNm:pjtName,
          pjtOl:pjtLayout,
          pjtExpl:pjtExplain,
          pjtStrtYmd:rangeCalendarFlatpickr,
          idArr:JSON.stringify(idArr),
          langArr:JSON.stringify(langArr),
          keywordArr:JSON.stringify(keywordArr),
          mkNameArr:JSON.stringify(mkNameArr),
          mkColorArr:JSON.stringify(mkColorArr),
          mkIconArr:JSON.stringify(mkIconArr),
          roleArr:JSON.stringify(roleArr)
      },
      type:"post",
      success:function(res){
          location.href="/project/main.do?pjtNo="+res;
      }
  })  

}

