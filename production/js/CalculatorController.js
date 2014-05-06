var __bind=function(t,s){return function(){return t.apply(s,arguments)}};define(["big.js/big","ScrollController","jquery.maskedinput/jquery.maskedinput.min"],function(t,s){var i;return i=function(){function i(){this.isCalculatorVisible=__bind(this.isCalculatorVisible,this),this.selectDeposit=__bind(this.selectDeposit,this),this.showCallBackForm=__bind(this.showCallBackForm,this),this.showCallBackFormUp=__bind(this.showCallBackFormUp,this),this.showCalcForm=__bind(this.showCalcForm,this),this.scrollTop=__bind(this.scrollTop,this),this.recountForm=__bind(this.recountForm,this),this.syncSumm=__bind(this.syncSumm,this),this.syncDropDowns=__bind(this.syncDropDowns,this),this.Big=t,this.delayTime=250,this.itype="click",$("html").hasClass("touch")&&(this.itype="touchstart"),this.scrollController=new s,this.visibilityChecked=!1,this.mainCalculator=$(".calculator-forms"),this.callBackForm=$(".callback-form"),this.tabs=this.mainCalculator.find(".tabs"),this.tabNav=this.mainCalculator.find(".tab-navigation"),this.upButton=$(".back-to-top"),this.popup=$(".calculator-popup"),this.popupContent=this.popup.find(".wrapper"),this.detailsButton=this.tabs.find(".monitor .details"),this.calcButton=this.callBackForm.find(".back-to-calculator"),this.updetails=this.popup.find(".monitor .details"),this.popupMonitor=this.popup.find(".monitor"),this.popupMonitorSumm=this.popupMonitor.find("b"),this.popupMonitorCurrency=this.popupMonitor.find(".currency"),this.popupMonitorPercent=this.popupMonitor.find(".percent"),this.calcMonitor=this.mainCalculator.find(".monitor"),this.calcMonitorSumm=this.calcMonitor.find("b"),this.calcMonitorCurrency=this.calcMonitor.find(".currency"),this.calcMonitorPercent=this.calcMonitor.find(".percent"),this.summ=$("input.summ"),this.summ.mask("9?9999999",{placeholder:""}),this.summ.on("keypress",this.syncSumm),this.ddi=$(".drop-down-selector input"),this.ddi.on("change",this.syncDropDowns),this.popup.find("input").on("change",this.recountForm),this.tabs.find("input").on("change",this.recountForm),this.updetails.on(this.itype,this.showCallBackFormUp),this.tabNav.find("a").on(this.itype,this.selectDeposit),this.detailsButton.on(this.itype,this.showCallBackForm),this.calcButton.on(this.itype,this.showCalcForm),this.upButton.on(this.itype,this.scrollTop),this.current=this.tabs.find(">.current"),Modernizr.touch&&$(window).on("touchmove",this.isCalculatorVisible),$(window).on("scroll",this.isCalculatorVisible),this.isCalculatorVisible(),this.recountForm(),$("form:not(.callback-form)").on("submit",function(t){return function(s){return s.preventDefault(),t.recountForm()}}(this))}return i.prototype.syncDropDowns=function(t){var s,i,o,r;return i=$(t.currentTarget),o=i.attr("name"),s=i.parents("form"),r=s.attr("data-type"),this.current.find("[name="+o+"][value="+i.val()+"]:not(:checked)").trigger(this.itype),this.popup.find("."+r+" input[name="+o+"][value="+i.val()+"]:not(:checked)").trigger(this.itype)},i.prototype.syncSumm=function(t){var s,i,o,r,a;return i=$(t.currentTarget),r=i.attr("name"),s=i.parents("form"),a=s.attr("data-type"),o=this.current.find("[name="+r+"]"),o.val()!==i.val()&&o.val(i.val()),o=this.popup.find("."+a+" input[name="+r+"]"),o.val()!==i.val()?o.val(i.val()):void 0},i.prototype.recountForm=function(){var t,s,i,o,r,a,e,l;if(l=this.current.attr("data-type"),t=$("."+l),"unity-calculator"===l){switch(a=this.Big(this.current.find(".summ").val()),isNaN(a)&&(a=0),e=this.current.find('[name="loan_term"]:checked').val(),s=this.current.find('[name="loan_currency"]:checked').val()){case"uah":switch(s="ГРН",e){case"1":o=24;break;case"2":o=24;break;case"3":o=25;break;case"6":o=19;break;case"9":o=19.5;break;case"12":o=19.5;break;case"18":o=19;break;case"24":o=19}break;case"usd":switch(s="USD",e){case"1":o=13;break;case"2":o=13;break;case"3":o=13;break;case"6":o=8;break;case"9":o=8;break;case"12":o=9;break;case"18":o=9;break;case"24":o=9}break;case"eur":switch(s="EUR",e){case"1":o=12;break;case"2":o=12;break;case"3":o=12;break;case"6":o=7;break;case"9":o=7;break;case"12":o=8;break;case"18":o=8;break;case"24":o=8}}return this.calcMonitorCurrency.html(s),this.popupMonitorCurrency.html(s),this.calcMonitorPercent.text(o+"%"),this.popupMonitorPercent.text(o+"%"),e=parseInt(e,10),r=a.times(o/100).div(12).times(e).plus(a).toFixed(0),i=parseInt(r.toString().length,10),6>=i?(this.calcMonitorSumm.removeClass("small"),this.calcMonitorSumm.removeClass("very-small"),this.popupMonitorSumm.removeClass("small"),this.popupMonitorSumm.removeClass("very-small")):i>6&&9>i?(this.calcMonitorSumm.addClass("small"),this.calcMonitorSumm.removeClass("very-small"),this.popupMonitorSumm.addClass("small"),this.popupMonitorSumm.removeClass("very-small")):(this.calcMonitorSumm.removeClass("small"),this.calcMonitorSumm.addClass("very-small"),this.popupMonitorSumm.removeClass("small"),this.popupMonitorSumm.adClass("very-small")),this.calcMonitorSumm.html(r.toString()),this.popupMonitorSumm.html(r.toString())}if("double-guarantee-calculator"===l){switch(a=this.Big(this.current.find(".summ").val()),e=this.current.find('[name="loan_term"]:checked').val()){case"3":o=12;break;case"6":o=7;break;case"9":o=7;break;case"12":o=8}return this.calcMonitorCurrency.html("USD"),this.popupMonitorCurrency.html("USD"),this.calcMonitorPercent.text(o+"%"),this.popupMonitorPercent.text(o+"%"),e=parseInt(e,10),r=a.times(o/100).div(12).times(e).plus(a).toFixed(0),i=parseInt(r.toString().length,10),6>=i?(this.calcMonitorSumm.removeClass("small"),this.calcMonitorSumm.removeClass("very-small"),this.popupMonitorSumm.removeClass("small"),this.popupMonitorSumm.removeClass("very-small")):i>6&&9>i?(this.calcMonitorSumm.addClass("small"),this.calcMonitorSumm.removeClass("very-small"),this.popupMonitorSumm.addClass("small"),this.popupMonitorSumm.removeClass("very-small")):(this.calcMonitorSumm.removeClass("small"),this.calcMonitorSumm.addClass("very-small"),this.popupMonitorSumm.removeClass("small"),this.popupMonitorSumm.adClass("very-small")),this.calcMonitorSumm.html(r.toString()),this.popupMonitorSumm.html(r.toString())}return"plastic-fantasy-calculator"===l?(a=this.Big(this.current.find(".summ").val()),o=a.lt(1e3)?8:20,this.calcMonitorPercent.html(o+"%"),this.popupMonitorPercent.html(o+"%"),this.calcMonitorCurrency.html("ГРН"),this.popupMonitorCurrency.html("ГРН"),r=a.times(o/100).plus(a).toFixed(0),i=parseInt(r.toString().length,10),6>=i?(this.calcMonitorSumm.removeClass("small"),this.calcMonitorSumm.removeClass("very-small"),this.popupMonitorSumm.removeClass("small"),this.popupMonitorSumm.removeClass("very-small")):i>6&&9>i?(this.calcMonitorSumm.addClass("small"),this.calcMonitorSumm.removeClass("very-small"),this.popupMonitorSumm.addClass("small"),this.popupMonitorSumm.removeClass("very-small")):(this.calcMonitorSumm.removeClass("small"),this.calcMonitorSumm.addClass("very-small"),this.popupMonitorSumm.removeClass("small"),this.popupMonitorSumm.adClass("very-small")),this.calcMonitorSumm.html(r.toString()),this.popupMonitorSumm.html(r.toString())):void 0},i.prototype.scrollTop=function(t){return t.preventDefault(),this.scrollController.scrollToTop()},i.prototype.showCalcForm=function(t){return t.preventDefault(),this.mainCalculator.show(),this.callBackForm.hide()},i.prototype.showCallBackFormUp=function(t){return t.preventDefault(),this.mainCalculator.hide(),this.callBackForm.show(),this.scrollController.scrollToElement(this.callBackForm)},i.prototype.showCallBackForm=function(t){return t.preventDefault(),this.mainCalculator.hide(),this.callBackForm.show()},i.prototype.selectDeposit=function(t){var s,i,o;return t.preventDefault(),i=$(t.currentTarget),i.hasClass("current")?void 0:(o=i.attr("href").substr(1),this.tabNav.find(".current").removeClass("current"),i.addClass("current"),s=this.tabs.find("."+o),this.tabs.find(">.current").removeClass("current"),this.tabs.find(">."+o).addClass("current"),this.popupContent.find(">.current").removeClass("current"),this.popupContent.find(">."+o).addClass("current"),this.current=s,this.current.addClass("current"),this.recountForm())},i.prototype.isCalculatorVisible=function(){return this.visibilityChecked!==!0?(this.visibilityChecked=!0,this.scrollController.checkIfElementVisible(this.mainCalculator)?(this.upButton.removeClass("visible"),this.popup.removeClass("visible")):(this.upButton.addClass("visible"),this.popup.addClass("visible")),window.setTimeout(function(t){return function(){return t.visibilityChecked=!1}}(this),this.delayTime)):void 0},i}()});