/*!
 * ST UNITAS DANGI CSS Framework 3.1.0
 * http://qa-pub.dangi.co.kr/dangi-3.0/coding-list.html
 *
 * 理쒖큹 �앹꽦��: UI媛쒕컻��
 * 理쒖쥌 �섏젙��: UI媛쒕컻��
 * �섏젙�댁슜: http://qa-pub.dangi.co.kr/dangi-3.0/
 *
 * 理쒖큹 �앹꽦��: 2017.05.10
 * 理쒖쥌 �섏젙��: 2017.05.
 */

/***** common *****/

/* cookie */
var ST_SET_COOKIE = function(cookie_name, value, days){
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + days);
	// �ㅼ젙 �쇱닔留뚰겮 �꾩옱�쒓컙�� 留뚮즺媛믪쑝濡� 吏���

	var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	document.cookie = cookie_name + '=' + cookie_value;
};
var ST_GET_COOKIE = function(cookie_name){
	var x, y;
	var val = document.cookie.split(';');

	for(var i = 0; i < val.length; i++){
		x = val[i].substr(0, val[i].indexOf('='));
		y = val[i].substr(val[i].indexOf('=') + 1);
		x = x.replace(/^\s+|\s+$/g, ''); // �욊낵 �ㅼ쓽 怨듬갚 �쒓굅�섍린
		if(x == cookie_name){
			return unescape(y); // unescape濡� �붿퐫�� �� 媛� 由ы꽩
		}
	}
};

/* dim */
var ST_DIM = {
    open : function(){
        jQuery('body').append(
			'<div class="st-dim"></div>'
		);
    },
    close : function(){
        jQuery('.st-dim').remove();
    }
};

/* loading */
var ST_LOADING = {
    img : '<img src="//static.conects.com/common/img/st-comm-v3/ajax-loader.gif" alt="濡쒕뵫以�" class="ajax-loader" style="position:absolute;left:50%;top:50%;z-index:10;margin:-27px 0 0 -27px;">',
    loading : function(wrap){
        var _this = this;
        var $wrap = jQuery(wrap);
        var var_wrap = wrap.replace(/\./g,'').replace(/-/gi, '_');
        eval('wrap_' + var_wrap + '=$wrap.css(\'position\')');

        if(eval('wrap_' + var_wrap) == 'static'){
            jQuery(wrap).css('position','relative');
        }

        jQuery(wrap).append(_this.img);
    },
    success : function(wrap){
        var _this = this;
        var var_wrap = wrap.replace(/\./g,'').replace(/-/gi, '_');

        try{
            if(eval('wrap_' + var_wrap) == 'static'){
                jQuery(wrap).css('position','static');
            }

            if(jQuery(wrap).find('.ajax-loader').length){
                jQuery(wrap).find('.ajax-loader').remove();
            }
        }catch(e){
            return false;
        }
    }

};

/* do not copy */
function do_not_copy(){
	document.oncontextmenu=new Function('return false');   // �고겢由�
	document.ondragstart=new Function('return false');       // �쒕옒洹�
	document.onselectstart=new Function('return false');      // �좏깮

	document.addEventListener('keydown', function(e){
		if(e.keyCode == 17 || ( e.keyCode == 17 && e.key.toLowerCase == 'c') )
		{
			// alert("Ctrl 踰꾪듉�� �ъ슜�섏떎 �� �놁뒿�덈떎.");
			e.cancelBubble = true;
			e.returnValue = false;
			return false;
		}
		else if(e.keyCode == 123)
		{
			// alert("F12 踰꾪듉�� �ъ슜�섏떎 �� �놁뒿�덈떎.");
			e.cancelBubble = true;
			e.returnValue = false;
			return false;
		}
		else if(e.metaKey)
		{
			// alert("CMD 踰꾪듉�� �ъ슜�섏떎 �� �놁뒿�덈떎.");
			e.cancelBubble = true;
			e.returnValue = false;
			return false;
		}
	});
}


/***** HEADER *****/

