/********** Design Style Guide (Popup&Alert) **********/
/* ���덉씠�� �몄텧 pop_full_layer */
var full_layer_zindex = 1000; //�앹꽦�곸뒪
var full_layer_length = 0; //�앹꽦媛�닔
//�� �앹꽦 �ㅽ겕由쏀듃 ex)pop_full_layer_create(el:�앹뾽ID,ml:而⑦뀗痢좏�耳밒D,width:940px/500px,height:700px/auto,scroll:yes/no)
function pop_full_layer_create(el,ml,w,h,scrl){
	var scrl_w = w;
	if(scrl == 'yes'){ //�ㅽ겕濡ㅼ엳�꾩떆 w媛�+16px;
		var chk_ful = scrl_w.indexOf('px');
		var chk_num = Number(scrl_w.substring(0,chk_ful))+16;
		var chk_str = scrl_w.substring(chk_ful);
		scrl_w = chk_num+chk_str;
	}
	var wrap = $('#dim_wrap'); //�ㅻ쓣�곕뒗 �꾩튂
	full_layer_zindex += 0;
	var strHtml= "";
	strHtml+='<div id="bg_'+el+'" class="bg_dim_full_layer" style="z-index:'+full_layer_zindex+'"></div>';
	strHtml+='<div class="pop dim_full_layer" style="overflow-y:scroll;z-index:'+full_layer_zindex+'">';
	strHtml+='		<div class="bg_dim"></div>';
	strHtml+='		<div id="'+el+'" class="full_layer" style="width:'+scrl_w+';height:'+h+'">';
	strHtml+='			<div class="pop_container">';
	if(scrl == 'yes'){
	strHtml+='				<div class="form_scrollbar_jq">';
	strHtml+='					<div id="'+ml+'" class="scrollbar_outer pop_scrb pop_scrb_h_'+h+'" style="width:'+scrl_w+';height:'+h+'">';
	}else{
	strHtml+='				<div class="">';
	strHtml+='					<div id="'+ml+'" class="pop_scrb pop_scrb_h_'+h+'" style="width:'+scrl_w+';height:'+h+'">';
	}
	strHtml+='					</div>';
	strHtml+='					<div class="btn_x">';
	strHtml+='						<button type="button" class="btn_close_pop">';
	strHtml+='							<span class="blind">�リ린踰꾪듉</span>';
	strHtml+='						</button>';
	strHtml+='					</div>';
	strHtml+='				</div>';
	strHtml+='			</div>';
	strHtml+='		</div>';
	strHtml+='</div>';
	wrap.append(strHtml);
}
//�� �앹꽦 �ㅽ겕由쏀듃 ex)pop_full_layer_formation(el:�앹뾽ID,ml:而⑦뀗痢좏�耳밒D,width:940px/500px,height:700px/auto,scroll:yes/no)
function pop_full_layer_formation(el,ml,w,h,scrl){
	//scroll:yes/no �ㅽ겕濡ㅼ엳�꾩떆 誘몄옉��
	var wrap = $('#dim_wrap'); //�ㅻ쓣�곕뒗 �꾩튂
	full_layer_zindex += 10;
	var strHtml= "";
	strHtml+='<div id="bg_'+el+'" class="bg_dim_full_layer" style="z-index:'+full_layer_zindex+'"></div>';
	strHtml+='<div class="pop dim_full_layer" style="overflow-y:scroll;z-index:'+full_layer_zindex+'">';
	strHtml+='		<div class="bg_dim"></div>';
	strHtml+='		<div id="'+el+'" class="full_layer" style="width:'+w+';height:'+h+'">';
	strHtml+='			<div class="bg_flyer"></div>';
	strHtml+='			<div class="pop_container">';
	strHtml+='				<div class="">';
	strHtml+='					<div id="'+ml+'" class="dim_scrb pop_scrb_h_'+h+'" style="width:'+w+';height:'+h+'">';
	strHtml+='					</div>';
	strHtml+='					<div class="btn_x">';
	strHtml+='					<button type="button" class="btn_close_pop">';
	strHtml+='						<span class="blind">�リ린踰꾪듉</span>';
	strHtml+='					</button>';
	strHtml+='					</div>';
	strHtml+='				</div>';
	strHtml+='			</div>';
	strHtml+='		</div>';
	strHtml+='</div>';
	wrap.append(strHtml);
}
//�� �대깽�� �ㅽ겕由쏀듃
function pop_full_layer_open(el){
	after_ajax(el)//�붿옄�� �곸슜
	full_layer_length ++ //�앹꽦媛�닔
	$('html').css('overflow-y','hidden')//html �ㅽ겕濡ㅼ젣嫄�
	var temp = $('#' + el);
	var id = temp.attr("id");
	var bg = temp.prev().hasClass('bg');
	var bg_dim = temp.prev().hasClass('bg_dim');
	if(bg){
		//visible�곸슜
		$("#"+id).parent().fadeIn();
		temp.fadeIn();
		temp.addClass('motion');//transform
		//�꾩튂�뗮똿
		if (temp.outerHeight() < $(document).height()){
			$('html').css('overflow-y','scroll')//html �ㅽ겕濡ㅼ젣嫄�
		} else {
			temp.css('top', '0px');
		}
		if (temp.outerWidth() < $(document).width()){
			temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		} else {
			temp.css('left', '0px')
		}
		//�대┃�대깽��
		temp.find('.btn_x').click(function(e){
			//temp.closest('.pop_full_layer').fadeOut();
			temp.closest('.pop_full_layer').remove();
			temp.remove();
			full_layer_length --;//�앹꽦媛�닔
			if(full_layer_length == 0){
				$('html').css('overflow-y','scroll')//html �ㅽ겕濡ㅼ깮��
			}
		});
		temp.find('.btn_cancle_dim').click(function(e){
			temp.find('.btn_close_pop').trigger( "click" );
		});
	}else if(bg_dim){
		//visible�곸슜
		$("#"+id).parent().fadeIn();
		temp.fadeIn();
		//�꾩튂�뗮똿
		if (temp.outerWidth() < $(document).width()){
			temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		} else {
			temp.css('left', '0px')
		}
		//�대┃�대깽��
		temp.find('.btn_x').click(function(e){
			//temp.closest('.pop_full_layer').fadeOut();
			temp.closest('.dim_full_layer').prev('.bg_dim_full_layer').remove();
			temp.closest('.dim_full_layer').remove();
			temp.remove();
			full_layer_length --;//�앹꽦媛�닔
			if(full_layer_length == 0){
				$('html').css('overflow-y','scroll')//html �ㅽ겕濡ㅼ깮��
			}
		});
		temp.find('.btn_cancle_dim').click(function(e){
			temp.find('.btn_close_pop').trigger( "click" );
		});
	}
}

