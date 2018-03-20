/********* btn **********/
/* btn img box style script*/
function btnimgBox($o){
	var $slct = $o;
	$slct.find('.btn_e').on("click",function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
		}else{
			$(this).addClass('on');
		}
	});
}

/* btn text box style script*/
function btntxtBox($o){
	var $slct = $o;
	$slct.find('.btn_e').on("click",function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
			$(this).find('.ff').css({'display':'block'})
			$(this).find('.n').css({'display':'none'})
		}else{
			$(this).addClass('on');
			$(this).find('.ff').css({'display':'none'})
			$(this).find('.n').css({'display':'block'})
		}
	});
}


/********** checkbox **********/
/*check box style script*/
function checkBox($o){
	var $slct = $o;
	$slct.on("click", ".checkbox, .radiobox", function(){
		//radiobox
		if($(this).hasClass('radiobox')){
			$(this).each(function(){
				$(this).find('input[type=radio]').prop('checked', true);
				$(this).addClass('on').siblings().removeClass('on');
			})
		}
		//checkbox
		if($(this).hasClass('checkbox')){
			$(this).each(function(index){
				var has_class = $(this).hasClass('on');
				var inpt_chk = $(this).find('input').prop('checked');
				if(inpt_chk){
					$(this).addClass('on');
				}else{
					$(this).removeClass('on');
				}
			});
		}
	});
}