/* conects */
function ST_CONECTS_GNB(){

}
ST_CONECTS_GNB.prototype.init = function(){
	var _this = this;

    try{
		_this.day = serTime;
	}catch(e){
        var today = new Date()
		var year = (today.getFullYear()).toString();
		var month = (today.getMonth()+1).toString();
		var date = (today.getDate()).toString();
		var hour = (today.getHours()).toString();
		if(month.length==1) month = '0' + month;
		if(date.length==1) date = '0' + date;
		if(hour.length==1) hour = '0' + hour;

		_this.day = year + month + date + hour;
	}

	try{
		_this.biz_code = biz_code;
	}catch(e){
		_this.biz_code = '';
	}

	jQuery('.st-conects-v3 .nav-conects').prepend(
		'<a href="//www.conects.com/" class="conects"> 커넥츠 </a>' +
		'<a href="//learning.conects.com/" class="learning"> 러닝 </a>' +
		'<a href="//book.conects.com" class="book"> 북 </a>' +
		'<a href="//tutor.conects.com/" class="tutor"> 튜터</a>'
	);

	jQuery('.util-conects .util').append(
		'<li><a href="//www.conects.com/support" class="link-cs">고객 섬김 센터</a></li>'
	);

	// console.log(this.day);
	this.listener();
};
ST_CONECTS_GNB.prototype.service = function(service){
	this.service_name = service;
	jQuery('.nav-conects .' + this.service_name).addClass('active');
};
ST_CONECTS_GNB.prototype.site = function(site){
	var _this = this;
	var dangi = '';
	var url = '';
	var biz = '';
	var snb = '';
	var support = '';
	
	if(jQuery.isArray(site) == true){
		dangi = site[0];
		url = site[1];
		(site[2]) ? biz = site[2] : biz = site[0];
	}else{
		dangi = site;
		url = '/';
		biz = site;
	}

	function set_bi(){
		// if(jQuery('.st-conects-snb').length != 0){}
		if(jQuery('.st-conects-snb').length == 0){
			jQuery('.st-conects-v3').after(
				'<div class="st-conects-snb"><div>' +
					'<div class="wrap-bi">' +
						'<a href="' + url + '" class="bi ' + dangi + '">' +
							'<img src="//static.conects.com/common/img/bi/' + dangi + '_h_bi.gif" alt="">' +
						'</a>' +
					'</div>' +
				'</div></div>'
			);
		}else{
			jQuery('.st-conects-snb > div').prepend(
				'<div class="wrap-bi">' +
					'<a href="' + url + '" class="bi ' + dangi + '">' +
						'<img src="//static.conects.com/common/img/bi/' + dangi + '_h_bi.gif" alt="">' +
					'</a>' +
				'</div>'
			);
		}
	}

	if(this.service_name == 'conects'){
		set_bi();

		jQuery('.st-conects-snb .wrap-bi').after(
			'<ul class="nav-gnb">' +
				'<li data-on-menu="menu-00">' +
					'<a href="http://gibo.conects.com/ask/index/main" class="depth-01">�꾨Ц媛� LIVE</a>' +
				'</li>' +
				'<li data-on-menu="menu-01">' +
					'<a href="http://gibo.conects.com/event/invite" class="depth-01">�뚯궗�댁뼱��</a>' +
				'</li>' +
				'<li data-on-menu="menu-02">' +
					'<a href="http://gibo.conects.com/" class="depth-01">gibo</a>' +
				'</li>' +
			'</ul>'
		);
	}else if(this.service_name == 'learning'){
		if(dangi != 'LEARNING'){
			this.sub = jQuery.getScript('//static.conects.com/common/js/st-pub-v3/snb/st-snb-' + dangi + '.js', function(data, textStatus, jqxhr){
				if(textStatus == 'success'){
					snb = snb_info[0];
					support = snb_info[1];
					if(jQuery.isArray(site) != true && snb_info[2]) url =  snb_info[2];

					if(jQuery('.st-conects-snb .wrap-bi').length!=0){
						jQuery('.st-conects-snb').remove();
					}
					set_bi();
					jQuery('.st-conects-snb .wrap-bi').append(_this.learning());
					if(jQuery('.nav-util').length == 0){ //�ㅼ뭅�댁뿉��媛� �꾨땺��
						jQuery('.st-conects-snb > div').append(
							'<div class="nav-util">' +
								'<a href="//myclass.dangi.co.kr/myroom_gn/main/main?biz_code=' + biz + '" class="txt">�� 媛뺤쓽��</a>' +
							'</div>'
						);
					}
				}
			});
		}else{
			set_bi();
			jQuery('.st-conects-snb .wrap-bi').append(_this.learning());
		}
		
		jQuery.when(_this.sub).then(function(){
			jQuery('.st-conects-snb .wrap-bi').after(snb);
			_this.support(support);
		});
	}else if(this.service_name == 'cs'){
		jQuery('.st-conects-v3').after(
			'<div class="st-conects-snb"><div>' +
				'<div class="wrap-bi"></div>' +
			'</div></div>'
		);

		jQuery('.st-conects-snb .wrap-bi').html('<a href="//www.conects.com/support" class="bi txt">怨좉컼�ш��쇳꽣</a>');
		jQuery('.st-conects-snb .wrap-bi').after(
			'<ul class="nav-gnb">' +
				'<li>' +
					'<a href="/support/cs" class="depth-01">1:1 臾몄쓽</a>' +
				'</li>' +
				'<li>' +
					'<a href="/support/faq" class="depth-01">�먯＜臾삳뒗 吏덈Ц</a>' +
				'</li>' +
				'<li>' +
					'<a href="/support/notice" class="depth-01">怨듭��ы빆</a>' +
				'</li>' +
				'<li>' +
					'<a href="/support/program" class="depth-01">�꾨줈洹몃옩 �ㅼ튂</a>' +
				'</li>' +
				'<li>' +
					'<a href="/support/dangi_center" class="depth-01">�④린蹂� 怨좉컼�ш��쇳꽣</a>' +
				'</li>' +
				'<li>' +
					'<a href="/support/toceo" class="depth-01">���쒖뿉寃� 諛붾���</a>' +
				'</li>' +
			'</ul>'
		);
	}else if(this.service_name == 'member'){
		jQuery('.st-conects-v3').after(
			'<div class="st-conects-snb"><div>' +
				'<div class="wrap-bi"></div>' +
			'</div></div>'
		);

		jQuery('.st-conects-snb .wrap-bi').html('<a href="https://member.conects.com/member/modify" class="bi txt">�뚯썝�뺣낫</a>');
		jQuery('.st-conects-snb .wrap-bi').after(
			'<ul class="nav-gnb">' +
				'<li data-on-menu="modify">' +
					'<a href="https://member.conects.com/member/modify" class="depth-01">�� �뺣낫 議고쉶쨌�섏젙</a>' +
				'</li>' +
				'<li data-on-menu="activity">' +
					'<a href="https://my.conects.com/mydangi/main/main/index/activity" class="depth-01">CONECTS �쒕룞�댁뿭</a>' +
				'</li>' +
				'<li data-on-menu="course">' +
					'<a href="https://my.conects.com/mydangi/main/main/index/course" class="depth-01">�섍컯�댁뿭</a>' +
				'</li>' +
				'<li data-on-menu="order_delivery">' +
					'<a href="https://my.conects.com/mydangi/main/main/index/order_delivery" class="depth-01">二쇰Ц쨌諛곗넚�댁뿭</a>' +
				'</li>' +
			'</ul>'
		);
	}else if(this.service_name == 'payment'){
		jQuery('.st-conects-v3').after(
			'<div class="st-conects-snb"><div>' +
				'<div class="wrap-bi"></div>' +
			'</div></div>'
		);

		jQuery('.st-conects-snb .wrap-bi').html('<span class="bi txt">�λ컮援щ땲</span>');
		jQuery('.st-conects-snb .wrap-bi').after(
			'<ul class="step-payment">' +
				'<li data-on-menu="menu-00">' +
					'<em class="num">01</em>' +
					'<span class="txt">�λ컮援щ땲</span>' +
				'</li>' +
				'<li data-on-menu="menu-01">' +
					'<em class="num">02</em>' +
					'<span class="txt">寃곗젣�섍린</span>' +
				'</li>' +
				'<li data-on-menu="menu-02">' +
					'<em class="num">03</em>' +
					'<span class="txt">寃곗젣�꾨즺</span>' +
				'</li>' +
			'</ul>'
		);
	}
};
ST_CONECTS_GNB.prototype.on = function(menu){
	var _this = this;

	jQuery.when(_this.sub).then(function(){
		jQuery('[data-on-menu="' + menu + '"]').addClass('on');
	});

	if(this.service_name == 'payment'){
		jQuery('.st-conects-snb .wrap-bi .bi').html(jQuery('[data-on-menu="' + menu + '"]').find('.txt').html());
	}
};
ST_CONECTS_GNB.prototype.menu = function(){
	// console.log(arguments.length);
	// jQuery.when(_this.sub).then(function(){});

	var _this = this;
	var arg = [];

	for(i in arguments){
		arg[i] = arguments[i]
	}

	jQuery.when(_this.sub).then(function(){
		jQuery.each(arg, function(i){
			jQuery.ajax({
				url : arg[i][1],
				success: function(data){
					jQuery('[data-wrap-type="' + arg[i][0] + '"]').append(data);
				}
			});
		})
	});
};
ST_CONECTS_GNB.prototype.support = function(support){
	jQuery('.st-conects-v3 .link-cs').attr('href', support);
};
ST_CONECTS_GNB.prototype.listener = function(){
    var _this = this;

    //
    jQuery(document).on('mouseenter', '.st-conects-v3 .myarea', function(){
		jQuery(this).addClass('active');

		jQuery(this).on('mouseleave', function(){
            jQuery(this).removeClass('active');
		});
	});

	//
	jQuery(document).on('mouseenter', '.artc-total-depth .btn-toggle-depth', function(){
		jQuery(this).parent('.artc-total-depth').addClass('active');

		jQuery(this).parent('.artc-total-depth').on('mouseleave', function(){
			jQuery(this).removeClass('active');
		});
	});

	//
	jQuery(document).on('mouseenter', '.artc-toggle-depth .btn-toggle-depth', function(){
		jQuery(this).parent('.artc-toggle-depth').addClass('active');

		jQuery(this).parent('.artc-toggle-depth').on('mouseleave', function(){
			jQuery(this).removeClass('active');
		});
	});

	//
	jQuery(document).on('mouseenter focus', '.nav-conects-snb .depth-01', function(){
		jQuery('.nav-conects-snb li').each(function(){
			jQuery(this).removeClass('active');
		});

		jQuery(this).parent().addClass('active');
	});

	//
	jQuery(document).on('mouseenter', '.nav-gnb > li', function(){
		jQuery(this).addClass('active');

		jQuery(this).on('mouseleave', function(){
			jQuery(this).removeClass('active');
		});
	});
};
ST_CONECTS_GNB.prototype.selected = function(txt){
    var _this = this;
    
    jQuery.when(_this.sub).then(function(){
        jQuery('.artc-toggle-depth .btn-toggle-depth').text(txt);
    });
};
ST_CONECTS_GNB.prototype.learning = function(){
	var _this = this;

	/* 怨듬Т�먃룹엫�� 諛곕꼫 */
	var banner_gong = ''
	if(this.day < 2018031917) banner_gong += '<a href="http://gong.conects.com/gong/promotion/product/exam/exam_application" alt=""><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_GONG_20.jpg" alt=""></a> '

	/* �댄븰쨌�좏븰 諛곕꼫 */
	var banner_eng = ''
	if(this.day < 2017121724) banner_eng += '<a href="http://3eng.conects.com/3eng/promotion/teaser/main" alt=""><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_3ENG_01.png" alt=""></a>'

	/* 以뫢룰퀬�� 諛곕꼫 */
	var banner_sky = ''
	if(this.day > 2017101300 && this.day <= 2017103124) banner_sky += '<a href="http://book.conects.com/c2c/main3"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_SKYEDU_03.jpg" alt=""></a> '

	var learning = 
			'<div class="artc-total-depth">' +
				'<a href="#" class="btn-toggle-depth">�꾩껜�쒕퉬��</a>' +
				'<div class="nav-conects-snb">' +
					'<ul>' +
						'<li class="total active">' +
							'<a href="http://learning.conects.com/" class="depth-01">' +
								'�꾩껜' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<dl class="wrap">' +
									'<dt><a href="http://www.kidsschole.com/">�좎큹��</a></dt>' +
									'<dd><a href="http://www.kidsschole.com">�ㅼ쫰�ㅼ퐳��</a></dd>' +
									'<dt><a href="http://beauty.conects.com/">酉고떚쨌�쇱씠��</a></dt>' +
									'<dd><a href="http://beauty.conects.com/">酉고떚�대옒��</a></dd>' +
									'<dd><a href="http://www.mbcbeauty.co.kr/" target="_blank">酉고떚�숈썝</a></dd>' +
									'<dt><a href="http://schole.ac">吏곷Т援먯쑁</a></dt>' +
									'<dd><a href="http://schole.ac">Schole</a></dd>' +
								'</dl>' +
								'<dl class="wrap">' +
									'<dt><a href="http://www.skyedu.com/go3/main.asp">以뫢룰퀬��</a></dt>' +
									'<dd><a href="http://www.skyedu.com/skyM/main.asp">' +
										'SKY�밸ぉ' +
									'</a></dd>' +
									'<dd><a href="http://www.skyedu.com/go3/main.asp">' +
										'�ㅼ뭅�댁뿉��' +
									'</a></dd>' +
									'<dd><a href="http://liveacademy.conects.com/">' +
										'�쇱씠釉뚯븘移대뜲誘�@��移섎룞' +
									'</a></dd>' +
									'<dd><a href="http://www.right-way.co.kr/" target="_blank">' +
										'�섏떆而⑥꽕��' +
									'</a></dd>' +
									'<dd><a href="http://nondangi.skyedu.com/main/main.asp" target="_blank">' +
										'�쇱닠' +
									'</a></dd>' +
									'<dd><a href="http://www.princetonreviewprep.com/" target="_blank">' +
										'�꾨┛�ㅽ꽩由щ럭' +
									'</a></dd>' +
									'<dd><a href="http://tpr.dangi.co.kr/" target="_blank">' +
										'�꾨┛�ㅽ꽩由щ럭�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://offeng.conects.com/tpr/satcamp" target="_blank">' +
										'誘멸뎅SAT罹좏봽' +
									'</a></dd>' +
									'<dd><a href="http://academy.skyedu.com/" target="_blank">' +
										'�ㅼ뭅�댁뿉���숈썝' +
									'</a></dd>' +
									'<dd><a href="http://nyj.skyedu.com" target="_blank">' +
										'�⑥뼇二� 湲곗닕�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://shinchon.skyedu.com" target="_blank">' +
										'�좎큿 �숈썝' +
									'</a></dd>' +
									'<dd><a href="http://suwon.skyedu.com" target="_blank">' +
										'�섏썝 �숈썝' +
									'</a></dd>' +
									'<dd><a href="http://gwangju.skyedu.com" target="_blank">' +
										'愿묒＜ �숈썝' +
									'</a></dd>' +
									'<dd><a href="http://swdan.skyedu.com" target="_blank">' +
										'�섏썝 �숈썝(�④낵)' +
									'</a></dd>' +
									'<dd><a href="http://nrjdan.skyedu.com" target="_blank">' +
										'�몃웾吏� �숈썝(�낇븰/�④낵)' +
									'</a></dd>' +
									'<dd><a href="http://summatus.skyedu.com/" target="_blank">' +
										'�⑤쭏�ъ뒪�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://summatus1.skyedu.com" target="_blank">' +
										'媛뺣궓 �섏튂���꾨Ц愿�' +
									'</a></dd>' +
									'<dd><a href="http://gangnam.skyedu.com" target="_blank">' +
										'媛뺣궓 臾멸낵�꾨Ц愿�' +
									'</a></dd>' +
									'<dd><a href="http://art.skyedu.com" target="_blank">' +
										'�좊쫱 �덉껜�μ쟾臾멸�' +
									'</a></dd>' +
								'</dl>' +
								'<dl class="wrap">' +
									'<dt><a href="http://eng.conects.com/">�댄븰쨌�좏븰</a></dt>' +
									'<dd><a href="http://3eng.conects.com/">�몃쭏�� �곸뼱 <span class="ico-new-initials">new</span></a></dd>' +
									'<dd><a href="http://soridream.conects.com/">�곸뼱�뚰솕</a></dd>' +
									'<dd><a href="http://baro.conects.com/">湲곗큹�곸뼱</a></dd>' +
									'<dd><a href="http://eng.conects.com/">�곷떒湲고넗��</a></dd>' +
									'<dd><a href="http://eng.conects.com/toefl">�곷떒湲고넗��</a></dd>' +
									'<dd><a href="http://eng.conects.com/main/toso">�곷떒湲고넗��/�ㅽ뵿</a></dd>' +
									'<dd><a href="http://eng.conects.com/main/teps">�곷떒湲고뀦��</a></dd>' +
									'<dd><a href="http://eng.conects.com/ielts/promotion/ielts_renewal">�곷떒湲곗븘�댁뿕痢�</a></dd>' +
									'<dd><a href="http://china.conects.com/">以묎뎅��</a></dd>' +
									'<dd><a href="http://japan.conects.com/">�쇰낯��</a></dd>' +
									'<dd><a href="http://global.conects.com/">�꾨옉�ㅼ뼱 <span class="ico-new-initials">new</span></a></dd>' +
									'<dd><a href="http://gmat.conects.com/">GRE�④린</a></dd>' +
									'<dd><a href="http://gmat.conects.com/">GMAT�④린</a></dd>' +
									'<dd><a href="http://www.princetonreviewprep.com/" target="_blank">SAT/ACT</a></dd>' +
									'<dd><a href="http://offeng.conects.com/">�곷떒湲곌컯�⑦븰��</a></dd>' +
									'<dd><a href="http://offeng.conects.com/busan">�곷떒湲곕��고븰��</a></dd>' +
									'<dd><a href="http://offeng.conects.com/china">以묐떒湲곌컯�⑦븰��</a></dd>' +
									'<dd><a href="http://offeng.conects.com/busan_china">以묐떒湲곕��고븰��</a></dd>' +
									'<dd><a href="http://directenglish.conects.com/">�먯뼱誘�1:1�뚰솕�숈썝</a></dd>' +
								'</dl>' +
								'<dl class="wrap">' +
									'<dt><a href="http://gong.conects.com/">怨듬Т�먃룹엫��</a></dt>' +
									'<dd><a href="http://gong.conects.com/">怨듬떒湲�</a></dd>' +
									'<dd><a href="http://summatus.conects.com/">9,7湲됲빀寃⑷텒怨듬Т��</a></dd>' +
									'<dd><a href="http://bupgum.conects.com/">踰뺤썝/寃�李�/援먯젙吏�</a></dd>' +
									'<dd><a href="http://gong.conects.com/tax">�몃Т/愿��몄쭅</a></dd>' +
									'<dd><a href="http://gong.conects.com/social">�ы쉶蹂듭�吏�</a></dd>' +
									'<dd><a href="http://gong.conects.com/tech">湲곗닠吏�</a></dd>' +
									'<dd><a href="http://gong-eng.conects.com/">�곸뼱�⑷린珥덉쟾臾�</a></dd>' +
									'<dd><a href="http://gong.conects.com/gun">援곕Т��/遺��ш�</a></dd>' +
									'<dd><a href="http://gyung.conects.com/">寃쎈떒湲�</a></dd>' +
									'<!--<dd><a href="#">寃쎈떒湲곗뒪�뚮Ⅴ��</a></dd>-->' +
									'<dd><a href="http://www.gyungdangipro.com/">寃쎌같�뱀쭊</a></dd>' +
									'<dd><a href="http://gyunggan.conects.com/">寃쎌같媛꾨�</a></dd>' +
									'<dd><a href="http://sobang.conects.com/">�뚮갑怨듬Т��</a></dd>' +
									'<!--<dd><a href="#">�뚮갑�④린�ㅽ뙆瑜댄�</a></dd>-->' +
									'<dd><a href="http://imyong.conects.com/">�꾩슜�④린</a></dd>' +
									'<dd><a href="http://psat.conects.com/">PSAT</a></dd>' +
									'<dd><a href="http://gong.conects.com/gong/main/academy">怨듬떒湲고븰��</a></dd>' +
									'<dd><a href="http://summatus.conects.com/main/offline">' +
										'�⑤쭏�ъ뒪�숈썝(怨듬Т��)' +
									'</a></dd>' +
									'<dd><a href="http://bupgum.conects.com/academy/academy_main">' +
										'踰뺢��④린�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://sobang.conects.com/academy/academy_main/">' +
										'�뚮갑�④린�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://gyung.conects.com/academy/noryangjin/introduce">' +
										'寃쎈떒湲곕끂�됱쭊�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://gyung.conects.com/academy/busan/introduce">' +
										'寃쎈떒湲곕��고븰��' +
									'</a></dd>' +
									'<dd><a href="http://gyung.conects.com/academy/daegu/introduce">' +
										'寃쎈떒湲곕�援ы븰��' +
									'</a></dd>' +
									'<dd><a href="http://gyunggan.conects.com/main/offline">' +
										'寃쎌같媛꾨��숈썝' +
									'</a></dd>' +
									'<dd><a href="http://imyong.conects.com/main/offline">' +
										'�꾩슜�④린�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://www.testb.co.kr/index_main.html" target="_blank">' +
										'��援� 怨듬Т�� �숈썝' +
									'</a></dd>' +
									'<!--<dd><a href="#">怨듬떒湲� �쒗쑕 �낆꽌��</a></dd>-->' +
								'</dl>' +
								'<dl class="wrap">' +
									'<dt><a href="http://ja.conects.com/">痍⑥뾽쨌�ъ랬��</a></dt>' +
									'<dd><a href="http://ja.conects.com/">紐⑤뱺�먭꺽利�</a></dd>' +
									'<dd><a href="http://ja.dangi.co.kr/main/main/category_v2">湲곗궗�먭꺽利�</a></dd>' +
									'<dd><a href="http://ja.dangi.co.kr/main/main/category_v2/9">IT/�쒓뎅��/�쒓뎅��</a></dd>' +
									'<dd><a href="http://public.conects.com/">怨듦린�낅떒湲�</a></dd>' +
									'<dd><a href="http://job.conects.com/">��湲곗뾽痍⑥뾽</a></dd>' +
									// '<dd><a href="http://ja.conects.com/main/main/category/3591">湲곗궗/�곗뾽湲곗궗/湲곕뒫��</a></dd>' +
									// '<dd><a href="http://ja.conects.com/main/main/category/3592">IT�먭꺽利�</a></dd>' +
									// '<dd><a href="http://ja.conects.com/main/main/category/3593">�쒓뎅��/�쒓뎅��/�쒖옄</a></dd>' +
									// '<dd><a href="http://finance.conects.com/">�뚭퀎/寃쎌쁺/寃쎌젣</a></dd>' +
									// '<dd><a href="http://ja.conects.com/main/main/category/3595">留덉���/臾쇰쪟/�쒕퉬��</a></dd>' +
									'<dd><a href="http://gongin.conects.com/">怨듭씤以묎컻��</a></dd>' +
									'<dd><a href="http://gongin.conects.com/main/main_offline">' +
										'怨듭씤�④린�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://ja.conects.com/landing/elec_academy_renewal">' +
										'�먮떒湲� �쒖씪�꾧린�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://public.conects.com/noryangjin/main">' +
										'而ㅻ꽖痢� 怨듦린�낅떒湲� �됱깮援먯쑁��' +
									'</a></dd>' +
								'</dl>' +
								'<dl class="wrap">' +
									'<dt><a href="http://pro.conects.com/">�꾨Ц吏�</a></dt>' +
									'<dd><a href="http://peet.conects.com/">PEET</a></dd>' +
									'<dd><a href="http://md.conects.com/">MEET/DEET</a></dd>' +
									'<dd><a href="http://nomu.conects.com/">�몃Т��</a></dd>' +
									'<dd><a href="http://bupmu.conects.com/">踰뺣Т��</a></dd>' +
									'<dd><a href="http://ca.conects.com/">媛먰룊��</a></dd>' +
									'<dd><a href="http://customs.conects.com/">愿��몄궗</a></dd>' +
									'<dd><a href="http://cpa.conects.com/">�몃Т��</a></dd>' +
									'<dd><a href="http://pro.conects.com/">8���꾨Ц吏�</a></dd>' +
									'<dd><a href="http://peet.conects.com/offmdp/main/main">' +
										'PEET/MD�숈썝' +
									'</a></dd>' +
									'<dd><a href="http://nomu.conects.com/main/offline">' +
										'�몃Т�щ떒湲고븰��' +
									'</a></dd>' +
									'<dd><a href="http://ca.conects.com/main/offline">' +
										'媛먰룊�щ떒湲고븰��' +
									'</a></dd>' +
									'<dd><a href="http://bupmu.conects.com/main/offline">' +
										'踰뺣Т�щ떒湲고븰��' +
									'</a></dd>' +
									'<dd><a href="http://customs.conects.com/main/offline">' +
										'愿��몄궗�④린�숈썝' +
									'</a></dd>' +
								'</dl>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://www.kidsschole.com/" class="depth-01">' +
								'�좎큹��' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list one">' +
										'<ul>' +
											'<li><a href="http://www.kidsschole.com">�ㅼ쫰�ㅼ퐳��</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										'<a href="http://www.kidsschole.com/m/freecollection/collection"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_KIDS.png" alt=""></a>' +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://www.skyedu.com/go3/main.asp" class="depth-01">' +
								'以뫢룰퀬��' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list vertical">' +
										'<ul>' +
											'<li><a href="http://www.skyedu.com/skyM/main.asp">SKY�밸ぉ</a></li>' +
											'<li><a href="http://www.skyedu.com">SKYEDU</a></li>' +
											'<li><a href="http://nondangi.skyedu.com/main/main.asp" target="_blank">�쇰떒湲�</a></li>' +
											'<li><a href="http://www.right-way.co.kr/" target="_blank">諛붾Ⅸ湲�</a></li>' +
											'<li><a href="http://liveacademy.conects.com">而ㅻ꽖痢좊씪�대툕�꾩뭅�곕�</a></li>' +
											'<li><a href="http://www.princetonreviewprep.com/" target="_blank">Princeton Review</a></li>' +
											'<li><a href="http://tpr.dangi.co.kr/" target="_blank">Princeton Review �숈썝</a></li>' +
										'</ul>' +
										'<ul>' +
											'<li><a href="http://academy.skyedu.com/" target="_blank">�ㅼ뭅�댁뿉���숈썝</a></li>' +
											'<li><a href="http://nyj.skyedu.com" target="_blank">�⑥뼇二� �ㅼ뭅�댁뿉�� 湲곗닕�숈썝</a></li>' +
											'<li><a href="http://shinchon.skyedu.com" target="_blank">�좎큿 �ㅼ뭅�댁뿉���숈썝</a></li>' +
											'<li><a href="http://suwon.skyedu.com" target="_blank">�섏썝 �ㅼ뭅�댁뿉���숈썝</a></li>' +
											'<li><a href="http://gwangju.skyedu.com" target="_blank">愿묒＜ �ㅼ뭅�댁뿉���숈썝</a></li>' +
											'<li><a href="http://swdan.skyedu.com" target="_blank">�섏썝 �ㅼ뭅�댁뿉���숈썝(�④낵)</a></li>' +
											'<li><a href="http://nrjdan.skyedu.com" target="_blank">�몃웾吏� �ㅼ뭅�댁뿉���숈썝(�낇븰/�④낵)</a></li>' +
											'<li><a href="http://summatus.skyedu.com/" target="_blank">�⑤쭏�ъ뒪�숈썝</a></li>' +
											'<li><a href="http://summatus1.skyedu.com" target="_blank">�⑤쭏�ъ뒪�숈썝 媛뺣궓 �섏튂���꾨Ц愿�</a></li>' +
											'<li><a href="http://gangnam.skyedu.com" target="_blank">�⑤쭏�ъ뒪�숈썝 媛뺣궓 臾멸낵�꾨Ц愿�</a></li>' +
											'<li><a href="http://art.skyedu.com" target="_blank">�⑤쭏�ъ뒪�숈썝 �좊쫱 �덉껜�μ쟾臾멸�</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										'<a href="http://www.skyedu.com/event/freepass/201707/combine/event.asp"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_SKYEDU_01.png" alt=""></a>' +
										'<a href="http://www.skyedu.com/skyM/event/201708/0901/event.asp"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_SKYEDU_02.png" alt=""></a>' +
										banner_sky +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://eng.conects.com/" class="depth-01">' +
								'�댄븰쨌�좏븰' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list horizontal">' +
										'<ul>' +
											'<li><a href="http://eng.conects.com/">�곷떒湲�</a></li>' +
											'<li><a href="http://china.conects.com/">以묐떒湲�</a></li>' +
											'<li><a href="http://3eng.conects.com">�몃쭏�� �곸뼱</a></li>' +
											'<li><a href="http://global.conects.com">�꾨옉�ㅼ뼱�④린</a></li>' +
											'<li><a href="http://japan.conects.com/">�쇰떒湲�</a></li>' +
											'<li><a href="http://soridream.conects.com/">�뚮━�쒕┝</a></li>' +
											'<li><a href="http://gmat.conects.com/main">GRE�④린</a></li>' +
											'<li><a href="http://gmat.conects.com/">GMAT�④린</a></li>' +
											'<li><a href="http://www.princetonreviewprep.com/" target="_blank">Princeton Review</a></li>' +
											'<li><a href="http://tpr.dangi.co.kr/" target="_blank">Princeton Review �숈썝</a></li>' +
											'<li><a href="http://offeng.conects.com/">�곷떒湲곌컯�⑦븰��</a></li>' +
											'<li><a href="http://offeng.conects.com/busan">�곷떒湲곕��고븰��</a></li>' +
											'<li><a href="http://offeng.conects.com/china">以묐떒湲곌컯�⑦븰��</a></li>' +
											'<li><a href="http://offeng.conects.com/busan_china/main">以묐떒湲곕��고븰��</a></li>' +
											'<li><a href="http://directenglish.conects.com/">�ㅼ씠�됲듃�됯�由ъ돩</a></li>' +
											'<li><a href="http://baro.conects.com/">諛붾줈�곸뼱</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										banner_eng +
										'<a href="http://3eng.conects.com"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_3ENG_01.png" alt=""></a> ' +
										'<a href="http://china.conects.com"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_CHINA.png" alt=""></a> ' +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://gong.conects.com/" class="depth-01">' +
								'怨듬Т�먃룹엫��' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list horizontal">' +
										'<ul>' +
											'<li><a href="http://gong.conects.com/">怨듬떒湲�</a></li>' +
											'<li><a href="http://gyung.conects.com/">寃쎈떒湲�</a></li>' +
											'<li><a href="http://bupgum.conects.com/">踰뺢��④린</a></li>' +
											'<li><a href="http://sobang.conects.com/">�뚮갑�④린</a></li>' +
											'<li><a href="http://summatus.conects.com/">�⑤쭏�ъ뒪</a></li>' +
											'<li><a href="http://gong.conects.com/tax">�몃Т愿��몃떒湲�</a></li>' +
											'<li><a href="http://gong.conects.com/social">�щ났�④린</a></li>' +
											'<li><a href="http://gong-eng.conects.com/">怨듬떒湲곗솗湲곗큹�곸뼱</a></li>' +
											'<li><a href="http://gong.conects.com/tech">湲곗닠�④린</a></li>' +
											'<li><a href="http://gong.conects.com/gun">援곕떒湲�</a></li>' +
											'<li><a href="http://gyunggan.conects.com/">寃쎌같媛꾨��④린</a></li>' +
											'<li><a href="http://gyungpro.conects.com/">寃쎌같�뱀쭊�④린</a></li>' +
											'<li><a href="http://imyong.conects.com/">�꾩슜�④린</a></li>' +
											'<li><a href="http://psat.conects.com/">PSAT�④린</a></li>' +
											'<li><a href="http://gong.conects.com/gong/main/academy">怨듬떒湲곕끂�됱쭊�숈썝</a></li>' +
											'<li><a href="http://gong.conects.com/gong/main/academy/GA">怨듬떒湲곌컯�⑦븰��</a></li>' +
											'<li><a href="http://gong.conects.com/gong/main/academy/BU">怨듬떒湲곕��고븰��</a></li>' +
											'<li><a href="http://gong.conects.com/gong/main/academy/DA">怨듬떒湲곕�援ы븰��</a></li>' +
											'<li><a href="http://gyung.conects.com/academy/noryangjin/introduce">寃쎈떒湲곕끂�됱쭊�숈썝</a></li>' +
											'<li><a href="http://gyung.conects.com/promotion/academy/sillim_top">寃쎈떒湲곌린�숉삎�숈썝</a></li>' +
											'<li><a href="http://gyung.conects.com/academy/busan/introduce">寃쎈떒湲곕��고븰��</a></li>' +
											'<li><a href="http://gyung.conects.com/academy/daegu/introduce">寃쎈떒湲곕�援ы븰��</a></li>' +
											'<li><a href="http://gyunggan.conects.com/main/offline">寃쎌같媛꾨��④린�숈썝</a></li>' +
											'<li><a href="http://bupgum.conects.com/academy/academy_main">踰뺢��④린�숈썝</a></li>' +
											'<li><a href="http://sobang.conects.com/academy/academy_main">�뚮갑�④린�몃웾吏꾪븰��</a></li>' +
											'<li><a href="http://summatus.conects.com/main/offline">�⑤쭏�ъ뒪�숈썝</a></li>' +
											'<li><a href="http://imyong.conects.com/main/offline">�꾩슜�④린�숈썝</a></li>' +
											'<li><a href="http://www.testb.co.kr/index_main.html" target="_blank">��援ы븳怨�</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										banner_gong +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://public.conects.com/" class="depth-01">' +
								'痍⑥뾽쨌�ъ랬��' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list vertical">' +
										'<ul>' +
											'<li><a href="http://ja.conects.com">�먮떒湲�</a></li>' +
											'<li><a href="http://ja.conects.com/landing/elec_academy_renewal">�먮떒湲� �쒖씪�꾧린�숈썝</a></li>' +
											'<li><a href="http://finance.conects.com">湲덉쑖�④린</a></li>' +
											'<li><a href="http://gongin.conects.com">怨듭씤�④린</a></li>' +
											'<li><a href="http://gongin.conects.com/main/main_offline">怨듭씤�④린 �숈썝</a></li>' +
										'</ul>' +
										'<ul>' +
											'<li><a href="http://public.conects.com">怨듦린�낅떒湲�</a></li>' +
											'<li><a href="http://job.conects.com">痍⑥뾽�④린</a></li>' +
											'<li><a href="http://public.conects.com/noryangjin/main">而ㅻ꽖痢좉났湲곗뾽�④린 �됱깮援먯쑁��</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										'<a href="http://ja.dangi.co.kr/promotion/electrical_engineer_freepass/main"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_PUBLIC_05.jpg" alt=""></a>' +
										'<a href="http://public.conects.com/noryangjin/main"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_PUBLIC_04.jpg" alt=""></a>' +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://peet.conects.com/" class="depth-01">' +
								'�꾨Ц吏�' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list horizontal">' +
										'<ul>' +
											'<li><a href="http://peet.conects.com">PEET�④린</a></li>' +
											'<li><a href="http://md.conects.com">MD�④린</a></li>' +
											'<li><a href="http://nomu.conects.com/">�몃Т�щ떒湲�</a></li>' +
											'<li><a href="http://bupmu.conects.com/">踰뺣Т�щ떒湲�</a></li>' +
											'<li><a href="http://ca.conects.com/">媛먰룊�щ떒湲�</a></li>' +
											'<li><a href="http://customs.conects.com/">愿��몄궗�④린</a></li>' +
											'<li><a href="http://cpa.conects.com/">�몃Т�щ떒湲�</a></li>' +
											'<li><a href="http://pro.conects.com/">�꾨Ц吏곷떒湲�</a></li>' +
											'<li><a href="http://peet.conects.com/offmdp/main/main">PEET/MD�숈썝</a></li>' +
											'<li><a href="http://nomu.conects.com/main/offline">�몃Т�щ떒湲고븰��</a></li>' +
											'<li><a href="http://ca.conects.com/main/offline">媛먰룊�щ떒湲고븰��</a></li>' +
											'<li><a href="http://bupmu.conects.com/main/offline">踰뺣Т�щ떒湲고븰��</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										'<a href="http://peet.conects.com/"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_PEET.png" alt=""></a>' +
										'<a href="http://pro.conects.com/"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_PRO.png" alt=""></a>' +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://beauty.conects.com/" class="depth-01">' +
								'酉고떚쨌�쇱씠��' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list horizontal">' +
										'<ul>' +
											'<li><a href="http://beauty.conects.com/">酉고떚�대옒��</a></li>' +
											'<li><a href="http://www.mbcbeauty.co.kr/" target="_blank">MBC�꾩뭅�곕�酉고떚�ㅼ엥</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										'<a href="http://beauty.conects.com/"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_BEAUTY.png" alt=""></a>' +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
						'<li>' +
							'<a href="http://www.schole.ac/landing/class_teaser" class="depth-01">' +
								'吏곷Т援먯쑁' +
							'</a>' +
							'<div class="nav-conects-snb-sub"><div><div>' +
								'<div class="wrap-list">' +
									'<div class="list one">' +
										'<ul>' +
											'<li><a href="http://www.schole.ac">SCHOLE</a></li>' +
										'</ul>' +
									'</div>' +
									'<div class="ban">' +
										'<a href="http://www.schole.ac/landing/class_teaser"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_SCHOLE.png" alt=""></a>' +
										'<a href="http://www.schole.ac/landing/blossom_seminar"><img src="//static.conects.com/common/img/st-gnb-ban-v3/GNB_SCHOLE_01.jpg" alt=""></a>' +
									'</div>' +
								'</div>' +
							'</div></div></div>' +
						'</li>' +
					'</ul>' +
				'</div>' +
			'</div>';

	return learning;
};