/********** gnb_selectbox **********/
/*gnb select box style script*/
function gnb_selectBox($o, value){
	var $slct = $o.children('select');
	var $opt = $slct.children('option');
	var $opt_lth = $opt.length;
	var $slct_opt = '';
	var f_option = '<ul class="option">';
	$opt.each(function(i){
		f_option += '<li><a href="#">' + $(this).text() + '</a></li>';
		if(i == 0) $slct_opt = $(this).text();
		if($(this).prop('selected')) $slct_opt = $(this).text();
		if(i == $opt_lth - 1) f_option += '</ul>'
	});
	var f_select = '<div class="selected">' +
					   '<span class="txt">' + $slct_opt + '</span>' +
					   '<span class="ico"></span>' +
				   '</div>';
	if(value){
		$opt.each(function(i){
			$(this).prop('selected',false);
			if($(this).val()==value){
				$slect_opt = $(this).text();
				$(this).prop('selected',true);
			}
		});
		$o.children('.selected').children('.txt').text($slect_opt);
	}else{
		$slct.hide();
		$o.append(f_select + f_option);
		$o.on('click', '.selected', function(){
			if($(this).parent().hasClass('readonly')) return false;
			//console.log($(this).parent().hasClass('on'));
			//$(this).parent().hasClass('on') ? console.log('d') : $(this).parent().addClass('on');
			// ? $(this).parent().removeClass('on') : $(this).parent().addClass('on');
			$(this).parent().toggleClass('on');
		});
	}
	/*�듭뀡 �ㅽ겕濡� �ㅽ겕由쏀듃*/
	$o.find('.option').addClass('scrollbar_outer');
	var temp = $('.form_scrollbar_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".scrollbar_outer").each(function(){
			$(this).scrollbar();
		})
	}
	/*e:�듭뀡 �ㅽ겕濡� �ㅽ겕由쏀듃*/

	$o.on('mousedown', '.option a', function(){
		var i = $(this).parent('li').index();
		var $slct_txt = $(this).parents('.option').prev('.selected').children('span.txt');
		$slct_opt = $(this).text()
		$opt.each(function(){
			$(this).prop('selected',false);
		});
		$slct_txt.html($slct_opt);
		$slct.children('option').eq(i).prop('selected',true);
		$o.removeClass('on');
		$slct.change();
		//event.stopPropagation();
		return false;
	});
	$o.on('mouseleave',$(this),function(){
		$o.removeClass('on');
	});
}



/*gnb pop_myarea_layer*/
$(document).ready(function(){
	var temp = $('.myarea');
	temp.find('>ul>li.evt').bind("mouseenter click",function(){
		if($(this).hasClass('on') != 1){
			$(this).addClass('on').siblings().removeClass('on');
			var _li = $(this).find('>a').attr('class');
			pop_myarea_layer_toggle(_li);
		}else{
			$(this).removeClass('on');
			var _li = $(this).find('>a').attr('class');
			pop_myarea_layer_toggle();
		}

	});
	temp.find('>ul>li.evt').bind("mouseleave",function(){
		$(this).removeClass('on');
		var _li = $(this).find('>a').attr('class');
		pop_myarea_layer_toggle();
	});
})
function pop_myarea_layer_toggle(cls){
	$('.pop_myarea_layer').css('display','none');
	if(cls){
		$('.pop_myarea_layer_'+cls).css('display','block');
	}
}

$(document).ready(function(){
	var temp = $('.gnb_select');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".slt_gnb_bx").each(function(){
			gnb_selectBox($(this));
		});
	}
});

