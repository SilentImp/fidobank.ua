var __bind=function(t,e){return function(){return t.apply(e,arguments)}};define(["jquery.maskedinput/jquery.maskedinput.min"],function(){var t;return t=function(){function t(){this.testInput=__bind(this.testInput,this),this.message20=__bind(this.message20,this),this.message7=__bind(this.message7,this),this.itype="click",$("html").hasClass("touch")&&(this.itype="touchstart"),this.widget=$(".callback-form"),this.tel=this.widget.find("input[name=phone]"),this.name=this.widget.find("input[name=person]"),$.mask.definitions.Y="[а-яА-ЯёЁіІєЄїЇ]",$.mask.definitions.X="[а-яА-ЯёЁіІєЄїЇ ]",this.tel.mask("+38 099 999 99 99"),this.name.mask("YX?XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",{placeholder:""}),this.widget.on("submit",this.testInput),this.widget.find("button").on("click",this.message20)}return t.prototype.message7=function(){var t;try{return ga("send","event","Form","Book a Call","#"+this.name.val()+" "+this.tel.val()+"#")}catch(e){return t=e,console.log(t)}},t.prototype.message20=function(){var t,e;t=this.getData();try{return ga("send","event","Buttons CTR","Book a Call","Click")}catch(s){return e=s,console.log(e)}},t.prototype.testInput=function(t){var e,s,n,i,a,r,o;switch(t.preventDefault(),s=$(".calculator-forms form.current"),o=s.attr("data-type")){case"unity-calculator":i="Депозит «Єдність»",r=s.find('[name="loan_term"]:checked').val(),e=s.find('[name="loan_currency"]:checked').val();break;case"double-guarantee-calculator":i="Депозит «Подвійна гарантія»",r=s.find('[name="loan_term"]:checked').val(),e="USD";break;case"plastic-fantasy-calculator":i="Депозит «Пластик Фантастик»",r=12,e="UAH"}return a=s.find(".summ").val(),n={person:this.name.val(),phone:this.tel.val(),name:i,term:r,currency:e,summ:a},this.message7(),$.post(this.widget.attr("action"),n),this.widget[0].reset(),this.widget.find(".message").hide(),this.widget.find(".ready-to-send").hide(),this.widget.find(".message-was-send").show()},t}()});