/***** GNB & FOOTER *****/

/* GNB */
function GNB(){
    this.depth_wrap = '.nav-1depth > ul';
    this.depth_01 = '.nav-1depth > ul > li';
}
GNB.prototype.init = function(o, paragraph){
    this.o = o;
    this.$o = jQuery(o);

	var site = this.$o.find('.bi img').attr('alt');
	if(paragraph == false){
		this.$o.prepend('');
	}else if(paragraph){
		this.$o.prepend(paragraph);
	}else{
		this.$o.prepend('<p style="margin:-30px 0 8px;color:#a5a5a5;font-size:9px;line-height:12px;work-break:all;" class="txt-temp">' + site + '媛�(��)<br>而ㅻ꽖痢�' + site + '(��)濡� 嫄곕벊�⑸땲��.</p>');
	}
    this.listener();
}
GNB.prototype.listener = function(){
    var _this = this;

    try{
        jQuery(_this.depth_wrap).menuAim({
            rowSelector: '> li',

            activate : function(row){
                var $row = jQuery(row);

                $row.addClass('active');
            },

            deactivate : function(row){
                var $row = jQuery(row);

                $row.removeClass('active');
            },

            exitMenu : function(){
                jQuery(_this.depth_01).each(function(){
                    jQuery(this).removeClass('active');
                });

                return true;
            }
        });
    }catch(e){
        return false;
    }
};
GNB.prototype.motion = function(o){

};
GNB.prototype.motion_full = function(o){

};

