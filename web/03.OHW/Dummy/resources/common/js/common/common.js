/*********************************************************************
//�⑥닔紐�    : 臾몄옄��.cut(臾몄옄�닿만��)
//�⑥닔�ㅻ챸  : 臾몄옄�댁쓽 諛붿씠�몃� 泥댄겕�섏뿬, �몄옄留뚰겮�� Byte濡� 臾몄옄�� �섎씪�� 由ы꽩
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-02-12
*********************************************************************/
String.prototype.cut = function(len) {
    var str = this;
    var l = 0;
    for (var i=0; i<str.length; i++) {
            l += (str.charCodeAt(i) > 128) ? 2 : 1;
            if (l > len) return str.substring(0,i);
    }
    return str;
}

/*********************************************************************
//�⑥닔紐�    : valueIndex
//�⑥닔�ㅻ챸  : 諛곗뿴�� �몃뜳�� 媛� 援ы븯湲�
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-05-24
*********************************************************************/
Array.prototype.valueIndex = function(pval){
	var idx = -1;
	if(this==null || this==undefined || pval==null || pval==undefined){
	
	}else{
		for(var i=0;i<this.length;i++){
			if(this[i]==pval){
				idx = i;
				break;
			}
		}
	}
	
	return idx
};

/*********************************************************************
//�⑥닔紐�    : getByte
//�⑥닔�ㅻ챸  : 諛붿씠�� 泥댄겕
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-13
*********************************************************************/
function getByte(str){
	var resultSize = 0;
	if(str == null){
		return 0;
	}

	for(var i=0; i<str.length; i++) {
		var c = escape(str.charAt(i));
		if(c.length == 1){//湲곕낯 �꾩뒪�ㅼ퐫��
			resultSize ++;
		}else if(c.indexOf("%u") != -1){//�쒓� �뱀� 湲고�
			resultSize += 2;
		}else{
			resultSize ++;
		}
	}

	return resultSize;
}
popupWins = new Array();
function open_win(url, name, width, height, xpos, ypos){
	name =  name || '_blank';
	xpos = xpos || (screen.availWidth-width)/2;
	ypos = ypos || (screen.availHeight-height)/2;

	if ( typeof( popupWins[name] ) != "object" ){
		popupWins[name] = window.open(url, name, 'width='+width+', height='+height+', left='+xpos+', top='+ypos+', menubar=no, status=no, toolbar=no, scrollbars=no, resizable=yes');
	 } else {
		 if (!popupWins[name].closed){
			popupWins[name].location.href = url;
		 } else {
			popupWins[name] = window.open(url, name, 'width='+width+', height='+height+', left='+xpos+', top='+ypos+', menubar=no, status=no, toolbar=no, scrollbars=no, resizable=yes');
		 }
	 }

	 popupWins[name].focus();
}

function open_win_scroll(url, name, width, height, xpos, ypos){
	name =  name || '_blank';
	xpos = xpos || (screen.availWidth-width)/2;
	ypos = ypos || (screen.availHeight-height)/2;

	if ( typeof( popupWins[name] ) != "object" ){
		popupWins[name] = window.open(url, name, 'width='+width+', height='+height+', left='+xpos+', top='+ypos+', menubar=no, status=no, toolbar=no, scrollbars=yes, resizable=yes');
	 } else {
		 if (!popupWins[name].closed){
			popupWins[name].location.href = url;
		 } else {
			popupWins[name] = window.open(url, name, 'width='+width+', height='+height+', left='+xpos+', top='+ypos+', menubar=no, status=no, toolbar=no, scrollbars=yes, resizable=yes');
		 }
	 }

	 popupWins[name].focus();
}

/*********************************************************************
//�⑥닔紐�    : file_down
//�⑥닔�ㅻ챸  : �뚯씪 �ㅼ슫濡쒕뱶
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2015-12-21
*********************************************************************/
function down_file(file_url){
	var file = file_url.split('.');
	var url = '/mypage/mypage_common/file_download?file='+file[0]+'&extension='+file[1];
	$(location).attr('href',url);
}

/*********************************************************************
//�⑥닔紐�    : checkDevServer
//�⑥닔�ㅻ챸  : �ㅽ겕由쏀듃�⑥뿉�� �쒕쾭 泥댄궧
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2015-12-16
*********************************************************************/
function checkDevServer(){
	var _domain = document.domain;
	var _is_dev = /(dev)/i;
	var _is_qa = /(qa-)/i;
	var _is_dev_domain_search = _domain.search(_is_dev);
	var _is_qa_domain_search = _domain.search(_is_qa);
	var _result = 0;

	if (_is_dev_domain_search > -1){_result = 1;}
	else if (_is_qa_domain_search> -1){_result = 2;}
	else{_result = 3;}

	return _result;
}

/*********************************************************************
//�⑥닔紐�    : commonGetByte
//�⑥닔�ㅻ챸  : 諛붿씠�� 泥댄겕
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-13
*********************************************************************/
function commonGetByte(str){
    var resultSize = 0;
    if(str == null){
        return 0;
    }
혻혻혻혻혻혻혻혻혻
    for(var i=0; i<str.length; i++) {
        var c = escape(str.charAt(i));
        if(c.length == 1){//湲곕낯 �꾩뒪�ㅼ퐫��
            resultSize ++;
        }else if(c.indexOf("%u") != -1){//�쒓� �뱀� 湲고�
            resultSize += 2;
        }else{
            resultSize ++;
        }
    }

    return resultSize;
}


