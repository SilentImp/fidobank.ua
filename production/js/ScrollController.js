var __bind=function(t,i){return function(){return t.apply(i,arguments)}};define([],function(){var t;return t=function(){function t(){this.checkIfElementVisible=__bind(this.checkIfElementVisible,this),this.scrollToTop=__bind(this.scrollToTop,this),this.scrollToElement=__bind(this.scrollToElement,this),this.renderScroll=__bind(this.renderScroll,this),this.animationLoop=__bind(this.animationLoop,this),this.scrollToCoords=__bind(this.scrollToCoords,this),this.html=document.querySelector("html"),this.scrolling=!1,this.max_scroll_time=1500,this.scroll_time_step=250,this.scroll_px_step=1e3}return t.prototype.scrollToCoords=function(t,i){return this.startTime=parseInt((new Date).getTime().toString().substr(-5),10),this.startPos=window.pageYOffset,this.endPos=t,i===!0?(window.scroll(0,this.endPos),!1):(this.vector=1,this.scrolling=!0,this.html.classList.add("scrolling"),this.endPos<this.startPos&&(this.vector=-1),this.toScroll=Math.abs(this.endPos-this.startPos),this.duration=Math.round(this.toScroll*this.scroll_time_step/this.scroll_px_step),this.duration>this.max_scroll_time&&(this.duration=this.max_scroll_time),this.scrollPerMS=this.toScroll/this.duration,this.endTime=this.startTime+this.duration,this.animationLoop())},t.prototype.animationLoop=function(){return this.renderScroll()?requestAnimationFrame(this.animationLoop):(this.scrolling=!1,this.html.classList.remove("scrolling"),void $(window).trigger("scrolled"))},t.prototype.renderScroll=function(){var t,i;return i=parseInt((new Date).getTime().toString().substr(-5),10),i>this.endTime&&(i=this.endTime),t=i-this.startTime,window.scroll(0,Math.round(this.vector*this.scrollPerMS*t+this.startPos)),this.endTime<=i?!1:window.pageYOffset===this.endPos?!1:!0},t.prototype.scrollToElement=function(t){return this.scrollToCoords(t.offset().top-20,!1)},t.prototype.scrollToTop=function(){return this.scrollToCoords(0,!1)},t.prototype.checkIfElementVisible=function(t){var i,s,o,r;return s=$(window).scrollTop(),i=s+$(window).height(),r=t.offset().top,o=r+t.height(),i>r&&o>s?!0:!1},t}()});