/* Dangi Info */
function DANGIINFO(){
    this.DELAY = 200;
    this.openEasing = 'easeInQuart';
    this.closeEasing = 'easeOutQuart';
}
DANGIINFO.prototype.init = function(o,bx){
    this.o = o;
    this.$o = jQuery(o);
    this.bx = bx;

    this.close();
};
DANGIINFO.prototype.toggle = function(){
    var _this = this;

    (_this.$o.hasClass('active')) ? _this.close() : _this.open();
};
DANGIINFO.prototype.open = function(){
    var _this = this;

    this.$o.stop().addClass('active').slideDown(_this.DELAY, _this.openEasing, function(){
        _this.bx.reloadSlider();
    });

    jQuery(document).on('click', _this.o + ' .bx-prev, ' + _this.o + ' .bx-next', function(){
        _this.bx.stopAuto();
        _this.bx.startAuto();
    });
};
DANGIINFO.prototype.close = function(){
    var _this = this;

    this.$o.stop().removeClass('active').slideUp(_this.DELAY, _this.closeEasing, function(){
        _this.bx.destroySlider();
    });
};

/* FOOTER */
function ST_CONECTS_FOOTER(){

}
ST_CONECTS_FOOTER.init = function(site){
	var _this = this;
	this.popnum = 1198627573;

	if(site){
		_this.info = jQuery.getScript('//static.conects.com/common/js/st-pub-v3/footer/st-footer-' + site + '.js', function(){
			jQuery('.st-conects-footer-v3-2').append(footer_info);
		});
	}else{
		_this.info = jQuery.getScript('//static.conects.com/common/js/st-pub-v3/footer/st-footer-default.js', function(){
			jQuery('.st-conects-footer-v3-2').append(footer_info);
		});
	}

	this.listener();
};
ST_CONECTS_FOOTER.listener = function(){
	var _this = this;

	jQuery(document).on('click', '.st-conects-footer-v3-2 .link-seller', function(){
		// console.log(_this.popnum);
		window.open('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=' + _this.popnum, 'communicationViewPopup', 'width=750, height=700');
		return false;
	})
};
ST_CONECTS_FOOTER.csnum = function(cs){
	var _this = this;

	jQuery.when(_this.info).then(function(){
		jQuery('.st-conects-footer-v3-2').find('.cs').html(cs);
	})
};
ST_CONECTS_FOOTER.online = function(online){
	var _this = this;

	jQuery.when(_this.info).then(function(){
		if(online){
			jQuery('.st-conects-footer-v3-2').find('.company').prepend('�먯뒪�곗쑀�덊��ㅼ썝寃⑺룊�앷탳�≪썝');
		}
	})
};
ST_CONECTS_FOOTER.address = function(address){
	var _this = this;

	jQuery.when(_this.info).then(function(){
		jQuery('.st-conects-footer-v3-2').find('.address-txt').html(address);
	})
};
ST_CONECTS_FOOTER.licensee_num = function(licensee_num){
	var _this = this;

	jQuery.when(_this.info).then(function(){
		jQuery('.st-conects-footer-v3-2').find('.licensee-num').html(licensee_num);
	})
};
ST_CONECTS_FOOTER.licensee_txt = function(licensee_txt){
	var _this = this;

	jQuery.when(_this.info).then(function(){
		jQuery('.st-conects-footer-v3-2').find('.licensee-txt').html(licensee_txt);
	})
};
ST_CONECTS_FOOTER.set_popnum = function(num){
	this.popnum = num;
};