$( document ).ready(function() {
	/*
	GNB �좏깮 �쒖꽦��
	 */
	$( "#gnb_sch_type" ).change(function() {
		$(this).parent().addClass('done');
	});
	$( "#si" ).change(function() {
		$(this).parent().addClass('done');
	});
	$( "#sbjt" ).change(function() {
		$(this).parent().addClass('done');
	});

	$( ".list_class .conts" ).addClass('newcard');
	



	 
});
 
/* box_class_cont �섏뾽由ъ뒪�� */
function box_class_cont(){
	var $o = $('.box_class_cont');
	var temp = false;

	$o.mouseenter(function(){
		var $wrap_class = $(this).find('.wrap_class');
		var $ico_stamp = $(this).find('.ico_stamp');

		$wrap_class.stop().slideUp('fast', function(){
			if($ico_stamp.length>0){
				temp = true;

				setTimeout(function(){
					show_stamp($ico_stamp);
				}, 300);
			}
		});
		// $(this).find('.wrap_person').css('padding-top','20px');

		$(this).mouseleave(function(){
			$wrap_class.stop().slideDown(0);
			temp = false;
			show_stamp($ico_stamp);
			$(this).find('.wrap_person').css('padding-top','0');
		});
	});
	$o.click(function(){
		$(this).addClass('motion');
		setTimeout(function(){ $o.removeClass('motion'); }, 600);
	})

	function show_stamp($stamp){
		(temp) ? $stamp.show() : $stamp.hide();
	}
}
$(document).ready(function(){
	box_class_cont();
});

var btn_func_02 = function (){
	/* �숇�紐④��� �꾩�留�*/
	//ex url http://qa-www.gawewang.com/member/join/student_join_member_info
	$('.btn_func_02.question').mouseenter(function() {
		$(this).css('position','relative').append("<span class='focus'>�숇�紐⑥씠�� 寃쎌슦�� �대떦 ��ぉ�� 泥댄겕�섏떆怨� �섏뾽�� 諛쏆쓣 �숈깮�� �뺣낫瑜� 湲곗엯�댁＜�몄슂.<span>").find("span.focus").css({
			'display' : 'block',
			'position' : 'absolute',
			'left' : '5px',
			'top' : '5px',
			'z-index' : 10,
			'width' : '250px',
			'padding' : '10px',
			'background' : '#fff',
			'border' : '1px solid #d4d4d4',
			'color' : '#ababab',
			'text-align' : 'left'
		});
	}).mouseleave(function() {
		$(this).find("span.focus").remove();
	});
}
$(document).ready(function(){
	btn_func_02();
 });

/* top踰꾪듉 */
var btn_top_func = function (){
	var temp =  $('#dim_wrap').find('.bg_dim_full_layer');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.next('.pop').scrollTop(0);
	}
}
$(document).ready(function(){
	$('#btn_top').on('click',btn_top_func);
 });
/**********  **********/


function ST_CONECTS_TUTOR(){
	this.event={
		applies:{},
		on:{}
	};
}
var COMM_CONECTS_TUTOR = new ST_CONECTS_TUTOR();

ST_CONECTS_TUTOR.prototype.init = function(){
	this.initEvent();
	this.initApplies();
}

ST_CONECTS_TUTOR.prototype.on = function(action, selector, handler){
	this.event.on[action] = this.event.on[action] || {};
	this.event.on[action][selector] = handler || function(e){
		e.preventDefault();
	};
}

ST_CONECTS_TUTOR.prototype.off = function(action, selector){
	this.event.on[action] = this.event.on[action] || {};
	delete(this.event.on[action][selector]);
}

ST_CONECTS_TUTOR.prototype.initEvent = function(){
	// �ㅼ젙�� ID�ㅼ쓣 李얠븘 event �ㅼ젙 Start
	(function(obj){
		for(var action in obj){
			if(obj.hasOwnProperty(action)){
				(function(obj, action){
					for(var target in obj){
						if(obj.hasOwnProperty(target)){
							$(target).off(action, obj[target]);
							$(target).on(action, obj[target]);
						}
					}
				}(obj[action], action))
			}
		}
	}(this.event.on));
	// �ㅼ젙�� ID瑜� 李얠븘 event �ㅼ젙 End
}

ST_CONECTS_TUTOR.prototype.resetEvent = function(resetAction, resetSelector){
	// �ㅼ젙�� ID�ㅼ쓣 李얠븘 event �ㅼ젙 Start
	(function(obj){
		for(var action in obj){
			if(obj.hasOwnProperty(action)){
				if(resetAction && resetAction.toLowerCase()!==action.toLowerCase()){
					continue;
				}
				(function(obj, action){
					for(var selector in obj){
						if(obj.hasOwnProperty(selector)){
							if(resetAction && resetSelector && resetSelector.toLowerCase()!==selector.toLowerCase()){
								continue;
							}
							$(selector).off(action, obj[selector]);
							$(selector).on(action, obj[selector]);
						}
					}
				}(obj[action], action))
			}
		}
	}(this.event.on));
	// �ㅼ젙�� ID瑜� 李얠븘 event �ㅼ젙 End
}