/********** selectbox **********/
/*select box style script*/
function selectBox($o, value){
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

/*���됲듃諛뺤뒪 �ㅽ겕由쏀듃濡� 蹂�寃쏀븿��*/
function selectChange(_id,_value){
	var $slct = $('#'+_id);
	var $opt = $slct.children('option');
	var $opt_arr= new Array();
	var _idx;
	var $slct_txt;
	for(i=0;i<$opt.length;i++){
		$opt_arr[i] = $slct.find('option:eq('+i+')').val();
		$slct.find('option:eq('+i+')').prop('selected', false);
		//console.log($opt_arr[1].val())
		if($opt_arr[i] == _value){
			_idx = i;
			$slct.find('option:eq('+i+')').prop('selected',true);
			$slct_txt = $slct.find('option:eq('+i+')').text();
			$slct.next('.selected').find('.txt').html($slct_txt)
			$slct.change();
			break;
		}
	}
}

/*********************************************************************
//�⑥닔紐�    : selectChange_Text
//�⑥닔�ㅻ챸  : ���됰컯�� 媛뺤젣 �낅젰_ Text�� (�⑥닔�� �ㅽ뻾��)
//�앹꽦��    : �댁듅��
//�앹꽦��    : 2016-05-13
*********************************************************************/
function selectChange_Text(_id,_value){
	var $slct = $('#'+_id);
	var $opt = $slct.children('option');
	var $opt_arr= new Array();
	var _idx;
	var $slct_txt;
	for(i=0;i<$opt.length;i++){
		$opt_arr[i] = $slct.find('option:eq('+i+')').text();
		$slct.find('option:eq('+i+')').prop('selected', false);
		//console.log($opt_arr[1].val())
		if($opt_arr[i] == _value){
			_idx = i;
			$slct.find('option:eq('+i+')').prop('selected',true);
			$slct.change();
			break;
		}
	}
}



/* textarea resizing */
function resizeTxtarea($o){
	$o.each(function(){
		$(this).css('height','1px');
		$(this).css('height',$(this).prop('scrollHeight'));
		$(this).css('overflow','hidden');
		$(this).css('resize','none');
	});
}

/********** tabmenu **********/
/*��찓�� �대┃�대깽��*/
function tabBox(_this){
	var temp = _this;
	var $div = _this.closest('.form_tab_jq'); //�붿냼�묎렐��耳�
	var $cls; //硫붾돱�쒖꽦�뷀겢�섏뒪;
	var $li; //硫붾돱�대옒��;
	temp.find('>li>a').on('click',function(){
		$cls = $(this).attr('class');
		$li = temp.find("."+$cls).parent();
		/* 怨듯넻 */
		$li.siblings("li").removeClass("on");
		$li.addClass("on");
		if($div.find('.tab_list_bx').hasClass('tab_con_dsply')){
			$div.find(".tab_con_bx").hide();
			$div.find(".tab_con_"+$cls).show();
		}
		return false;
	});
}

/*��찓�� 珥덇린 �� �ㅽ뻾*/
function tabBox_dsply(_this,_cls){
	var temp = _this;
	var $div = _this.closest('.form_tab_jq'); //�붿냼�묎렐��耳�
	var $cls; //硫붾돱�쒖꽦�뷀겢�섏뒪;
	var $li; //硫붾돱�대옒��;
	if(_cls){ //硫붾돱�쒖꽦�뷀겢�섏뒪 媛믪엳�꾩떆 �ㅽ뻾
		$cls = _cls;
		$li = temp.find("."+$cls).parent();
		/* 怨듯넻 */
		$li.siblings("li").removeClass("on");
		$li.addClass("on");
		if($div.find('.tab_list_bx').hasClass('tab_con_dsply')){
			$div.find(".tab_con_bx").hide();
			$div.find(".tab_con_"+$cls).show();
		}
		return false;
	}
}

/********** mouseevent **********/
var icon_checkBoxMsg = {
	/*Teaching Style*/
	humor: {//�좊㉧�ъ뒪��
		text: '議몃┫ �덉씠 �놁씠 �섏뾽��<br/>�щ��덇쾶 吏꾪뻾�댁슂.',
		color: '#e1b75d'
	},
	creative: {//李쎌쓽�곸씤
		text: '���� �쎈ℓ�댁� �딅뒗 �됰떎瑜�<br/>�섏뾽諛⑹떇�� 吏��ν빐��.',
		color: '#e1b75d'
	},
	attentive: {//�먯긽��
		text: '李ъ갔�� �몄꽭�섍쾶<br/>�숈깮�� �뚮큶�덈떎.',
		color: '#cf6e88'
	},
	sparta: {//�ㅽ뙆瑜댄�
		text: '�깆랬�⑥쓣 �믪씪 �� �덈룄濡�<br/>�꾧꺽�섍쾶 �섏뾽�댁슂.',
		color: '#cf6e88'
	},
	responsible: {//梨낆엫媛먯엳��
		text: '�� 踰� 留≪� 寃껋� �앷퉴吏�.<br/>留뚯”�� �뚭퉴吏�!',
		color: '#9698c2'
	},
	free: {//�먯쑀濡쒖슫
		text: '�듯넻�깆엳怨� �좎뿰��</br>�섏뾽 諛⑹떇�� 吏��ν빐��.',
		color: '#e1b75d'
	},
	strict: {//�꾧꺽��
		text: '�꾪븯怨� 泥좎��섍쾶<br/>留덉쓬�� �≪븘以띾땲��.',
		color: '#9698c2'
	},
	earnest: {//�깆떎��
		text: '�섏뾽愿�由ъ� �쒓컙愿�由ъ뿉<br/>遺�吏��고빐��',
		color: '#9698c2'
	},
	global: {//湲�濡쒕쾶��
		text: '�ㅼ뼇�� 湲�濡쒕쾶 寃쏀뿕��<br/>�숈깮�먭쾶�� �꾪빐以섏슂.',
		color: '#e1b75d'
	},
	systematic: {//泥닿퀎�곸씤
		text: '泥좎��� 怨꾪쉷�쇰줈<br/>�� 吏쒖뿬吏� �섏뾽�� �댁슂.',
		color: '#9698c2'
	},
	active: {//�곴레�곸씤
		text: '�꾩쟾�섍퀬 �쒕룄�섎뒗,<br/>�댁젙�곸씤 �섏뾽.',
		color: '#cf6e88'
	},
	basically: {//�먯튃�곸씤
		text: '吏��� 寃껋� 吏��ㅻ뒗<br/>�쒗꽣.',
		color: '#9698c2'
	},
	sense: {//�쇱뒪�덈뒗
		text: '泥� �섎㈃ 泥�! �뚯븘��<br/>�� 梨숆꺼�쒕젮��.',
		color: '#e1b75d'
	},
	serious: {//吏꾩���
		text: '�λ궃�� 湲덈Ъ.<br/>�섏뾽�먮쭔 吏묒쨷�댁슂.',
		color: '#9698c2'
	},
	/*Special Feature*/
	demonstration: {//�쒕쾾 �섏뾽
		text: '�쒕쾾 �섏뾽 諛쏆� ��<br/>寃곗젙�대룄 醫뗭븘��.',
		color: '#64399d'
	},
	english: {//�곸뼱濡� �섏뾽
		text: '泥섏쓬遺��� �앷퉴吏� �곸뼱濡�<br/>媛�瑜댁튌 �� �덉뼱��.',
		color: '#64399d'
	},
	cafe: {//移댄럹 �섏뾽 媛���
		text: '�μ냼媛� 留덈븙移� �딅떎硫�<br/>移댄럹�먯꽌�� OK',
		color: '#64399d'
	},
	media: {//誘몃뵒�� �쒖슜
		text: '怨듬�媛� 吏�猷⑦븯吏� �딄쾶<br/>�곹솕�� �쒕씪留� �쒖슜',
		color: '#64399d'
	},
	rapsession: {//洹몃９/�좊줎 �섏뾽
		text: '�쒕줈 �먭레�� �섏뼱二쇨퀬<br/>而ㅻ��덉��댁뀡 �λ젰��<br/>湲몃윭以� �섏뾽',
		color: '#64399d'
	},
	textbook: {//�밸퀎援먯옱 �쒖슜
		text: '�쒗꽣留뚯쓽 �밸퀎��<br/>援먯옱濡� �섏뾽�댁슂.',
		color: '#64399d'
	},
	paper: {//�뺢린由ы룷��
		text: '�섏뾽�� ���� 寃곌낵�� �뚭컧��<br/>�뺢린�곸쑝濡� �뚮젮�쒕젮��.',
		color: '#64399d'
	},
	dailytest: {//�쇱씪 �뚯뒪��
		text: '留ㅼ씪留덈떎 �뚯뒪�몃줈<br/>�ㅻ젰 �μ긽�� �뺤씤�댁슂.',
		color: '#64399d'
	}
}
/*img input checkbox style script*/
function icon_inp_checkBox($o){
	var $slct = $o;

	$slct.find(".chk_bx_icon_inp").each(function(){
		$(this).append('<span class="info"></span>');
		var data_key = $(this).attr('data-key');
		$(this).find('.info').html('');
		$(this).find('.info').html(icon_checkBoxMsg[data_key].text);
	});

	$slct.on("click", ".chk_bx_icon_inp", function(){
		$(this).each(function(index){
			var has_class = $(this).hasClass('on');
			var inpt_chk = $(this).find('input').prop('checked');
			if(inpt_chk){
				$(this).addClass('on');
				// $(this).append('<span class="info"></span>');
				// var data_key = $(this).attr('data-key');
				// $(this).find('.info').html('');
				// $(this).find('.info').html(icon_checkBoxMsg[data_key].text);
				//$(this).closest('.chk_bx_icon_inp').siblings().find('.info').remove();
			}else{
				$(this).removeClass('on');
				//$(this).find('.info').remove();
			}
		});
	});

	$slct.on("mouseenter", ".chk_bx_icon_inp", function(){
		$(this).each(function(index){
			$(this).addClass('mover');
		});

		$slct.on("mouseleave", ".chk_bx_icon_inp", function(){
			$(this).removeClass('mover');
		});
	})
}

/*mouseevent style script*/
function icon_checkBox($o){
	var $slct = $o;
	$class = $slct.find('.chk_bx_inp');
	$class.each(function(index){
		$(this).bind("mouseenter",function(){
			$rgb = $(this).find('.txt').css("color");
			$(this).addClass('on');
			$(this).append('<span class="info"></span>');
			var data_key = $(this).attr('data-key');
			$(this).find('.info').html('');
			$(this).find('.info').css({'background-color':icon_checkBoxMsg[data_key].color}).html(icon_checkBoxMsg[data_key].text);
			$(this).find('.txt').css({'color':icon_checkBoxMsg[data_key].color});
		}).bind("mouseleave",function(){
			$(this).find('.txt').css({'color':$rgb});
			$(this).removeClass('on');
			$(this).find('.info').remove();
		})
	});
}

function ico_star_rate($o){
	var f_num = 0;
	var s_num = 0;
	var $rate = $o.find('.rate');
	var $inpt = $o.find('.inpt');
	var $radiobox = $o.find('.radiobox');
	var chk_idx = 0;

	$radiobox.each(function(){
		if($(this).find('input').prop('checked')){
			s_num = $(this).index() * 10 + 10;
		}
	});

	if($radiobox.length>0){
		$radiobox.mouseenter(function(){
			var idx = $(this).index();

			f_num = 10*idx+10;
			$rate.css('width', f_num+'%');

			$(this).mouseleave(function(){
				$rate.css('width', s_num+'%');
			});
		});

		$radiobox.click(function(){
			var idx = $(this).index();

			s_num = f_num;
			$rate.css('width', s_num+'%');

			// 媛� 泥댄겕
			// $o.find('input[type=radio]').each(function(){
			// 	console.log($(this).parents('.radiobox').index() + ':' + $(this).prop('checked'));
			// });
		});
	}
}

/**********  **********/
/*�쒕옒洹� �섏튂 吏��뺥븯湲�*/
function dragBar($o){
	var temp = $o.find('.wrap_bar'); 
	var stt = temp.find('.start'); //理쒖냼媛� �붿냼
	var lst = temp.find('.last'); //理쒕�媛� �붿냼
	var posX = 0; //�쒖옉�� x
	var posY = 0; //�쒖옉�� y
	var isDown = false; //留덉슦�� �곹깭
	var barW = parseInt(temp.width()); //諛� �볦씠
	var maxN = 200; //理쒕�媛�(留뚯썝) ************** �좊룞�� **************
	var itvl = 5; // 媛꾧꺽(留뚯썝) ************** �좊룞�� **************
	var cntN = parseInt(maxN/itvl);
	var crti_stt = 0; //理쒖냼媛� �꾩옱 i媛�
	var crtN_stt = 0; //理쒖냼媛� �꾩옱 湲덉븸 
	var crtP_stt = 0; //理쒖냼媛� �꾩옱 width
	var crti_lst = cntN; //理쒕�媛� �꾩옱 i媛�
	var crtN_lst = maxN; //理쒕�媛� �꾩옱 湲덉븸
	var crtP_lst = barW; //理쒕�媛� �꾩옱 width
	var posArr = new Array(); //�꾩튂媛� �댁쨷諛곗뿴[湲덉븸,width]
	for(i=0; i<=cntN; i++){
		posArr[i] = new Array();	
		posArr[i] = [itvl*i,Math.round(barW/cntN*i)];
	}
	stt.bind('mousedown',function(e){
		posX = temp.offset().left; //�쒖옉�� ����
		posY = temp.offset().top; //�쒖옉�� ����
		isDown = true;
		mDrag($(this),e,'stt');
		mUp($(this),e,'stt');
	});
	lst.bind('mousedown',function(e){ 
		posX = temp.offset().left; //�쒖옉�� ����
		posY = temp.offset().top; //�쒖옉�� ����
		isDown = true;
		mDrag($(this),e,'lst');
		mUp($(this),e,'lst');
	});
	function mDrag(element,e,target) {
		$(document).bind('mousemove',function(e){
			if(isDown){
				if(!e) e=window.event; 
				x = e.pageX - posX;
				y = e.pageY - posY;				
				switch (target){
					case 'stt' :
					for(i=0; i<=cntN; i++){
						if(posArr[i][1] >= x && i < crti_lst ){
							crti_stt = i
							crtN_stt = posArr[crti_stt][0];
							crtP_stt = posArr[crti_stt][1];
							element.find('.txt').html(crtN_stt+'留뚯썝');
							element.css({'width':crtP_stt,'top':0});
						break;
						}
					}
					break;
					case 'lst' :
					for(i=0; i<=cntN; i++){
						if(posArr[i][1] >= x && i > crti_stt){
							crti_lst = i
							crtN_lst = posArr[crti_lst][0];
							crtP_lst  = posArr[crti_lst][1];
							element.find('.txt').html(crtN_lst+'留뚯썝');
							element.css({'width':crtP_lst,'top':0});
							break;
						}
					}
				}
			}
		});
	}
	function mUp(element,e) {
		$(document).bind('mouseup',function(e){ 
			isDown = false;
			$(document).unbind('mousemove');
			$(document).unbind('mouseup');
		})
	}
	//珥덇린媛�(媛믩��낅�遺꾩� 李⑦썑)
	crtN_lst = posArr[crti_lst][0];
	lst.find('.txt').html(crtN_lst+'留뚯썝');
	lst.css({'width':crtP_lst,'top':0});
}
$(document).ready(function(){
	var temp = $('.wrap_bar_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.each(function(){
			dragBar($(this));
		});
	}
})
/**********  **********/