/***** BANNER *****/
function ST_BANNER(){

}
ST_BANNER.prototype.banner_top = function(banner){
	var href = banner[0];
	var target = banner[1];
	var src = banner[2];
	var alt = banner[3];
	if(banner[4]) var bg = 'background-color:' + banner[4];

	if(href){
		var html_string =   '<div class="st-banner-top">' +
								'<a href="' + href + '" target="' + target + '" class="banner" style="' + bg + '">' +
									'<img src="' + src + '" alt="' + alt + '">' +
								'</a>' +
							'</div>'
	}else{
		var html_string =   '<div class="st-banner-top">' +
								'<span class="banner" style="' + bg + '">' +
									'<img src="' + src + '" alt="' + alt + '">' +
								'</span>' +
							'</div>'
	}

	$('#hgroup').prepend(html_string);
};
ST_BANNER.prototype.banner_snb = function(banner){
	var _this = this;
	var href = banner[0];
	var target = banner[1];
	var src = banner[2];
	var alt = banner[3];

	jQuery.when(COMM_CONECTS_GNB.sub).then(function(){
		$('.nav-util').prepend(
			'<a href="' + href + '" target="' + target + '" class="st-banner-snb">' +
				'<img src="' + src + '" alt="' + alt + '">' +
			'</a>'
		);
	});
};
ST_BANNER.prototype.banner_column = function(banner0, banner1, banner2){
	var href = [
		banner0[0][0],
		banner1[0][0],
		banner2[0][0]
	];
	var target = [
		banner0[0][1],
		banner1[0][1],
		banner2[0][1],
	];
	var src = [
		banner0[0][2],
		banner1[0][2],
		banner2[0][2],
	];
	var alt = [
		banner0[0][3],
		banner1[0][3],
		banner2[0][3],
	];
	var html_string =   '<div class="st-banner-column">' +
							'<ul>' +
								'<li><a href="' + href[0] + '"><img src="' + src[0] + '" alt="' + alt[0] + '"></a></li>' +
								'<li><a href="' + href[1] + '"><img src="' + src[1] + '" alt="' + alt[1] + '"></a></li>' +
								'<li><a href="' + href[2] + '"><img src="' + src[2] + '" alt="' + alt[2] + '"></a></li>' +
							'</ul>' +
						'</div>'

	$('#hgroup').append(html_string);
};
ST_BANNER.prototype.banner_bottom = function(banner){
	var href = banner[0];
	var target = banner[1];
	var src = banner[2];
	var alt = banner[3];
	if(banner[4]) var bg = 'background-color:' + banner[4];

	if(href){
		var html_string =   '<div class="st-banner-bottom">' +
								'<a href="' + href + '" target="' + target + '" class="banner">' +
									'<img src="' + src + '" alt="' + alt + '">' +
								'</a>' +
								'<a href="#" class="btn-close">�リ린</a>' +
							'</div>'
	}else{
		var html_string =   '<div class="st-banner-bottom">' +
								'<span class="banner">' +
									'<img src="' + src + '" alt="' + alt + '">' +
								'</span>' +
								'<a href="#" class="btn-close">�リ린</a>' +
							'</div>'
	}

	jQuery('body').append(html_string);
	jQuery(document).on('click', '.st-banner-bottom .btn-close', function(){
		jQuery('.st-banner-bottom').hide();
		return false;
	})
};
ST_BANNER.prototype.banner_floating = function(banner){
	var href = banner[0];
	var target = banner[1];
	var src = banner[2];
	var alt = banner[3];

	if(banner[4]){
		var cookie_name = banner[4][0];
		var cookie_days = banner[4][1];
		if(cookie_days==1){
			var cookie_txt = '�ㅻ뒛 �섎（ 蹂댁� �딄린';
		}else if(cookie_days==7){
			var cookie_txt = '�쇱＜�� 蹂댁� �딄린';
		}else{
			var cookie_txt = cookie_days + '�� �숈븞 蹂댁� �딄린';
		}
		var cookie_html =   '<span class="btn-check">' +
								'<input type="checkbox" id="chk_ban_flt_cookie">' +
								'<label for="chk_ban_flt_cookie">' + 
									cookie_txt +
								'</label>' +
							'</span>';
	}else{
		var cookie_html = '';
	}
	var cookie = ST_GET_COOKIE(cookie_name);
	var html_string =   '<div class="st-banner-floating">' +
							'<img src="' + src + '" alt="' + alt + '" width="200" height="200" usemap="#floating-banner-map">' +
							'<map name="floating-banner-map" id="floating-banner-map">' +
								'<area shape="circle" coords="100,100,98" href="' + href + '">' +
							'</map>' +
							cookie_html +
							
							'<a href="#" class="btn-close">�リ린</a>' +
						'</div>';


	if(cookie){
		return false;
	}else{
		jQuery('body').append(html_string);
		jQuery(document).on('click', '.st-banner-floating .btn-close', function(){
			if(jQuery('#chk_ban_flt_cookie').prop('checked')){
				ST_SET_COOKIE(cookie_name, true, cookie_days);
			}

			jQuery('.st-banner-floating').hide();
			return false;
		})
	}
};
ST_BANNER.prototype.banner_dim_layer = function(banner){
	var href = banner[0];
	var target = banner[1];
	var src = banner[2];
	var alt = banner[3];

	if(banner[4]){
		var cookie_name = banner[4][0];
		var cookie_days = banner[4][1];
		var cookie_txt = new Array;
		var cookie_form = '';

		for(i in cookie_days){
			if(cookie_days[i]==1){
				cookie_txt[i] = '�ㅻ뒛 �섎（ 蹂댁� �딄린';
			}else if(cookie_days[i]==7){
				cookie_txt[i] = '�쇱＜�� 蹂댁� �딄린';
			}else{
				cookie_txt[i] = cookie_days[i] + '�� �숈븞 蹂댁� �딄린';
			}

			cookie_form += '<input type="checkbox" id="chk_ban_' + i + '"><label for="chk_ban_' + i + '">' + cookie_txt[i] + '</label>'
		}

		var cookie_html =   '<span class="btn-check">' +
								cookie_form +
							'</span>'
	}else{
		var cookie_html = '';
	}

	var html_string =   '<div class="st-banner-dim-layer"><div>' +
							'<a href="' + href + '" target="' + target + '" class="banner">' +
								'<img src="' + src + '" alt="' + alt + '">' +
							'</a>' +
							cookie_html +
							'<a href="#" class="btn-close">�リ린</a>' +
						'</div></div>'

	var cookie = ST_GET_COOKIE(cookie_name);
	if(cookie){
		return false;
	}else{
		ST_DIM.open();
		jQuery('body').append(html_string);
		jQuery(document).on('click', '.st-banner-dim-layer .btn-close', function(){
			jQuery('.st-banner-dim-layer .btn-check input').each(function(i){
				if(jQuery(this).prop('checked')){
					ST_SET_COOKIE(cookie_name, true, cookie_days[i]);
				}
			})

			jQuery('.st-banner-dim-layer').hide();
			ST_DIM.close();
			return false;
		})
	}
};


