/*********************************************************************
//�⑥닔紐�    : ajax_call_class
//�⑥닔�ㅻ챸  : ajax 紐⑤뱢(�섏뾽李얘린 / �쒗꽣)
//�몄옄�ㅻ챸
	- sendData : 蹂대궪 �곗씠��
	- url : 蹂대궪 �곗씠��
	- call_type : ajax 肄� �좏삎
	- method : HTTP Method Type
	- dataType : return type
	- etc_param : 湲고� �뚮씪誘명꽣
	- sync : �숆린/鍮꾨룞湲� 泥섎━
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-12
*********************************************************************/
function ajax_call_class(sendData, url, call_type, method, dataType, etc_param, async){
	$.ajax({
		type 	 : method,
		url  	 : url,
		data 	 : sendData,
		dataType : dataType,
		async	 : (async == 'Y') ? false : true,
		success  : function(response){
						switch(call_type){
							case 'wang_teacher_list':
								$("#wang_teacher_list").html(response);
							break;

							case 'gawe_cnt_list':
								gawe_cnt_list(response);
							break;

							case 'student_interest':
								if(response.result == 'SUCCESS'){
									alert('愿��� �깅줉 �꾨즺\n\n�깅줉 �댁뿭�� 留덉씠而ㅻ꽖痢좏뒠�곗뿉�� �뺤씤�섏떎 �� �덉뒿�덈떎.');
									

									if(sendData.gubun == 'list') {
										// $("#gnb_sch").trigger('click');
										$("#like_class_list_"+sendData.class_seq).addClass('on');
									} else{
										$("#like_class_list_"+sendData.class_seq).addClass('on');
										$('#btn_regInterest').addClass('on');
									}
									
								}else if(response.result == 'DELETE_SUCCESS'){
									alert('愿��щ벑濡앹씠 �댁젣 �섏뿀�듬땲��.');
									
									if(sendData.gubun == 'list') {
										$("#like_class_list_"+sendData.class_seq).removeClass('on');
									} else {
										$("#like_class_list_"+sendData.class_seq).removeClass('on');
										$('#btn_regInterest').removeClass('on');
									}
									
									
								}else if(response.result == 'DELETE_FAIL'){
									alert('愿��щ벑濡앹씠 �댁젣�� �ㅽ뙣�섏��듬땲��. 愿�由ъ옄�먭쾶 臾몄쓽�섏꽭��.');
								}else if(response.result == 'NOT_LOGIN'){
									alert('濡쒓렇�� �꾩뿉 �댁슜 媛��ν빀�덈떎.');
									$(location).attr('href', 'https://'+$(location).attr('host')+'/member/login?redirect_url='+encodeURIComponent('http://'+$(location).attr('host')+'/class/main'+$(location).attr('search')));
								}else{
									alert('愿��� �깅줉�� �ㅽ뙣�섏��듬땲��. 愿�由ъ옄�먭쾶 臾몄쓽�섏꽭��.');
								}
							break;

							case 'teacher_report_form':
								pop_full_layer_create('teacher_report_form', 'teacher_report_form_pop', '600px', 'auto', 'no');
					            $('#teacher_report_form_pop').html(response);
					            pop_full_layer_open('teacher_report_form');//�붿옄�� �곸슜
				            break;
						}
		},
		error	 : function(xmlHttpRequest, textStatus, errorThrown){
			console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
			return;
		}
	});
}

var init_value = 4;
function get_teacher_list(more_value){
	if(more_value){
		init_value += more_value;
	}

	var gungu_checked = '';
	$("input:checkbox[name='sigungu_cd[]']:checked").each(function(key, checked_value){
		gungu_checked += checked_value.value +',';
	});
	gungu_checked = gungu_checked.substring(0, gungu_checked.length-1);

	
	
	var si	=	$("#si option:selected").val();
	var si_class = $("#si_class option:selected").val();
	if(si_class != null && si_class != ''){
		si = si_class;
	}
	
	
	var sendData = {
			'start'	: 0,
			'length': init_value,
			'si'	: si,
			'gungu'	: gungu_checked
	};

	ajax_call_class(sendData, '/class/main/teacher_list', 'wang_teacher_list', 'POST', 'HTML');
}

/*********************************************************************
//�⑥닔紐�    : gawe_cnt_selected
//�⑥닔�ㅻ챸  : �섏뾽 �잛닔 ���됲듃/ �숈쟻 �곸뒪 �ㅽ뵂
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-15
*********************************************************************/
function gawe_cnt_selected(selected){
	ajax_call_class({'selected':selected}, '/class/main/gawe_cnt_list', 'gawe_cnt_list', 'POST', 'json');
}