ST_CONECTS_TUTOR.prototype.applies = function(selector, handler){
	this.event.applies[selector] = handler || function(){};
}

ST_CONECTS_TUTOR.prototype.initApplies = function(){
	// �ㅼ젙�� ID�ㅼ쓣 李얠븘 �ㅽ뻾 Start
	(function(obj){
		for(var action in obj){
			$(action).each(function(idx, attr){
				obj[action].apply(attr);
			});
		}
	}(this.event.applies));
	// �ㅼ젙�� ID瑜� 李얠븘 �ㅽ뻾 End
}

ST_CONECTS_TUTOR.prototype.fn = ST_CONECTS_TUTOR.prototype.fn || {};
ST_CONECTS_TUTOR.prototype.fn.exec = function(str){
	try{
		try{
			return eval(str)
		}catch(e){
			return eval('('+str+')')
		}
	}catch(e){
		return {}
	}
}

ST_CONECTS_TUTOR.prototype.fn.in_array = function(val,arr){
	for(i in arr){
		if(arr.hasOwnProperty(i)){
			if(arr[i]===val){
				return true
			}
		}
	}
	return false
}

ST_CONECTS_TUTOR.prototype.fn.arrayToObj = function(str){
	_t={};
	for(i in arr){
		if(arr.hasOwnProperty(i)){
			_t[i]=arr[i]
		}
	}
	return _t
}

ST_CONECTS_TUTOR.prototype.fn.stringToObj = function(str){
	return this.toObj(str)
}

ST_CONECTS_TUTOR.prototype.fn.toObj = function(str){
	if(this.in_array(Object.prototype.toString.call(str),['[object Object]','[object Array]'])){
		return this.arrayToObj(str)
	}
	return Object.prototype.toString.call(str)=='[object Array]'?this.arrayToObj(this.exec(str)):this.exec(str)
}

