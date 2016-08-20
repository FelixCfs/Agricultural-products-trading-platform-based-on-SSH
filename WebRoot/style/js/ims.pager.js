(function(win){
$(function(){
	$(".ims_pager").each(function(i,o){
		$(o).css("display","none");
		var pjson = $(o).html(),
			opjson = win['eval']('('+pjson+')'),
			omod = $(o).attr("mod"),
			emod = omod.split("|"),
			_url = $(o).attr("url"),
			sptor = $(o).attr("sp"),
			goid = $(o).attr("goid");
		sptor = sptor?sptor:'/';
		var url = _url?_url:win.location.href,
			_phtml = url.lastIndexOf(".html"),
			url = _phtml>0?url.substr(0,_phtml):url,
			_ppos = url.indexOf(sptor+opjson.tag+sptor),
			url = _ppos>0?url.substr(0,_ppos):url;
		url = url+sptor;
		if(opjson.current_page>opjson.last_page && !goid){
			document.location = url+opjson.tag+sptor+opjson.last_page+".html";
		}
		if(opjson.current_page<1 && !goid){
			document.location = url+opjson.tag+sptor+"1.html";
		}
		for(var k=0;k<emod.length;k++){
			var ep = emod[k].split(":");
			switch(parseInt(ep[1])){
				case 0: ims_pager_0(opjson,ep[0],url,sptor,goid); break;
				case 1: ims_pager_1(opjson,ep[0],url,sptor,goid); break;
				case 2: ims_pager_2(opjson,ep[0],url,sptor,goid); break;
				case 3: ims_pager_3(opjson,ep[0],url,sptor,goid); break;
				default:ims_pager_0(opjson,ep[0],url,sptor,goid); break;
			}
		}
	});
});
/**
 * 第一种模式的翻页
 **/
function ims_pager_0(p,h,url,sptor,goid)
{
	if(p.total>0){		
		str = '<div class="page" style="text-align:center"><form method="post" class="__ims_page_form" style="margin:0; padding:0;" onsubmit="return false;">每页有'+p.stride+'条记录 当前页为:'+p.current_page+' 共有'+p.last_page+'页 ';
		str += p.current_page>1?'<a href="'+url+p.tag+sptor+'1.html">第一页</a> |  ':'第一页 |';
		str += p.current_page>1?'<a href="'+url+p.tag+sptor+p.up_page+'.html">上一页</a> ':'';
		str += '<input name="__ims_pagernum" type="text" style="width:30px; height:18px;" value="'+p.current_page+'" /> ';
		str += p.current_page<p.last_page?'<a href="'+url+p.tag+sptor+p.next_page+'.html">下一页</a> | ':'';
		str += p.current_page<p.last_page?'<a href="'+url+p.tag+sptor+p.last_page+'.html">最后一页</a></form></div>':'最后一页</form></div>';
		$(h).html(str);
		$(".__ims_page_form").submit(function(){
			var _val = $("input[name='__ims_pagernum']",this).val();
			_val = _val==""?1:_val;
			document.location = url+p.tag+sptor+_val+".html";
			return false;
		});
		$("input[name='__ims_pagernum']").keydown(function(){
			var _val = $(this).val();
			if('' != _val.substr(0,1))
			{
				if(_val.substr(0,1) == 0)
					$(this).val('');
			}
			if  ('' != _val.replace(/\d/g,''))
			{
				$(this).val(_val.replace(/\D/g,''));
			}
		});
	}
}
/**
 * 第二种模式的翻页
 **/
function ims_pager_1(p,h,url,sptor,goid)
{
	if(p.total>0){		
		var str = '';
		str += p.current_page>1?'<a href="'+url+p.tag+sptor+'1.html">第一页</a>':'<a>第一页</a>';
		str += parseInt(p.current_page)>=1?'<span><a title="" href="'+url+p.tag+sptor+parseInt(p.up_page)+'.html">上一页</a></span>':'';
		var lastpage = Math.ceil(p.current_page/5)*5,
			firstpage = lastpage-4;
		for(var i=firstpage;i<=lastpage;i++){			
			var curcss = i==p.current_page?'class="aNow"':'';			
			if(i<=p.last_page)			
				str += '<a '+curcss+' title="" href="'+url+p.tag+sptor+i+'.html">'+i+'</a>';		
		}		
		if(i<p.last_page) str += '<span>...</span>';
		str += p.current_page<=p.last_page?'<span><a title="" href="'+url+p.tag+sptor+p.next_page+'.html">下一页</a></span>':'';
		str += p.current_page<p.last_page?'<a href="'+url+p.tag+sptor+p.last_page+'.html">末页</a>':'<a>末页</a>';
		$(h).html(str);
	}
}
/**
 * 第三种模式的翻页
 **/
function ims_pager_2(p,h,url,sptor,goid)
{
	if(p.total>0){
		var str = '';
		str += '<div class="fl">';
		var lastpage = Math.ceil(p.current_page/3)*3,
			firstpage = lastpage-2;
		for(var i=firstpage;i<=lastpage;i++){
			var curcss = i==p.current_page?'class="a_now"':'';
			if(i<=p.last_page)
				str += '<a title="" '+curcss+' href="'+url+p.tag+sptor+i+'.html">'+i+'</a>';
		}
		if(i<p.last_page) str += '<a href="'+url+p.tag+sptor+p.next_page+'.html">...</a>';
		str += '<span>';
		str += '<a title="" href="'+url+p.tag+sptor+parseInt(p.up_page)+'.html"><img src="image/pageNum1.gif"></a>';
		str += '<a title="" href="'+url+p.tag+sptor+p.next_page+'.html"><img src="image/pageNum2.gif"></a>';
		str += '</span>';
		str += '</div>';
		$(h).html(str);
	}
}

/**
 * 第四种模式的翻页
 **/
function ims_pager_3(p,h,url,sptor,goid)
{
	if(p.total>0){		
		var str = '';		
		str += '<div>';
		str += '<a title="" href="javascript:;" ajax="true" url="'+url+p.tag+sptor+parseInt(p.up_page)+'.html" goid="'+goid+'"><img src="image/pageNum1.gif" align="absmiddle"></a>';
		var lastpage = Math.ceil(p.current_page/5)*5,
			firstpage = lastpage-4;
		for(var i=firstpage;i<=lastpage;i++){
			var curcss = i==p.current_page?'class="a_now"':'';
			if(i<=p.last_page)
				str += '<a title="" '+curcss+' href="javascript:;" ajax="true" url="'+url+p.tag+sptor+i+'.html" goid="'+goid+'">'+i+'</a>';
		}
		if(i<p.last_page) str += '<span>...</span>';
		str += '<span>';		
		str += '<a title="" href="javascript:;" ajax="true" url="'+url+p.tag+sptor+p.next_page+'.html" goid="'+goid+'"><img src="image/pageNum2.gif" align="absmiddle"></a>';
		str += '</span>';
		str += '</div>';
		$(h).html(str);
	}
}
})(window);