/*********************************************************************
//�⑥닔紐�    : gawe_cnt_list
//�⑥닔�ㅻ챸  : �섏뾽 �잛닔 ���됲듃/ �숈쟻 �곸뒪 �ㅽ뵂
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-15
*********************************************************************/
function gawe_cnt_list(response){

	var html_data = '';
	if(response.gawe_cnt_list){
		html_data += '<div class="slt slt_bx slt_bx_200_32">';
		html_data += '<select name="gawe_cnt_cd"  id="gawe_cnt_cd">';
		html_data += '<option value="">�잛닔</option>';

		$.each(response.gawe_cnt_list, function(key, val){
			html_data += '<option value="'+val.cd+'">'+val.cd_nm+'</option>';
		});

		html_data += '</select>';
		html_data += '</div>';
	}
	$("#gawe_cnt_list").html(html_data);
	selectBox($("#gawe_cnt_list").find('.slt'));
}

/*********************************************************************
//�⑥닔紐�    : open_dim_teacher_class_detail
//�⑥닔�ㅻ챸  : �쒗꽣 �곸꽭 �뺣낫 議고쉶
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-18
*********************************************************************/
function open_dim_teacher_class_detail(class_seq, user_cd){
	 $.ajax({
         url     : "/class/main/open_dim_teacher_class_detail_v2"
        ,type    : 'POST'
		,async   : false
        ,data    : {
        	'class_seq'	: class_seq,
        	'user_cd'	: user_cd
        }
        ,success : function(data) { //�묐떟寃곌낵瑜� 肉뚮젮以���.
			//�� �앹꽦 �ㅽ겕由쏀듃(�ъ씠利덈궡�ㅽ겕濡ㅽ삎) ex)pop_full_layer_create,(el:�앹뾽ID,ml:而⑦뀗痢좏�耳밒D,width:940px/500px,height:700px/auto,scroll:yes/no)
			//�� �앹꽦 �ㅽ겕由쏀듃(�꾩껜�ㅽ겕濡ㅽ삎) ex)pop_full_layer_formation,(el:�앹뾽ID,ml:而⑦뀗痢좏�耳밒D,width:940px/500px,height:700px/auto,scroll:yes/no)
			//pop_full_layer_create('full_layer_01','open_pop3','940px','700px','yes');
        	pop_full_layer_formation('full_layer_01','open_pop3','940px','auto','yes');
			$('#open_pop3').html(data);
			pop_full_layer_open('full_layer_01'); ////�� �대깽�� �ㅽ겕由쏀듃
			layer_class_detail(); //而ㅻ━�먮읆 �붾낫湲� 湲곕뒫
        }
        ,error    : function(result) { //�먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
            alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
        }
    });
}