ST_CONECTS_TUTOR.prototype.fn.toStr = function(obj, ndeep){
	switch(typeof obj){
		case "string":
			return '"'+obj+'"';
		case "function":
			return obj.name||obj.toString();
		case "object":
			var indent=Array(ndeep||1).join('\t'),isArray=Object.prototype.toString.call(obj)==='[object Array]';
			return ((isArray?'[':'{')+(function(obj,c){
				is=[];
				for(key in obj){
					if(Object.prototype[key]===obj[key] || Array.prototype[key]===obj[key]){
						continue; // Object.prototype fixed
					}
					is.push('\n\t'+indent+(isArray?'':key+':')+c.toStr(obj[key],(ndeep||1)+1))
				}
				return is
			})(obj,this).join(',')+'\n'+indent+(isArray?']':'}')).replace(/[\s\t\n]+(?=(?:[^\'"]*[\'"][^\'"]*[\'"])*[^\'"]*$)/g,'');
		case 'undefined':
			return ''
		default:
			return obj.toString()
	}
}

(function(){
ST_CONECTS_TUTOR.prototype.fn.byteCheck = function(str, limit){
	var result = {
		 byte:0
		,limit:0
	}
	if(str == null){
		// continue;
	}else{
		for(var i=0; i<str.length; i++) {
			var c = escape(str.charAt(i));
			if(c.length == 1){//湲곕낯 �꾩뒪�ㅼ퐫��
				result.byte++;
			}else if(c.indexOf("%u") != -1){//�쒓� �뱀� 湲고�
				result.byte+=2;
			}else{
				result.byte++;
			}
			if(result.byte<=limit){
				result.limit++;
			}
		}
	}
	return result
}
}());


(function(w, d, $){
	// 1:1 臾몄쓽 Start
	// <tag open-email-pop></tag>
	COMM_CONECTS_TUTOR.on('click', '[open-email-pop]', function(e){
		e.preventDefault();
		$.ajax({
			url: "/customer/main/open_email_pop"
			,type: 'POST'
			,data: {}
			,success: function(data) { //�묐떟寃곌낵瑜� 肉뚮젮以���.
				//�� �앹꽦 �ㅽ겕由쏀듃 ex)pop_full_layer_open(el:�앹뾽ID,ml:而⑦뀗痢좏�耳밒D,width:940px/500px,height:700px/auto,scroll:yes/no)
				pop_full_layer_create('open_email_pop','open_email_pop_layer','600px','auto','no');
				$('#open_email_pop_layer').html(data);
				pop_full_layer_open('open_email_pop'); ////�� �대깽�� �ㅽ겕由쏀듃
			}
			,error: function(result) { //�먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
				alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
			}
		});
	});
	// 1:1 臾몄쓽 End

	// 二쇱냼 蹂듭궗 Start
	// <tag conects-copy-url data-host="蹂듭궗�� HOST, 鍮꾩뼱�덉쑝硫� �꾩옱 HOST濡� �ㅼ젙" data-uri="蹂듭궗�� URI, 鍮꾩뼱�덉쑝硫� �꾩옱 URI濡� �ㅼ젙"></tag>
	COMM_CONECTS_TUTOR.on('click', '[conects-copy-url]', function(e){
		e.preventDefault();
		var	$this = $(this),
			uri = $this.attr('data-uri') || $(location).attr('pathname'),
			host = 0 <= uri.indexOf('//') && uri.indexOf('//') <= 6 ? '' : location.protocol + '//' + location.host,
			url = host + uri;
		if((function(nav){
			if(nav.indexOf("chrome") != -1) return false;
			if(nav.indexOf("msie") != -1) return true;
			if(nav.indexOf("windows nt") != -1) return true;
			return false;
		}(navigator.userAgent.toLowerCase()))) {
			if(window.clipboardData.setData("Text", url)){
				alert("URL�� 蹂듭궗�섏뿀�듬땲��. \n寃뚯떆�먯씠�� 硫붿떊���먯꽌 遺숈씠湲� (Ctrl + V) �대낫�몄슂.");
				return;
			}
		}
		prompt("�� 湲��� 二쇱냼�낅땲��. \nCtrl + C 瑜� �뚮윭 �대┰蹂대뱶濡� 蹂듭궗�섏꽭��", url);

		return false;
	});
	// 二쇱냼 蹂듭궗 End

	// �좉퀬�섍린 Start
	// <tag conects-report data-user-cd="user_cd" data-user-id="user_id"></tag>
	COMM_CONECTS_TUTOR.on('click', '[conects-report]', function(e){
		e.preventDefault();
		var	$this = $(this)
			,sendData = {
				'teacher_cd' 	: $this.attr('data-user-cd'),
				'teacher_id' 	: $this.attr('data-user-id')
			}
			,ajaxData = {
				type 	 : 'POST',
				url  	 : '/class/main/teacher_report_form',
				data 	 : sendData,
				dataType : 'HTML',
				async	 : true,
				success	 : function(response){
					pop_full_layer_create('tutor_report_form', 'tutor_report_form_pop', '600px', 'auto', 'no');
					$('#tutor_report_form_pop').html(response);
					pop_full_layer_open('tutor_report_form');
				},
				error	 : function(xmlHttpRequest, textStatus, errorThrown){
					try{
						console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
					}catch(e){}
				}
			};

		$.ajax(ajaxData);
	});
	// �좉퀬�섍린 End

	// �쒗꽣�� �붿껌�섍린 Start
	// <tag tutor-talk data-user-cd="user_cd"></tag>
	COMM_CONECTS_TUTOR.on('click', '[tutor-talk]', function(e){
		e.preventDefault();
		var	$this = $(this)
			,user_cd = $this.attr('data-to-user')
			,ajaxData = {
				type 	 : 'POST',
				url  	 : '/addon/gawetalk/post/chats/'+user_cd,
				data 	 : {},
				dataType : 'json',
				async	 : true,
				success	 : function(response){
					switch(response.status){
						case 200:
							window.open('/addon/gawetalk/open/chat/room/pop/?chat_id='+response.moreInfo.chat_id,'�쒗꽣��','width=410, height=640, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
							break;
						default:
							if(response.userMsg){
								alert(response.userMsg);
							}
					}
				},
				error	 : function(xmlHttpRequest, textStatus, errorThrown){
					try{
						console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
					}catch(e){}
				}
			};

		$.ajax(ajaxData);

		return false;
	});
	// �쒗꽣�� �붿껌�섍린 End

	// �숈깮 <=> �좎깮�� 紐⑤뱶 蹂�寃쏀븯湲� Start
	// <tag conects-mode-switch data-mode="change mode value"></tag>
	COMM_CONECTS_TUTOR.on('click', '[conects-mode-switch]', function(e){
		e.preventDefault();
		var	$this = $(this),
			mode = $this.attr('data-mode'),
			msg = false;

		switch(mode){
			case 'student':
				msg = '�숈깮�뚯썝�쇰줈 �꾪솚�섏떆寃좎뒿�덇퉴?\n\n�뺤씤 �� �숈깮 紐⑤뱶濡� �꾪솚�⑸땲�� :D';
				break;
			case 'tutor':
				msg = '�쒗꽣�뚯썝�쇰줈 �꾪솚�섏떆寃좎뒿�덇퉴?\n\n�뺤씤 �� �쒗꽣 紐⑤뱶濡� �꾪솚�⑸땲�� :D';
				break;
		}
		if(msg && confirm(msg)){
			$.ajax({
				type 	 : 'POST',
				url  	 : '/mypage/mypage_common/mode/'+mode,
				data 	 : {},
				dataType : 'json',
				async	 : true,
				success	 : function(response){
					if(response.userMsg){
						alert(response.userMsg);
					}
					switch(response.status){
						case 200:
							if(response.redirectURL){
								location.replace(response.redirectURL);
							}
							break;
					}
				},
				error	 : function(xmlHttpRequest, textStatus, errorThrown){
					try{
						console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
					}catch(e){}
				}
			});
		}else{
			return false;
		}
	});
	// �숈깮 <=> �좎깮�� 紐⑤뱶 蹂�寃쏀븯湲� End

	// 寃��� 紐⑤뱶 �ㅼ젙 Start
	// <tag conects-search-mode data-toggle="active" data-type="class"></tag>
	COMM_CONECTS_TUTOR.on('click', '[conects-search-mode]', function(e){
		e.preventDefault();
		var	$this = $(this),
			$target = $('[conects-search-mode]'),
			onClass = $this.attr('data-toggle');
		$target.removeClass(onClass);
		$this.addClass(onClass);

		return false;
	});
	// 寃��� 紐⑤뱶 �ㅼ젙 End

	// 寃��됲븯湲� �ㅼ젙 Start
	// <tag conects-search-submit></tag>
	COMM_CONECTS_TUTOR.on('click', '[conects-search-submit]', function(e){
		e.preventDefault();
		var	$this = $(this),
			$mode = $('[conects-search-mode]'),
			$data = $('[conects-search-data]'),
			sendData = {},
			queryString = [],
			validate = true,
			uri = '';

		$mode.each(function(idx, attr){
			var $attr = $(attr);
			if($attr.hasClass($attr.attr('data-toggle'))){
				sendData[$attr.attr('data-param')] = $attr.attr('data-type');
				uri = $attr.attr('data-uri');
			}
		});

		$data.each(function(idx, attr){
			var	param = attr.getAttribute('data-param'),
				message = attr.getAttribute('data-alert');
			sendData[param] = attr.value;
			if(attr.getAttribute('required')!==null && !attr.value){
				validate = false;
				if(message){
					alert(message);
					$(attr).focus();
				}
				return false;
			}
		});
		
		for(var i in sendData){
			if(sendData.hasOwnProperty(i)){
				queryString[queryString.length] = i + '=' + sendData[i];
			}
		}

		if(validate){
			location.href = uri + (queryString.length ? '?'+queryString.join('&') : '');
		}

		return false;
	});
	// 寃��됲븯湲� �ㅼ젙 End

	// �꾨줈�꾨낫湲� 踰꾪듉 �ㅼ젙 Start
	// <tag class="profile-view-btn" data-host="蹂대궪 HOST" data-uri="蹂대궪 URI"></tag>
	COMM_CONECTS_TUTOR.on('click', '.profile-view-btn,[conects-redirect]', function(e){
		var	$this = $(this),
			uri = $this.attr('data-uri') || $(location).attr('pathname'),
			host = 0 <= uri.indexOf('//') && uri.indexOf('//') <= 6 ? '' : location.protocol + '//' + location.host,
			url = host + uri;

		if(url){
			switch(this.tagName.toUpperCase()){
				case 'A':
					$this.attr('href', url);
					if(e&&e.stopPropagation){e.stopPropagation()}else{window.event.cancelBubble=true} // return false濡쒕뒗 泥섎━媛� �덈맖
					break;
				default:
					e.preventDefault();
					if(e.ctrlKey){
						var $node = $(document.createElement('a'));
						$node.attr('href', url);
						$node.attr('target', '_blank');
						$node.on('click', function(e){
							var $this = $(this);
							$this.remove();
						});
						$('body').append($node);
						$node = $('a[href="'+url+'"]');
						if($node.length){
							$node[0].click();
						}
					}else{
						location.href = url;
					}
					return false;
			}
		}
	});
	// �꾨줈�꾨낫湲� 踰꾪듉 �ㅼ젙 End

	// 愿��щ벑濡� Start
	// <tag class="interest-btn" data-toggle="active" data-from="student or tutor" data-to="tutor or student" data-user-cd="user-cd-value" data-class-seq="class-seq-value"></tag>
	COMM_CONECTS_TUTOR.on('click', '.interest-btn', function(e){
		var	$this = $(this),
			sendData = {},
			toggle = $this.attr('data-toggle'),
			to = $this.attr('data-to'),
			from = $this.attr('data-from'),
			user_cd = $this.attr('data-user-cd')
			class_seq = $this.attr('data-class-seq');

		switch(to){
			case 'tutor':
				e.preventDefault();

				sendData.class_seq = class_seq;
				sendData.user_cd = user_cd;

				$.ajax({
					type 	 : 'POST',
					url  	 : '/class/main/student_interest',
					data 	 : sendData,
					dataType : 'json',
					async	 : true,
					success	 : function(response){
						switch(response.result){
							case 'SUCCESS':
								$this.addClass(toggle);
								alert('愿��� �깅줉 �꾨즺\n\n�깅줉 �댁뿭�� 留덉씠而ㅻ꽖痢좏뒠�곗뿉�� �뺤씤�섏떎 �� �덉뒿�덈떎.');
								break;

							case 'DELETE_SUCCESS':
								$this.removeClass(toggle);
								alert('愿��щ벑濡앹씠 �댁젣 �섏뿀�듬땲��.');
								break;

							case 'DELETE_FAIL':
								alert('愿��щ벑濡앹씠 �댁젣�� �ㅽ뙣�섏��듬땲��. 愿�由ъ옄�먭쾶 臾몄쓽�섏꽭��.');
								break;

							case 'NOT_MY':
								alert('蹂몄씤�� ���� 愿��щ벑濡앹� 遺덇��ν빀�덈떎.');
								break;

							case 'NOT_LOGIN':
								alert('濡쒓렇�� �꾩뿉 �댁슜 媛��ν빀�덈떎.');
								// location.href = 'https://' + location.host + '/member/login?redirect_url=' + encodeURIComponent(location.protocol + '//' + location.host + location.pathname + location.search);
								break;
						}
					},
					error	 : function(xmlHttpRequest, textStatus, errorThrown){
						try{
							console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
						}catch(e){}
					}
				});
				break;
			case 'student':
				e.preventDefault();
				// student_interest(class_seq, false, user_cd, false);
				break;
		}

		return false;
	});
	// 愿��щ벑濡� End
/*
	// �쒗꽣��(援�) �붿껌�섍린 Start
	COMM_CONECTS_TUTOR.on('click', '.btn-talk', function(e){
		e.preventDefault();

		var	$this = $(this),
			to_user = $this.attr('data-to-user'),
			class_seq = $this.attr('data-class-seq');

		$.ajax({
			type 	 : 'get',
			url  	 : '/addon/gawetalk/get/contact/confirm/check/'+to_user+'/'+class_seq,
			data 	 : {},
			dataType : 'json',
			success  : function(response){
				switch(response.status){
					case 200:
						$.ajax({
							type 	 : 'get',
							url  	 : '/addon/gawetalk/open/contact/confirm/layer/'+to_user+'/'+class_seq,
							data 	 : {},
							dataType : 'html',
							success  : function(response){
								pop_full_layer_create('open_dim_gawetalk_student_pop2','open_dim_gawetalk_student2','600px','auto','no');
								$('#open_dim_gawetalk_student2').html(response);
								pop_full_layer_open('open_dim_gawetalk_student_pop2'); ////�� �대깽�� �ㅽ겕由쏀듃
							},
							error	 : function(xmlHttpRequest, textStatus, errorThrown){
								console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
								return;
							}
						});
						break;
					case 401:
						$(location).attr('href', 'https://'+$(location).attr('host')+'/member/login?redirect_url='+encodeURIComponent('http://'+$(location).attr('host')+'/student/main'+$(location).attr('search')));
						break;
					default:
						response.userMsg = response.userMsg || '�숈깮留� �쒗꽣�먭쾶 �쒗꽣�� �붿껌 媛��ν빀�덈떎.';
						alert(response.userMsg);
						break;
				}
			},
			error	 : function(xmlHttpRequest, textStatus, errorThrown){
				console.log(xmlHttpRequest + ", " + textStatus + " , " + errorThrown);
				return;
			}
		});

		return false;
	});
	// �쒗꽣��(援�) �붿껌�섍린 End
*/
	// �덉씠�� �꾩슦湲� Start
	// <tag conects-open-layer data-selector="user_cd"></tag>
	COMM_CONECTS_TUTOR.on('click', '[conects-layer]', function(e){
		e.preventDefault();

		var	$this = $(this),
			selector = $this.attr('data-selector'),
			action = $this.attr('data-action'),
			animation = $this.attr('data-animation');

		switch(action){
			case 'open':
				$(selector).show();
				break;
			case 'close':
				$(selector).hide();
				break;
		}

		return false;
	});
	// �덉씠�� �꾩슦湲� End

	// 湲��먯닔 泥댄겕 Start
	COMM_CONECTS_TUTOR.on('keyup', '[conects-length-check]', function(e){
		var	$this = $(this),
			$show = $($this.attr('data-show')),
			lengthCheck;

		switch($this.attr('data-type')){
			case 'byte':
				var lengthLimit = parseInt($this.attr('data-size'));
				lengthCheck = COMM_CONECTS_TUTOR.fn.byteCheck(this.value, lengthLimit);
				if(lengthLimit < lengthCheck.byte){
					alert($this.attr('data-alert'));
					this.value = this.value.substr(0, lengthCheck.limit);
					lengthCheck = COMM_CONECTS_TUTOR.fn.byteCheck(this.value, lengthLimit);
				}
				if($show.length){
					$show.html(lengthCheck.byte);
				}
				break;

			case 'length':
				lengthCheck = parseInt($this.attr('data-size'));
				if(this.value.length > lengthCheck){
					alert($this.attr('data-alert'));
					this.value = this.value.substr(0, lengthCheck);
				}
				if($show.length){
					$show.html(this.value.length);
				}
				break;
		}
	});
	// 湲��먯닔 泥댄겕 End

	// �댁슜 蹂�寃쎌떆耳쒖＜湲� Start
	// COMM_CONECTS_TUTOR.applies('[applies-replace]', function(){
	// 	var	$this = $(this),
	// 		html = $this.html();
	// 		convertObject = COMM_CONECTS_TUTOR.fn.stringToObj(this.getAttribute('applies-replace'));
	// 	for(var i in convertObject){
	// 		if(convertObject.hasOwnProperty(i)){
	// 			html = html.replace(new RegExp('{#'+i+'}', 'ig'), decodeURIComponent(convertObject[i]).replace(/"/ig, '&quot;').replace(/</ig, '&lt;').replace(/\n/ig, '<br>'));
	// 		}
	// 	}
	// 	$this.html(html);
	// });
	// �댁슜 蹂�寃쎌떆耳쒖＜湲� End

	// �レ옄 移댁슫�� Start
	// <tag conects-animate-number data-time="5000" data-delay="10" data-min="1000" data-max="6000">1000</tag>
	COMM_CONECTS_TUTOR.applies('[conects-animate-number]', function(){
		var	$this = $(this),
			config = {
				interval: false,
				time: parseInt($this.attr('data-time')),
				delay: parseInt($this.attr('data-delay')),
				min: parseInt($this.attr('data-min')),
				max: parseInt($this.attr('data-max')),
				timestamp: false
			};
		config.term = config.max - config.min;

		config.interval = setInterval(function(){
			config.timestamp = config.timestamp ? config.timestamp : (function(d){return d.getTime()}(new Date()));

			var d = new Date(),
				term = Math.floor(config.term / config.time * (d.getTime() - config.timestamp));
			config.view = config.min + term;
			if(config.view >= config.max){
				clearInterval(config.interval);
				config.view = config.max;
			}

			$this.html(parseInt(config.view).format());
		}, config.delay);
	});
	// �レ옄 移댁슫�� End

	// bxSlider Start
	// <tag conects-bxslider="uniq id" data-bx-auto="true or false" data-bx-controls="true or false"></tag>
	// <tag conects-bxslider-reload data-target="uniq id"></tag>
	COMM_CONECTS_TUTOR.applies('[conects-bxslider]', function(){
		var	$this = $(this),
			selector = false,
			config = {
				auto: false
				,controls: false
				,slideWidth: false
				,minSlides: false
				,maxSlides: false
				,moveSlides: false
				,slideMargin: false
				,pager: false
			};
		for(var i in config){
			if(config.hasOwnProperty(i)){
				selector = 'data-bx-'+i;
				if($this.attr(selector)){
					switch($this.attr(selector)){
						case 'true':
							config[i] = true;
							break;
						case 'false':
							config[i] = false;
							break;
						default:
							config[i] = $this.attr(selector);
							config[i] = isNaN(config[i]) ? config[i] : parseInt(config[i]);
							break;
					}
				}else{
					delete(config[i]);
					continue;
				}
			}
		}
		if(!this.bxSlider){
			this.bxSlider = $this.bxSlider(config);
		}
	});
	COMM_CONECTS_TUTOR.on('click', '[conects-bxslider-reload]', function(e){
		var	$this = $(this),
			$target = $('[conects-bxslider="'+$this.attr('data-target')+'"]');

		$target.each(function(idx, attr){
			// attr.bxSlider.redrawSlider();
			((attr.bxSlider && attr.bxSlider.reloadSlider) || function(){})();
			setTimeout(function(){
				((attr.bxSlider && attr.bxSlider.reloadSlider) || function(){})();
			}, 100);
		});
	});
	// bxSlider End

	// �좉퀬�섍린 Start
	// <tag conects-report data-type="student" data-target-cd="target_cd" data-target-id="target_id" data-desc="selector"></tag>
	COMM_CONECTS_TUTOR.on('click', '[conects-report]', function(e){
		e.preventDefault();

		var	$this = $(this);

		switch($this.attr('data-type')){
			case 'student':
				$.ajax({
					 url : "/class/main/open_dim_review_report"
					,type : 'POST'
					,data : {
						stdt_user_cd : $this.attr('data-target-cd'),
						stdt_user_id : $this.attr('data-target-id'),
						review_desc : $($this.attr('data-desc')).html()
					}
					,success : function(data) { // �묐떟寃곌낵瑜� 肉뚮젮以���.
						pop_full_layer_create('open_dim_review_report_all','open_dim_review_report_layer_all','600px','auto','no');
						$('#open_dim_review_report_layer_all').html(data);
						pop_full_layer_open('open_dim_review_report_all'); // �� �대깽�� �ㅽ겕由쏀듃
					}
					,error : function(result) { // �먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
						alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
					}
				});
				break;

			case 'tutor':
				$.ajax({
					 url : "/class/main/teacher_report_form"
					,type : 'POST'
					,data : {
						teacher_cd : $this.attr('data-target-cd'),
						teacher_id : $this.attr('data-target-id')
					}
					,success : function(data) { // �묐떟寃곌낵瑜� 肉뚮젮以���.
						pop_full_layer_create('open_dim_review_report_all','open_dim_review_report_layer_all','600px','auto','no');
						$('#open_dim_review_report_layer_all').html(data);
						pop_full_layer_open('open_dim_review_report_all'); // �� �대깽�� �ㅽ겕由쏀듃
					}
					,error : function(result) { // �먮윭�� alert 李쎌쑝濡� �먮윭 �뚮┝
						alert("�몄텧�� �ㅽ뙣�덉뒿�덈떎. \n�좎떆 �� �ㅼ떆 �쒕룄�댁＜�몄슂.");
					}
				});
				break;
		}
	});
	// �좉퀬�섍린 End

	$(d).ready(function(){
		COMM_CONECTS_TUTOR.init();
	});
}(window, document, jQuery));

Number.prototype.format = function(){if(this==0)return 0;var reg=/(^[+-]?\d+)(\d{3})/,n=(this+'');while(reg.test(n)){n=n.replace(reg,'$1'+','+'$2')};return n};