function returnDomain(){
	var _domain =document.domain;
	var _domain_replace = /([a-z\d\-]+(?:\.(?:asia|info|name|mobi|com|net|org|biz|tel|xxx|kr|co|so|me|eu|cc|or|pe|ne|re|tv|jp|tw)){1,2})(?::\d{1,5})?(?:\/[^\?]*)?(?:\?.+)?$/i;
	var _result = _domain.replace(_domain_replace,"");

	_result = _domain.replace(_result,"");

	return _result;
}

//荑좏궎 �곌린
function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays*24*60*60*1000));
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires + ";domain=.gawewang.com;path=/";
	document.cookie = cname + "=" + cvalue + "; " + expires + ";domain=.conects.com;path=/";
}

//荑좏궎 媛��몄삤湲�
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1);
			if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
	}
	return "";
}

/*********************************************************************
//�⑥닔紐�    : readURL
//�⑥닔�ㅻ챸  : �대�吏� �낅줈�� 誘몃━蹂닿린(濡쒖뺄�대�吏� �몄텧)
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-05
*********************************************************************/
function readURL(input) {

	if( !(  /.*\.(gif)|(jpeg)|(jpg)|(png)$/.test( $("#img_url").val().toLowerCase())   ) ) {
		alert('�낅줈�� �� �� �녿뒗 �뚯씪�뺤떇�낅땲��.');
		return;
	}

	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#preview').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	
}





/* gnb.js ��� */
/* �뺣━�� 寃� */

/*********************************************************************
//�⑥닔紐�    : ajax_call_gnb
//�⑥닔�ㅻ챸  : ajax 紐⑤뱢(GNB)
//�몄옄�ㅻ챸
	- sendData : 蹂대궪 �곗씠��
	- url : 蹂대궪 �곗씠��
	- call_type : ajax 肄� �좏삎
	- method : HTTP Method Type
	- dataType : return type
	- etc_param : 湲고� �뚮씪誘명꽣
	- sync : �숆린/鍮꾨룞湲� 泥섎━
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-14
*********************************************************************/
function ajax_call_gnb(sendData, url, call_type, method, dataType, etc_param, async){
	$.ajax({
		type 	 : method,
		url  	 : url,
		data 	 : sendData,
		dataType : dataType,
		async	 : (async == 'Y') ? false : true,
		success  : function(response){
						switch(call_type){
							case 'class_list':
								$("#class_list").html(response);
								
								//寃��됲븳 ���쒓낵紐⑹쓣 移대뱶�� �몄텧�섍린.
								//var sbjt = $("#sbjt option:selected").html();
								var sbjt = $("ul.subbox>li").find('.on').html();
								if(sbjt != '' && sbjt != null){
									$(".sch_sbjt_nm").html(sbjt);
								}
								
								//URL濡� �먮떒 [ �덉쇅泥섎━ ]
								var this_location = $(location).attr('search');
								if(this_location.indexOf('teacher_count') > 0){
									$(location).attr('href', '#wrap_teacher_list');
								}
							
							break;
							
							case 'wang_teacher_list'://[�섏뾽寃곌낵 諛묒뿉 �섏삤�� �쒗꽣 由ъ뒪��, 而ㅻ꽖痢좏뒠�곗씤 �쒗꽣留� �몄텧]
								$("#wang_teacher_list").html(response);
							break;

							case 'student_list':
								$("#student_list").html(response);
							break;
							
							case 'teacher_list': //�쒗꽣 寃���[湲고쉷蹂�寃쎌쑝濡� �쒓굅 - 異뷀썑 �ъ슜 媛��μ꽦 �덉쓬]
								$("#teacher_list").html(response);
							break;
							
							case 'sigungu_list':
								sigungu_list(response);
							break;

							case 'sbjt_list':
								sbjt_list(response);
							break;

							case 'logout':
								if(response.result == 'SUCCESS'){
									$(location).attr('href', '/main/main');
								}
							break;
							
							case 'user_cd_search':

								var search_type = (function(param){
									var getParam = (function(idx){
										var vars={},hash;
										var hashes=window.location.search.slice(window.location.search.indexOf('?')+1).split('&');
										for(var i=0;i<hashes.length;i++){
											if(hashes[i]){
												hash=hashes[i].split('=');
												vars[hash[0]]=hash[1]?hash[1].toString().split('#')[0]:''
											}
										}
										return idx===undefined?vars:(vars[idx]!==undefined?vars[idx]:false)
									})();
									old_search_param = $('#gnb_sch_type').val();
									getParam[param] = old_search_param ? old_search_param : getParam[param];
									switch(getParam[param]){
										case 'teacher':
										case 'student':
											break;
										default:
											getParam[param] = 'teacher';
									}
									return getParam[param]
								})('search_type');

								if(response.search("怨좎쑀踰덊샇�� �대떦�섎뒗")){
									var layerWidth = search_type=='student' ? '600px' : '500px';
									pop_full_layer_create('user_cd_search','user_cd_search_layer',layerWidth,'auto','no');
									$('#user_cd_search_layer').html(response);
									pop_full_layer_open('user_cd_search'); ////�� �대깽�� �ㅽ겕由쏀듃
									
								}else{
									
									pop_full_layer_create('user_cd_search','user_cd_search_layer','940px','auto','yes');
									$('#user_cd_search_layer').html(response);
									pop_full_layer_open('user_cd_search'); ////�� �대깽�� �ㅽ겕由쏀듃
									
								}
					      		
							break;
						}
		},
		error:function(xmlHttpRequest, textStatus, errorThrown){
			console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
			return;
		}
	});
}