/*********************************************************************
//�⑥닔紐�    : open_dim_teacher_class_detail_v2
//�⑥닔�ㅻ챸  : �쒗꽣 �곸꽭 �뺣낫 議고쉶 Ver 2.0
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-04-08
*********************************************************************/
function open_dim_teacher_class_detail_v2(class_seq, user_cd){
	 $.ajax({
	     url     : "/class/main/open_dim_teacher_class_detail_v2"
	    ,type    : 'POST'
		,async   : false
	    ,data    : {
	    	'class_seq'	: class_seq,
	    	'user_cd'	: user_cd
	    }
	    ,success : function(data) { //�묐떟寃곌낵瑜� 肉뚮젮以���.
	  	  		pop_full_layer_formation('open_dim_teacher_class_detail','open_dim_teacher_class_detail2','940px','auto','yes');
				$('#open_dim_teacher_class_detail2').html(data);
				pop_full_layer_open('open_dim_teacher_class_detail'); ////�� �대깽�� �ㅽ겕由쏀듃
				
				$('.bxslide').bxSlider({
				 	auto: true,
				 	pager: false,
				 	// pagerType: 'short',
				 	mode: 'fade',
				 	controls: false,
				 	slideWidth: 820
				});
				
				/*$('.bxslider2').bxSlider({
					auto: true,
					speed: 400,
					pager: false
				});*/
	    }
	    ,error    : function(result) { //�먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
	        alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
	    }
	});
}
/*********************************************************************
//�⑥닔紐�    : insert_student_appication
//�⑥닔�ㅻ챸  : �숈깮_�좎껌(�닿� �좎껌�� �섏뾽) - �곕씫 �붿껌�섍린
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-18
*********************************************************************/
function insert_student_appication(class_seq, teacher_id, teacher_cd){
	var user_type = $("#user_type").val();
	var user_id = $("#user_id").val();
	var stnt_mbr_stat = $('#stnt_mbr_stat').val();

	//濡쒓렇�� �덈뤌�덉쑝硫� return
	if(user_id == '' || user_id == null){
		alert("濡쒓렇�� �댄썑�� �ъ슜 媛��ν빀�덈떎.");

		$(location).attr('href', 'https://'+$(location).attr('host')+'/member/login?redirect_url='+encodeURIComponent('http://'+$(location).attr('host')+'/class/main'+$(location).attr('search')));
		return;
	}

	//�섏뾽紐⑥쭛以묒씤 �곹깭媛� �꾨땲硫� return
	if(stnt_mbr_stat == 'N') {
		alert("紐⑥쭛以묒씤 �곹깭�먯꽌留� �곕씫 �붿껌�� �� �� �덉뒿�덈떎.\n[留덉씠而ㅻ꽖痢좏뒠��] �먯꽌 �섏뾽紐⑥쭛�곹깭瑜� 蹂�寃쏀빐二쇱꽭��.");
		return;
	}

	//�숈깮�뚯썝�� �꾨땲硫� return
	if(user_type != 'UTYE002') {
		alert('\n�숈깮 �뚯썝留� �좎껌�� �� �덉뒿�덈떎. \n\n�섏뾽�� �좎껌�섍퀬 �띠쑝�쒕㈃ �숈깮 �뚯썝�쇰줈 媛��낇빐二쇱꽭��.\n');
		return;
	}

	if(confirm("�쒗꽣�먭쾶 �곕씫�붿껌�� �섏떆寃좎뒿�덇퉴?\n�곕씫�붿껌 �� �쒗꽣�먭쾶 臾몄옄媛� 諛쒖넚�⑸땲��.")){
		$.ajax({
	         url     : "/class/main/student_application_layer"
	        ,type    : 'POST'
	        ,data    : {
	        	'class_seq'		: class_seq,
	        	'teacher_id'	: teacher_id,
	        	'teacher_cd'	: teacher_cd
	        }
	        ,success : function(data) { //�묐떟寃곌낵瑜� 肉뚮젮以���.
	        	pop_full_layer_create('full_layer_student_application', 'open_pop_500_student_application', '500px', 'auto', 'no');
	            $('#open_pop_500_student_application').html(data);
	            pop_full_layer_open('full_layer_student_application');//�붿옄�� �곸슜
	        }
	        ,error    : function(result) { //�먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
	            alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
	        }
		});
	}
}

/*********************************************************************
//�⑥닔紐�    : mms_send_to_teacher
//�⑥닔�ㅻ챸  : MMS 諛쒖넚 ( �숈깮 -> �쒗꽣 )
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-19
*********************************************************************/
function mms_send_to_teacher(class_seq, teacher_id, teacher_cd){

	var user_type = $("#user_type").val();
	var user_id = $("#user_id").val();
	var contact_cnt = isNaN($("#contact_cnt").val()) ? 0 : parseInt($("#contact_cnt").val());
	
	if(user_id == '' || user_id == null){
		alert("濡쒓렇�� �댄썑�� �ъ슜 媛��ν빀�덈떎.");
		$(location).attr('href', 'https://'+$(location).attr('host')+'/member/login?redirect_url='+encodeURIComponent('http://'+$(location).attr('host')+'/class/main'+$(location).attr('search')));
	}else{
		if(user_type != 'UTYE002'){
			alert('\n�숈깮 �뚯썝留� 臾몄옄瑜� 蹂대궪 �� �덉뒿�덈떎. \n\n�섏뾽�� �좎껌�섍퀬 �띠쑝�쒕㈃ �숈깮 �뚯썝�쇰줈 媛��낇빐二쇱꽭��.\n');
			return;
		}

		if(contact_cnt){
			if(confirm('�대� 臾몄옄瑜� 諛쒖넚�덈뜕 �뚯썝�낅땲��.\n\n�ㅼ떆 臾몄옄 蹂대궡湲곕� �섏떎 寃쎌슦, 臾몄옄 諛쒖넚 �잛닔媛� 李④컧�⑸땲��.\n\n�뺤씤�� �꾨Ⅴ�쒕㈃ 臾몄옄 蹂대궡湲� �붾㈃�쇰줈 �대룞�⑸땲��.')){
				// continue;
			}else{
				return;
			}
		}

		$.ajax({
	         url     : "/class/main/mms_send_to_teacher"
	        ,type    : 'POST'
	        ,data    : {
	        	'class_seq'		: class_seq,
	        	'teacher_id'	: teacher_id,
	        	'teacher_cd'	: teacher_cd
	        }
	        ,success : function(data) { //�묐떟寃곌낵瑜� 肉뚮젮以���.
	        	pop_full_layer_create('mms_send_to_teacher', 'open_pop_mms_send_to_teacher', '600px', 'auto', 'no');
	            $('#open_pop_mms_send_to_teacher').html(data);
	            pop_full_layer_open('mms_send_to_teacher');//�붿옄�� �곸슜
	        }
	        ,error    : function(result) { //�먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
	            alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
	        }
	    });
	}
}