/***** QUICK BANNER *****/
function QUICKBANNER(){
    this.DELAY = 100;
    this.easing = 'linear';
}
QUICKBANNER.prototype.init = function(wrap, o){
    var _this = this;

    jQuery(window).on('load', function(){
        _this.$o = jQuery(o);

        _this.op = _this.$o.offset().top;
        _this.oh = _this.$o.height();
        _this.dh = jQuery(wrap).height();

        _this.screen();
        _this.listener();
    });
};
QUICKBANNER.prototype.listener = function(){
    var _this = this;

    jQuery(window).scroll(function(){
        _this.position();
        _this.motion();
    });
    jQuery(window).resize(function(){
        _this.screen();
    });
};
QUICKBANNER.prototype.screen = function(){
    this.wh = $(window).height();
};
QUICKBANNER.prototype.position = function(){
    this.ot = 0;

    var p = jQuery(document).scrollTop();

    if(p > this.dh - this.oh + this.op){
        this.ot = this.dh - this.oh;
    }else if(p > this.op){
        this.ot = p - this.op;
    }else{
        this.ot = 0;
    }
};
QUICKBANNER.prototype.motion = function(){
    var _this = this;

    this.$o.stop().animate({
        'top' : _this.ot
    }, _this.DELAY, _this.easing, function(){
        //
    });
};