/*********************************************************************
//�⑥닔紐�    : gnb_search
//�⑥닔�ㅻ챸  : GNB 寃���
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-14
*********************************************************************/
var init_class_cnt = 12;
var init_student_cnt = 12;
var init_teacher_cnt = 12;
var init_wang_teacher_cnt = 4;
function gnb_search(more_search){
	
	/*
	 *        [[ �꾪꽣 �ㅻ챸 ]]
	 * 而ㅻ꽖痢좏뒠�� �꾪꽣�� 珥� 3醫낅쪟媛� 議댁옱
	 * 1. GNB�� 議댁옱�섎뒗 理쒖긽�� �꾪꽣 - �쒕룄/硫붿씤怨쇰ぉ
	 * 2. �몃��꾪꽣 1 - �쒓뎔援�/�쒕툕怨쇰ぉ
	 * 3. �몃��꾪꽣 2 - �쒓뎔援�/�쒕툕怨쇰ぉ/�섏뾽鍮�/�섏뾽�잛닔/�섏뾽�뱀쭠/而ㅻ꽖痢좏뒠�곗씤利�\
	 * 
	 */
	
	//濡쒕뵫諛�
	ajax_loading_proc();

	// 寃��� �좏삎
//	var search_type = $("#gnb_sch_type option:selected").val();
	var search_type = (function(param){
		var getParam = (function(idx){
			var vars={},hash;
			var hashes=window.location.search.slice(window.location.search.indexOf('?')+1).split('&');
			for(var i=0;i<hashes.length;i++){
				if(hashes[i]){
					hash=hashes[i].split('=');
					vars[hash[0]]=hash[1]?hash[1].toString().split('#')[0]:''
				}
			}
			return idx===undefined?vars:(vars[idx]!==undefined?vars[idx]:false)
		})();
		old_search_param = $('#gnb_sch_type').val();
		getParam[param] = old_search_param ? old_search_param : getParam[param];
		switch(getParam[param]){
			case 'class':
			case 'student':
				break;
			default:
				getParam[param] = 'class';
		}
		return getParam[param]
	})('search_type');
	
	
	//怨좎쑀踰덊샇 寃��� : 留뚯빟 怨좎쑀踰덊샇 �낅젰移몄뿉 肄붾뱶媛믪씠 議댁옱�쒕떎硫�, 怨좎쑀踰덊샇 寃��됰쭔 �섑뻾
	if($("#search_user_cd").val() != null && $("#search_user_cd").val() != '' && $("#search_user_cd").val() != "怨좎쑀踰덊샇 �낅젰"){
		
		if(search_type == "class"){
			user_cd_search("teacher");
		}else if(search_type == "student"){
			user_cd_search("student");
		}
		
		return;
	}

	//GNB �곷떒 �꾪꽣 2媛� �명똿 [ �� , ��怨쇰ぉ ]
	var si	 			= (si != null) ? 	si 	 : $("#si option:selected").val();
	var sbjt	 		= (sbjt != null) ? 	sbjt : $("#sbjt option:selected").val();
	
	//Version 2 : 寃��� Main�먯꽌�� �쒕룄, �쒓뎔援� �좏깮�꾨뱶 �앷�
	//留뚯빟 寃��됰찓�몄뿉�쒕룄 �쒕룄/�쒓뎔援� �좏깮�덈떎硫�, �� 媛믪쓣 媛�吏�怨� �쒖묶
	var si_class = $("#si_class option:selected").val();
	var sbjt_class = $("#sbjt_class").val();
	if(si_class != null && si_class != ''){
		si = si_class;
	}
	
	if(sbjt_class != null && sbjt_class != ''){
		sbjt = sbjt_class;
	}
	
	//2李� �꾪꽣 [ 援곌뎄 , �몃� 怨쇰ぉ ]
	var gungu_checked = $("#sigungu_arr").val();
	
	//var sbjt_sub_html = new Array();
	var sbjt_sub_checked = '';
	$("input:checkbox[name='sbjt_sub_lcd[]']:checked").each(function(key, checked_value){
		//sbjt_sub_html.push( " " + $("#"+$("#"+checked_value.id).val()).parent().next().children().eq(1).html() );
		sbjt_sub_checked += checked_value.value +',';
	});
	sbjt_sub_checked = sbjt_sub_checked.substring(0, sbjt_sub_checked.length-1);
	
	//�뺣젹 �좏삎
	var sort_type = $("#sort_type option:selected").val();
	
	//�꾩옱 URL �산린
	var this_location = $(location).attr('pathname');

	var sendData = {
		'search_type'	:	search_type,
		'si'			:	si,
		'sbjt'			:	sbjt,
		'sort_type'		:	sort_type,
		'length'		:	init_class_cnt
		
	};

	/* 怨듯넻 �꾪꽣 �곗씠�� �명똿 */
	if(gungu_checked) 		sendData['gungu'] = gungu_checked;
	if(sbjt_sub_checked) 	sendData['sbjt_sub'] = sbjt_sub_checked;
	
	var url = '';
	if(search_type == 'class'){//�섏뾽李얘린 Ajax �몄텧
		
		/* �섏뾽李얘린 �꾪꽣 �곗씠�� �명똿 */
		
		//�숆탳
		sendData['unvst_nm'] = $("#unvst_nm").val();
		
		//�ы븰�щ�, �숇뀈, 怨꾩뿴, �꾧났
		//sendData['unvst_in_cd'] 	= $("#unvst_in_cd option:selected").val();
		sendData['unvst_in_cd'] 	= [];
		$("input:checkbox[name='unvst_in_cd[]']:checked").each(function(key, checked_value){
			sendData['unvst_in_cd'][sendData['unvst_in_cd'].length] = checked_value.value;
		});
		if(sendData['unvst_in_cd'].length==0){
			sendData['unvst_in_cd'] = '';
		}
		sendData['unvst_grade_cd'] 	= $("#unvst_grade_cd option:selected").val();
		sendData['unvst_aflat_cd'] 	= $("#unvst_aflat_cd option:selected").val();
		
		//�깅퀎
		sendData['gender'] 	= $("#gender option:selected").val();
		
		//�쒗꽣 �곕졊��
		sendData['hope_tcer_age_st_cd'] 	= $("#hope_tcer_age_st_cd option:selected").val();
		sendData['hope_tcer_age_ed_cd'] 	= $("#hope_tcer_age_ed_cd option:selected").val();
		
		//�밴린�ы빆
		var spct_cd_checked = '';
		$("input:checkbox[name='spct_cd[]']:checked").each(function(key, checked_value){
			spct_cd_checked += checked_value.value +',';
		});
		spct_cd_checked = spct_cd_checked.substring(0, spct_cd_checked.length-1);
		
		if(spct_cd_checked) sendData['spct_cd_checked'] = spct_cd_checked;
		
		//�꾨줈�� �ъ쭊�щ� , 而ㅻ꽖痢좏뒠�� �몄쬆�곹깭
		sendData['img_yn'] 	= $("input:checkbox[name='img_yn']:checked").val();
		sendData['wang_cert_state_cd'] = $("input:checkbox[name='wang_cert_state_cd']:checked").val();

		//�섏뾽鍮�
		sendData['class_amt_min'] = $("#class_amt_min>option:selected").val();
		sendData['class_amt_max'] = $("#class_amt_max>option:selected").val();
		
		//�섏뾽寃쎈젰, �섏뾽�뺥깭, �섏뾽����, �섏뾽怨꾩뿴
		sendData['class_career_cd'] = $("#class_career_cd>option:selected").val();
		sendData['class_type_cd'] = $("#class_type_cd>option:selected").val();
		sendData['job_cd'] = $("#job_cd>option:selected").val();
		sendData['class_aflat_cd'] = $("#class_aflat_cd>option:selected").val();
		
		//�ъ쭊/�곸긽�깅줉 �щ� , �쒕쾾媛뺤쓽 媛��� �щ�
		sendData['class_img_video_yn'] 	= $("input:checkbox[name='class_img_video_yn']:checked").val();
		sendData['test_class_yn_nm'] = $("input:checkbox[name='test_class_yn_nm']:checked").val();

		//�섏뾽�덈꺼
		var curr_sub_cd_checked = '';
		$("input:checkbox[name='curr_sub_cd[]']:checked").each(function(key, checked_value){
			curr_sub_cd_checked += checked_value.value +',';
		});
		curr_sub_cd_checked = curr_sub_cd_checked.substring(0, curr_sub_cd_checked.length-1);
		if(curr_sub_cd_checked) sendData['curr_sub_cd_checked'] = curr_sub_cd_checked;
		
		//�붾낫湲� �좏깮�� length 怨꾩궛
		if(more_search == 'true'){
			init_class_cnt += 12;
			sendData['length'] = init_class_cnt
		}else{
			//�붾낫湲� �꾪꽣媛� �꾨땲硫�, �ㅼ떆 珥덇린媛믪쓣 12濡� �명똿
			init_class_cnt = 12; 
			sendData['length'] = init_class_cnt;
		}
		
		//紐⑥쭛以묒씤 �섏뾽留� 蹂닿린
		var check_yn = $("#more_more").is(":checked");
		if(check_yn){
			sendData['view_yn'] = 'Y';
		}
		
		//GNB 寃��됱� �대뼡 �섏씠吏��먯꽌�� 寃��됱씠 媛��ν빐�쇳븯誘�濡�, 癒쇱� �섏씠吏� �대룞�꾩뿉 Ajax 紐⑤뱢 �몄텧
		if(this_location != '/class/main'){
			$(location).attr('href','/class/main?sbjt='+sbjt+'&si='+si+'&search_type='+search_type);
			return;
		}
		url = '/class/main/class_list';
		ajax_call_gnb(sendData, url, 'class_list', 'POST', 'HTML');

		//�쒗꽣 [異붿쿇! 而ㅻ꽖痢좏뒠�� �몄쬆�쒗꽣 寃���]  <- �쒗꽣 寃��됯린�μ씠 �꾨땲怨�, �섏뾽 寃��됯껐怨� 諛묒뿉 �몄텧�섎뒗 而ㅻ꽖痢좏뒠�� �몄쬆 �쒗꽣 由ъ뒪��
		
		var teacher_sendData = {
			'start'	: 0,
			'length': init_wang_teacher_cnt,
			'si'	: sendData['si'],
			'gungu'	: sendData['gungu']
		};
		ajax_call_gnb(teacher_sendData, '/class/main/teacher_list', 'wang_teacher_list', 'POST', 'HTML');
		
	}else if(search_type == 'student'){//�숈깮李얘린 Ajax �몄텧

		
		/* �숈깮李얘린 �꾪꽣 �곗씠�� �명똿 */
		
		//����, �숇뀈, 怨꾩뿴
		sendData['job_cd'] = $("#job_cd>option:selected").val();
		sendData['grade_cd'] = $("#grade_cd>option:selected").val();
		sendData['aflat_cd'] = $("#aflat_cd>option:selected").val();
		
		//�깅퀎
		sendData['gender'] = $("#gender>option:selected").val();
			
		//�섏뾽 �덈꺼
		var stlv_cd_checked = '';
		$("input:checkbox[name='stlv_cd[]']:checked").each(function(key, checked_value){
			stlv_cd_checked += checked_value.value +',';
		});
		stlv_cd_checked = stlv_cd_checked.substring(0, stlv_cd_checked.length-1);
		if(stlv_cd_checked) sendData['stlv_cd_checked'] = stlv_cd_checked;
		
		//�꾨줈�� �ъ쭊�щ�
		sendData['img_yn'] 	= $("input:checkbox[name='img_yn']:checked").val();
		
		//�섏뾽猷�
		sendData['hope_class_amt_min'] = $("#hope_class_amt_min>option:selected").val();
		sendData['hope_class_amt_max'] = $("#hope_class_amt_max>option:selected").val();
		
		//寃쎈젰
		sendData['hope_tcer_career_cd'] = $("#hope_tcer_career_cd>option:selected").val();
		
		//�섏씠
		sendData['hope_tcer_age_st_cd'] = $("#hope_tcer_age_st_cd>option:selected").val();
		sendData['hope_tcer_age_ed_cd'] = $("#hope_tcer_age_ed_cd>option:selected").val();

		//�쒗꽣 �깅퀎
		sendData['hope_gender_cd'] = $("#hope_gender_cd>option:selected").val();
		
		//�뱀닔紐⑹쟻 
		var socl_cd_checked = '';
		$("input:checkbox[name='socl_cd[]']:checked").each(function(key, checked_value){
			socl_cd_checked += checked_value.value +',';
		});
		socl_cd_checked = socl_cd_checked.substring(0, socl_cd_checked.length-1);
		if(socl_cd_checked) sendData['socl_cd_checked'] = socl_cd_checked;
		
		if(more_search == 'true'){
			
			init_student_cnt += 12;
			sendData['length'] = init_student_cnt
			
		}else{
			init_student_cnt = 12;
			sendData['length'] = init_student_cnt;
		}
		
		//GNB 寃��됱� �대뼡 �섏씠吏��먯꽌�� 寃��됱씠 媛��ν빐�쇳븯誘�濡�, 癒쇱� �섏씠吏� �대룞�꾩뿉 Ajax 紐⑤뱢 �몄텧
		if(this_location != '/student/main'){
			$(location).attr('href','/student/main?sbjt='+sbjt+'&si='+si+'&search_type='+search_type);
			return;
		}
		url = '/student/main/student_list'
		ajax_call_gnb(sendData, url, 'student_list', 'POST', 'HTML');

	}else if(search_type == 'teacher'){ //�쒗꽣 寃��됯린�� [ 援ы쁽�꾨즺�섏뿀�쇰굹, 湲고쉷蹂�寃쎌쑝濡� 鍮좎쭚 ]
		
		
		
		/* �쒗꽣 李얘린 �꾪꽣 �곗씠�� �명똿 */
		sendData['class_amt_min'] = $("#class_amt_min").html();
		sendData['class_amt_max'] = $("#class_amt_max").html();
		sendData['gawe_cnt_type_cd'] = $("#gawe_cnt_type_cd option:selected").val();
		sendData['gawe_cnt_cd'] = $("#gawe_cnt_cd option:selected").val();

		//�숆탳
		sendData['unvst_nm'] = $("#unvst_nm").val();
		
		//�ы븰�щ�, �숇뀈, 怨꾩뿴, �꾧났
		sendData['unvst_in_cd'] 	= $("#unvst_in_cd option:selected").val();
		sendData['unvst_grade_cd'] 	= $("#unvst_grade_cd option:selected").val();
		sendData['unvst_aflat_cd'] 	= $("#unvst_aflat_cd option:selected").val();
		sendData['unvst_major_nm'] 	= $("#unvst_major_nm").val();
		
		//�깅퀎, �ъ쭊�щ�
		sendData['gender'] 	= $("#gender option:selected").val();
		sendData['img_yn'] 	= $("#img_yn option:selected").val();
		
		//�쒗꽣 �뚯썝 肄붾뱶
		sendData['teacher_cd'] 	= $("#teacher_cd").val();
		
		//�� �몄쬆�щ�
		sendData['wang_cert_state_cd'] = $("input:checkbox[name='wang_cert_state_cd']:checked").val();
		
		
		//�붾낫湲� �좏깮�� length 怨꾩궛
		if(more_search == 'true'){
			init_teacher_cnt += 12;
			sendData['length'] = init_teacher_cnt
		}else{
			//�붾낫湲� �꾪꽣媛� �꾨땲硫�, �ㅼ떆 珥덇린媛믪쓣 12濡� �명똿
			init_teacher_cnt = 12; 
			sendData['length'] = init_teacher_cnt;
		}
		
		//GNB 寃��됱� �대뼡 �섏씠吏��먯꽌�� 寃��됱씠 媛��ν빐�쇳븯誘�濡�, 癒쇱� �섏씠吏� �대룞�꾩뿉 Ajax 紐⑤뱢 �몄텧
		if(this_location != '/teacher/main'){
			$(location).attr('href','/teacher/main?sbjt='+sbjt+'&si='+si+'&search_type='+search_type);
			return;
		}
	
		url = '/teacher/main/teacher_list'
		ajax_call_gnb(sendData, url, 'teacher_list', 'POST', 'HTML');

	}
}