/*********************************************************************
//�⑥닔紐�    : student_interest
//�⑥닔�ㅻ챸  : 愿��� �깅줉 ( �숈깮 -> �쒗꽣 �섏뾽)
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-19
*********************************************************************/
function student_interest(class_seq, teacher_id, teacher_cd, gubun){
	if($("#user_type").val() != 'UTYE002'){
		alert('\n�숈깮 �뚯썝留� �좎껌�� �� �덉뒿�덈떎. \n\n�섏뾽�� �좎껌�섍퀬 �띠쑝�쒕㈃ �숈깮 �뚯썝�쇰줈 媛��낇빐二쇱꽭��.\n');
	}else{

		var sendData = {
			'class_seq' : class_seq,
			'user_id' 	: teacher_id,
			'user_cd' 	: teacher_cd,
			'gubun'		: gubun
		};

		ajax_call_class(sendData, '/class/main/student_interest', 'student_interest', 'POST', 'JSON');
	}
}

/*********************************************************************
//�⑥닔紐�    : url_share
//�⑥닔�ㅻ챸  : URL 蹂듭궗
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-01-21
*********************************************************************/
function url_share(class_seq, teacher_cd){
	var url = 'http://' + $(location).attr('host') + '/class/main' + $(location).attr('search') + '&class_seq=' + class_seq + '&teacher_cd=' + teacher_cd;

	if(!$(location).attr('search')){
		url = 'http://' + $(location).attr('host') + '/class/main' + '?sbjt=&si=&search_type=class&class_seq=' + class_seq + '&teacher_cd=' + teacher_cd;
	}

	if(is_ie()) {
		window.clipboardData.setData("Text", url);
		alert("URL�� 蹂듭궗�섏뿀�듬땲��. \n寃뚯떆�먯씠�� 硫붿떊���먯꽌 遺숈씠湲� (Ctrl + V) �대낫�몄슂.");
		return;
	}
	prompt("�� 湲��� 二쇱냼�낅땲��. \nCtrl + C 瑜� �뚮윭 �대┰蹂대뱶濡� 蹂듭궗�섏꽭��", url);
}

function is_ie(){
	if(navigator.userAgent.toLowerCase().indexOf("chrome") != -1) return false;
	if(navigator.userAgent.toLowerCase().indexOf("msie") != -1) return true;
	if(navigator.userAgent.toLowerCase().indexOf("windows nt") != -1) return true;
	return false;
}

function clear_search_data(){
	
	$("#search_user_cd").val('踰덊샇�낅젰');
	
	selectChange('si_class', '');
	$("#sbjt_class").val('');
	$("ul.subbox>li").removeClass('on');
	$("input:checkbox[name='sbjt_sub_lcd[]']:checked").each(function(key,val){
		 this.checked = false;
	});
	
	$("#sigungu_class>option").text('吏���� 理쒕� 5媛쒓퉴吏� �좏깮 媛���');
	
	$("#unvst_nm_view").val('');
	$("#unvst_nm").val('');
	selectChange('unvst_in_cd', '');
	selectChange('unvst_aflat_cd', '');
	selectChange('unvst_grade_cd', '');
	selectChange('gender', '');
	selectChange('hope_tcer_age_st_cd', '');
	selectChange('hope_tcer_age_ed_cd', '');
	
	$("input:checkbox[name='spct_cd[]']:checked").each(function(key,val){
		 this.checked = false;
	});
	
	$("input:checkbox[name='img_yn']").attr('checked', false);
	$("input:checkbox[name='wang_cert_state_cd']").attr('checked', false);
	
	selectChange('class_amt_min', '');
	selectChange('class_amt_max', '');
	selectChange('class_career_cd', '');
	selectChange('class_type_cd', '');
	selectChange('job_cd', '');
	selectChange('class_aflat_cd', '');
	
	$("input:checkbox[name='class_img_video_yn']").attr('checked', false);
	$("input:checkbox[name='test_class_yn_nm']").attr('checked', false);
	
	$("input:checkbox[name='curr_sub_cd[]']:checked").each(function(key,val){
		 this.checked = false;
	});
	
}

function teacher_report_form(teacher_id, teacher_cd){
	var sendData = {
		'teacher_cd' 	: teacher_cd,
		'teacher_id' 	: teacher_id
	};

	ajax_call_class(sendData, '/class/main/teacher_report_form', 'teacher_report_form', 'POST', 'HTML');
}