/***** button *****/
function SLCTBTN(){
    this.DELAY = 50;
    this.openEasing = 'easeInQuart';
    this.closeEasing = 'easeOutQuart';
}
SLCTBTN.prototype.init = function(o){
    this.o = o;

    this.listener();
};
SLCTBTN.prototype.listener = function(){
    var _this = this;

    jQuery(document).on('mouseenter', _this.o, function(){
        jQuery(this).children('.option').stop().slideDown(this.DELAY, this.openEasing)

        jQuery(this).on('mouseleave', function(){
            jQuery(this).children('.option').stop().slideUp(this.DELAY, this.closeEasing)
        })
    });
};

/***** list *****/
function ROLLINGLIST(){

}
ROLLINGLIST.prototype.init = function(o, pause){
    var _this = this;

    this.o = o;
    this.$o = jQuery(o);
    this.$item = this.$o.children();
    this.total = this.$item.length;
    this.idx = 0;
    this.pause = (pause) ? this.pause = pause : this.pause = 1000;

    this.$item.eq(0).addClass('active');

    setTimeout(function(){
        setInterval(function(){
            _this.rolling();
        }, _this.pause);
    }, _this.pause);
};
ROLLINGLIST.prototype.rolling = function(){
    this.$item.each(function(){
        jQuery(this).removeClass('active');
    });

    (this.idx >= this.total - 1) ? this.idx = 0 : this.idx++;
    this.$item.eq(this.idx).addClass('active');
};