function ajax_loading_proc(){
	//濡쒕뵫 �붾㈃ �몄텧
	var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="http://tutor.conects.com/img/common/search_loading.gif" />')
	.appendTo(document.body).hide();
	$(window).ajaxStart(function(){
		loading.show();
	}).ajaxStop(function(){
		loading.hide();
	});
}

/*********************************************************************
//�⑥닔紐�    : user_cd_search
//�⑥닔�ㅻ챸  : 怨좎쑀 踰덊샇 寃���
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-02-29
*********************************************************************/
function user_cd_search(search_type){
	var url = '';
	var sendData = '';
	if(search_type == 'teacher'){
		url = '/class/main/user_cd_search';
		sendData = {
			'search_user_cd' : $("#search_user_cd").val()
		};
	}else if(search_type == 'student'){
		url = '/student/main/user_cd_search';
		sendData = {
			'search_user_cd' : $("#search_user_cd").val()
		};
	}
	$("#search_user_cd").val('');
	ajax_call_gnb(sendData, url, 'user_cd_search', 'POST', 'HTML');
	
}

/*********************************************************************
//�⑥닔紐�    : logout
//�⑥닔�ㅻ챸  : 濡쒓렇�꾩썐
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-14
*********************************************************************/
function logout(){
	ajax_call_gnb('', '/member/logout', 'logout', 'POST', 'JSON');
}
/*********************************************************************
//�⑥닔紐�    : gnb_si_select
//�⑥닔�ㅻ챸  : 吏��� ���됲듃諛� �좏깮��, 硫붿씤�� �꾪꽣 �곗씠�� 濡쒕뵫
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-14
*********************************************************************/
function gnb_si_select(si){
	sbjt_arr = new Array();
	sbjt_code_arr = new Array();
	
	// url�� �ㅻⅨ �섏씠吏��쇨꼍��( /class/main ) �� �꾨땺 寃쎌슦�� �섏씠吏� �대룞�� �댁빞�섎�濡�, ajax�덊깭�대떎.
	var this_location = $(location).attr('pathname');
	if(this_location == '/class/main' || this_location == '/student/main' || this_location == '/teacher/main'){
		var sendData = {
			'si'	:	si
		};
		ajax_call_gnb(sendData, '/class/main/sigungu_list', 'sigungu_list', 'POST', 'JSON', null, 'Y');
	}
}

