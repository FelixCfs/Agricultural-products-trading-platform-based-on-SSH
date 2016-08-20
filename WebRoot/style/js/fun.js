//--
var imgScrollNum2=new Array();
for(i=0;i<50;i++){
  imgScrollNum2[i]=0;	
}
function imgScrollRight2(a,b,c,d){
	    a.stop();
		if(imgScrollNum2[d]<b){
			imgScrollNum2[d]++;
			a.animate({scrollLeft: imgScrollNum2[d]*c}, "slow");
			}
	}	
function imgScrollLeft2(a,b,c,d){
	    a.stop();
		if(imgScrollNum2[d]>0){
			imgScrollNum2[d]--;
			a.animate({scrollLeft: imgScrollNum2[d]*c}, "slow");		
			}
	}	
//--
function indexFlashFun2(){
	$('.indexFlash').find('.leftBtn').animate({left: ($(window).width()-1002)/2}, "slow");	
	$('.indexFlash').find('.rightBtn').animate({right: ($(window).width()-1002)/2}, "slow");		
	}	
var indexFlashNow=0;	
function indexFlashFun(){
	    $('.indexFlash').find('li').each(function(i){
			if(i!=indexFlashNow){
				$(this).find('a').css('left',"100%");
				}
			})
		$('.indexFlash').find('li').eq(indexFlashNow).find('a').animate({left:"-100%"},"slow");
		if(indexFlashNow<$('.indexFlash').find('li').length-1){
			indexFlashNow++;
			}else{
				indexFlashNow=0;
				}
		$('.indexFlash').find('li').eq(indexFlashNow).find('a').animate({left:0},"slow");	
	}