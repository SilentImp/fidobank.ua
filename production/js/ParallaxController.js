var __bind=function(t,i){return function(){return t.apply(i,arguments)}};define(["ScrollController"],function(t){var i;return i=function(){function i(i){this.isVisible=__bind(this.isVisible,this),this.recountBGPos=__bind(this.recountBGPos,this),this.getPercents=__bind(this.getPercents,this),this.recountPercPos=__bind(this.recountPercPos,this),this.redraw=__bind(this.redraw,this),this.redrawForIpad=__bind(this.redrawForIpad,this),this.widget=$(i),this.percent=this.widget.find(">.percent"),this.scrollController=new t,this.visibilityChecked=!1,this.discreteTime=100,this.redrawing=!1,this.widgetHeight=this.widget.height(),this.max=256+this.widgetHeight,$(window).on("scroll",this.isVisible),$(window).on("scrolled",this.isVisible),this.isVisible()}return i.prototype.redrawForIpad=function(){var t;return this.redrawing===!0?(t=this.getPercents(),this.recountBGPos(t),this.recountPercPos(t)):void 0},i.prototype.redraw=function(){var t;return t=this.getPercents(),this.recountBGPos(t),this.recountPercPos(t),this.redrawing!==!1?requestAnimationFrame(this.redraw):void 0},i.prototype.recountPercPos=function(t){var i;return i=parseFloat(this.max*t/100-128,10),this.percent.css({bottom:i.toString()+"px"})},i.prototype.getPercents=function(){var t,i,e,r,s,n;return i=$(window).scrollTop(),t=i+$(window).height(),n=this.widget.offset().top,s=n+this.widgetHeight,e=$(window).height()-96+this.widgetHeight/2,r=n-(i-(this.widgetHeight-96)),100-Math.min(Math.max(parseFloat(100*r/e,10),0),100)},i.prototype.recountBGPos=function(t){return this.widget.css({"background-position":"50% "+t.toString()+"%"})},i.prototype.isVisible=function(){return this.visibilityChecked!==!0?(this.visibilityChecked=!0,this.scrollController.checkIfElementVisible(this.widget)===!0?this.redrawing===!1&&(this.redrawing=!0,this.redraw()):this.redrawing=!1,window.setTimeout(function(t){return function(){return t.visibilityChecked=!1}}(this),this.discreteTime)):void 0},i}()});