/*********************************************************************
//�⑥닔紐�    : gnb_sbjt_select
//�⑥닔�ㅻ챸  : 怨쇰ぉ ���됲듃諛� �좏깮��, 硫붿씤�� �꾪꽣 �곗씠�� 濡쒕뵫
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-14
*********************************************************************/
function gnb_sbjt_select(sbjt){
	// url�� �ㅻⅨ �섏씠吏��쇨꼍��( /class/main ) �� �꾨땺 寃쎌슦�� �섏씠吏� �대룞�� �댁빞�섎�濡�, ajax�덊깭�대떎.
	var this_location = $(location).attr('pathname');

	if(this_location == '/class/main' || this_location == '/student/main' || this_location == '/teacher/main'){
		var sendData = {
			'sbjt'	:	sbjt
		};
		
		ajax_call_gnb(sendData, '/class/main/sbjt_list', 'sbjt_list', 'POST', 'JSON', null , 'Y');
	}
}

/*********************************************************************
//�⑥닔紐�    : sbjt_list
//�⑥닔�ㅻ챸  : GNB�� �� ���됰컯�� change��, class/main�� �꾪꽣 2援곕� �숈쟻 濡쒕뵫
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-15
*********************************************************************/
function sbjt_list(response){
	/*var html_data = '';
	if(response.sbjt_list){
		$.each(response.sbjt_list, function(key, val){
			html_data += '<li>';
			html_data += '<div class="">';
			html_data += '<span class="checkbox">';
			html_data += '<span class="si"><input type="checkbox" onclick="filter_sync(1, this);" name="sbjt_sub_lcd[]" value="'+val.sbjt_lcd+'" id="'+val.sbjt_lcd+'"></span>';
			html_data += '<label for="'+val.sbjt_lcd+'"><span class="inpt"></span><span class="txt">'+val.sbjt_nm+'</span></label>';
			html_data += '</span>';
			html_data += '</div>';
			html_data += '</li>';
		});
	}

	if(html_data == null || html_data == ''){
		html_data = '�대떦 怨쇰ぉ�� �몃�怨쇰ぉ�� 議댁옱�섏� �딆뒿�덈떎.<br><br>';
	}
	$(".sbjt_list").html(html_data);

	var html_data2 = '';
	if(response.sbjt_list){
		$.each(response.sbjt_list, function(key, val){
			html_data2 += '<div class="div_box">';
			html_data2 += '<span class="checkbox">';
			html_data2 += '<span class="si"><input type="checkbox" onclick="filter_sync(2, this);" name="sbjt_sub_lcd_filter_2[]" value="'+val.sbjt_lcd+'" id="det_'+val.sbjt_lcd+'"></span>';
			html_data2 += '<label for="det_'+val.sbjt_lcd+'"><span class="inpt"></span><span class="txt">'+val.sbjt_nm+'</span></label>';
			html_data2 += '</span>';
			html_data2 += '</div>';
		});
	}

	if(html_data2 == null || html_data2 == ''){
		html_data2 = '�대떦 怨쇰ぉ�� �몃�怨쇰ぉ�� 議댁옱�섏� �딆뒿�덈떎.<br><br>';
	}

	$(".sbjt_list_filter").html(html_data2);*/
	var html_data = '';
	if(response.sbjt_list){
		$.each(response.sbjt_list, function(key, val){
			html_data += '<li>';
			html_data += '<input type="checkbox" id="'+val.sbjt_lcd+'" name="sbjt_sub_lcd[]" value="'+val.sbjt_lcd+'"><label for="'+val.sbjt_lcd+'">'+val.sbjt_nm+'</label> ';
			html_data += '<span class="ico-'+val.best_type+'" data-best-yn="'+(val.best_yn=='Y' ? 'Y' : 'N')+'">'+val.best_nm+'</span>';
			html_data += '</li>';
		});
	}

	if(html_data == null || html_data == ''){
		html_data = '�대떦 怨쇰ぉ�� �몃�怨쇰ぉ�� 議댁옱�섏� �딆뒿�덈떎.<br><br>';
	}
	$("#sbjt_sub_list").html(html_data);

	// get param check Start
	var param = (function(idx){
		var vars={},hash;
		var hashes=window.location.search.slice(window.location.search.indexOf('?')+1).split('&');
		for(var i=0;i<hashes.length;i++){
			if(hashes[i]){
				hash=hashes[i].split('=');
				vars[hash[0]]=hash[1]?hash[1].toString().split('#')[0]:''
			}
		}
		return idx===undefined?vars:(vars[idx]!==undefined?vars[idx]:false)
	}('sbjt_sub_cd'));
	if(param){
		param = param.split(',');
		$("input:checkbox[name='sbjt_sub_lcd[]']").each(function(key, attr){
			if((function(val,arr){
					for(_a in arr){
						if(arr[_a]===val){
							return true
						}
					}
					return false
				}(attr.value, param))
			){
				attr.checked = true;
			}
		});
	}
	// get param check End
}
/*********************************************************************
//�⑥닔紐�    : sigungu_list
//�⑥닔�ㅻ챸  : GNB�� �� ���됰컯�� change��, class/main�� �꾪꽣 2援곕� �숈쟻 濡쒕뵫
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-15
*********************************************************************/
function sigungu_list(response){
	/*var html_data = '';
	if(response.sigungu_list){
		$.each(response.sigungu_list, function(key, val){
			html_data += '<li>';
			html_data += '<span class="checkbox sigungu_checkbox">';
			html_data += '<span class="si"><input type="checkbox" onclick="filter_sync(1, this);" name="sigungu_cd[]" value="'+val.area_lcd+'" id="'+val.area_lcd+'"></span>';
			html_data += '<label for="'+val.area_lcd+'"><span class="inpt"></span><span class="txt">'+val.area_nm+'</span></label>';
			html_data += '</span>';
			html_data += '</li>';
		});
	}

	if(html_data == null || html_data == ''){
		html_data = '�대떦 吏���뿉 援�/援� �� 議댁옱�섏� �딆뒿�덈떎.<br><br>';
	}
	$(".sigungu_list").html(html_data);

	var html_data2 = '';
	if(response.sigungu_list){
		$.each(response.sigungu_list, function(key, val){
			html_data2 += '<div class="div_box">';
			html_data2 += '<span class="checkbox">';
			html_data2 += '<span class="si"><input type="checkbox" onclick="filter_sync(2, this);" name="sigungu_cd_filter_2[]" value="'+val.area_lcd+'" id="det_'+val.area_lcd+'"></span>';
			html_data2 += '<label for="det_'+val.area_lcd+'"><span class="inpt"></span><span class="txt">'+val.area_nm+'</span></label>';
			html_data2 += '</span>';
			html_data2 += '</div>';
		});
	}

	if(html_data2 == null || html_data2 == ''){
		html_data2 = '�대떦 吏���뿉 援�/援� �� 議댁옱�섏� �딆뒿�덈떎.<br><br>';
	}
	$(".sigungu_list_main_filter").html(html_data2);*/
	
	var html_data = '';
	if(response.sigungu_list){
		$.each(response.sigungu_list, function(key, val){
			if(key % 3 == 0){
				html_data += '<li class="ml_no">';
			}else{
				html_data += '<li>';
			}
			html_data += '<label for="'+val.area_lcd+'"><input type="checkbox" name="sigungu_cd[]" id="'+val.area_lcd+'" value="'+val.area_lcd+'" onclick="sbjt_check(this);" >'+val.area_nm+'</label>';
			html_data += '</li>';
		});
	}
	
	if(html_data == null || html_data == ''){
		html_data = '�대떦 吏���뿉 援�/援� �� 議댁옱�섏� �딆뒿�덈떎.<br><br>';
	}
	$(".ls_hope_area_gugun").html(html_data);

}