/**********  *********/

//�뱀젙�꾩씠�� �섏쐞濡� ���됲듃諛뺤뒪 �붿옄�� �곸슜 selectBox(select box) 
function selectBox_ajax(_id){
	var temp = $('#'+_id);
	temp.find(".slt_bx").each(function(){
		selectBox($(this));
	});
	temp.find(".slt_srt_bx").each(function(){
		selectBox($(this));
	});
	temp.find(".slt_list_bx").each(function(){
		selectBox($(this));
	});
	temp.find(".slt_wide_bx").each(function(){
		selectBox($(this));
	});
}

function after_ajax(_id) { //�붿옄�� �곸슜
	var root;
	if(_id){
		root = $('#'+_id)
	}else{
		root = $('body')
	}
	//scrollbar(text field) �ㅽ뻾�⑥닔
	var temp = root.find('.form_scrollbar_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".scrollbar_outer").each(function(){
			$(this).scrollbar();
		})
	}

	//btnimgBox(Function Button) �ㅽ뻾�⑥닔
	var temp = root.find('.btn_img_bx_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.each(function(){
			btnimgBox($(this));
		});
	}
	//btntxtBox(Function Button) �ㅽ뻾�⑥닔
	var temp = root.find('.btn_txt_bx_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.each(function(){
			btntxtBox($(this));
		});
	}
	//checkBox(input check box) �ㅽ뻾�⑥닔
	var temp = root.find('.form_inp_chkbox_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.each(function(){
			checkBox($(this));
		});
	}

	//selectBox(select box) �ㅽ뻾�⑥닔
	var temp = root.find('.form_select_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".slt_bx").each(function(){
			selectBox($(this));
		});
	}


	//selectBox(select sort box) �ㅽ뻾�⑥닔
	var temp = root.find('.form_srt_select_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".slt_srt_bx").each(function(){
			selectBox($(this));
		});
	}


	//selectBox(select list box) �ㅽ뻾�⑥닔
	var temp = root.find('.form_list_select_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".slt_list_bx").each(function(){
			selectBox($(this));
		});
	}

	//selectBox(select widh box) �ㅽ뻾�⑥닔
	var temp = root.find('.form_wide_select_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".slt_wide_bx").each(function(){
			var _this = $(this);
			if(_this.find('select').length){
				selectBox(_this);
			}
		});
	}


	//tabBox(Tab box) �ㅽ뻾�⑥닔
	var temp = root.find('.form_tab_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.find(".tab_list_bx").each(function(){
			tabBox($(this));
		});
	}


	//checkBox(icon_inp_checkBox) �ㅽ뻾�⑥닔
	/*input checkbox style script*/
	var temp = root.find('.icon_inp_chkbox_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.each(function(){
			icon_inp_checkBox($(this));
		});
	}

	//mouseEvent(icon_checkBox) �ㅽ뻾�⑥닔
	/*input checkbox style script*/
	var temp = root.find('.icon_chkbox_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.each(function(){
			icon_checkBox($(this));
		});
	}

	/* 蹂꾩젏 */
	var temp = root.find('.ico_star_rate_jq');
	var temp_len = temp.length;
	if( temp_len > 0 ){
		temp.each(function(){
			ico_star_rate($(this));
		});
	}
}

$(document).ready(function(){
	after_ajax(); //�붿옄�몄엯�덇린
	
	$(".wrap_top_bar .btnClose").click(function(){
		$(this).parent('div').slideUp('slow'); 
		 
	});

	 
});