var sbjt_arr = new Array();
var sbjt_code_arr = new Array();

function sbjt_check(obj){
	//泥댄겕諛뺤뒪�� 媛믪� 肄붾뱶濡� �섏뼱�덉쑝誘�濡�, checkbox jquery �ъ슜 遺덇�
	var id = obj.id;
	var checked_yn = $('input:checkbox[id="'+id+'"]').is(":checked");
	
	var text = $('label[for="'+id+'"]').text();
	
	if(checked_yn){
		
		//�띿뒪��
		sbjt_arr.push(text);
		
		//肄붾뱶
		sbjt_code_arr.push(id);
		
		//諛곗뿴�� push ��, 湲몄씠 �먮떒. 5媛� �댁긽�� 寃쎌슦 �ㅼ떆 pop();
		var arr_length = sbjt_arr.length;
		if(arr_length > 5){
			alert("吏���� 理쒕� 5媛쒓퉴吏� �좏깮 媛��ν빀�덈떎.");
			$("input:checkbox[id='"+id+"']").attr("checked", false); /* by ID */
			sbjt_arr.pop();
			sbjt_code_arr.pop();
		}
	}else{
		//�꾨줈�좏��� �⑥닔(common/common.js) valueIndex : 諛곗뿴�� �몃뜳�ㅺ컪 由ы꽩
		var text_index = sbjt_arr.valueIndex(text); 
		var id_index = sbjt_code_arr.valueIndex(id); 
		sbjt_arr.splice(text_index, 1);
		sbjt_code_arr.splice(id_index, 1);
	}
	
	//諛곗뿴 以묐났 �쒓굅
	var uniq_text = sbjt_arr.reduce(function(a,b){
		if (a.indexOf(b) < 0 ) a.push(b);
		return a;
	},[]);
	
	var uniq_code = sbjt_code_arr.reduce(function(a,b){
		if (a.indexOf(b) < 0 ) a.push(b);
		return a;
	},[]);
	
	$("#sigungu_class>option").text(uniq_text);
	$("#sigungu_arr").val(uniq_code);
}

/*********************************************************************
//�⑥닔紐�    : location_mypage
//�⑥닔�ㅻ챸  : GNB 留덉씠而ㅻ꽖痢좏뒠�� 濡쒖��댁뀡
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-25
*********************************************************************/
function location_mypage(user_type){
	if(user_type == 'UTYE002'){
		$(location).attr('href', '/mypage/student_inginfo');
	}else if(user_type == 'UTYE001'){
		$(location).attr('href', '/mypage/teacher_class');
	}else{
		alert('濡쒓렇�� �� �댁슜 媛��ν빀�덈떎.');
		$(location).attr('href', 'https://member.conects.com/member/login?redirect_url=http%3A%2F%2Ftutor.conects.com%2Fmember%2Flogin%3Fredirect_url%3Dhttp%253A%252F%252Ftutor.conects.com%252Fmember%252Flogin');
	}
}


/*********************************************************************
//�⑥닔紐�    : filter_sync
//�⑥닔�ㅻ챸  : �몃��꾪꽣1, �몃��꾪꽣2 �숆린��
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-25
*********************************************************************/
function filter_sync(index, obj){
	//�몃��꾪꽣 1�� 蹂�寃쎈릺�덉쓣寃쎌슦, �몃��꾪꽣2�� 媛� 泥댄궧
	if(index == 1){

		if($(obj).is(':checked') == true){
			$("#det_" + $(obj).attr('id')).attr("checked", true);
			$("#det_" + $(obj).attr('id')).closest('.checkbox').addClass('on');
		}else{
			$("#det_" + $(obj).attr('id')).attr("checked", false);
			$("#det_" + $(obj).attr('id')).closest('.checkbox').removeClass('on');
		}

	}else if(index == 2){//�몃��꾪꽣 2�� 蹂�寃쎈릺�덉쓣寃쎌슦, �몃��꾪꽣1�� 媛� 泥댄궧
		var id = $(obj).attr('id').split('_');
		if($(obj).is(':checked') == true){
			$("#" + id[1]).attr("checked", true);
			$("#" + id[1]).closest('.checkbox').addClass('on');
		}else{
			$("#" + id[1]).attr("checked", false);
			$("#" + id[1]).closest('.checkbox').removeClass('on');
		}

	}

}



/*********************************************************************
//�⑥닔紐�    : open_pop_school
//�⑥닔�ㅻ챸  : �숆탳寃��� �앹뾽
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-05
*********************************************************************/
function open_pop_school_gnb() {

	 $.ajax({
       url     : "/member/join/open_pop_school"
      ,type    : 'POST'
		,async   : false
      ,data    : {
      }
      ,success : function(data) { //�묐떟寃곌낵瑜� 肉뚮젮以���.
			//�� �앹꽦 �ㅽ겕由쏀듃 ex)pop_full_layer_open(el:�앹뾽ID,ml:而⑦뀗痢좏�耳밒D,width:940px/500px,height:700px/auto,scroll:yes/no)
      		pop_full_layer_create('open_pop_school','open_pop_school_layer','500px','auto','no');
			$('#open_pop_school_layer').html(data);
			pop_full_layer_open('open_pop_school'); ////�� �대깽�� �ㅽ겕由쏀듃
      }
      ,error    : function(result) { //�먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
          alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
      }
  });
}

