define [
  "jquery.maskedinput/jquery.maskedinput.min"
  ], (im)->

  class CallBackController
    constructor: ()->

      @itype = 'click'
      if $('html').hasClass 'touch'
        @itype = 'touchstart'

      @widget = $ '.callback-form'
      @tel = @widget.find 'input[name=phone]'
      @name = @widget.find 'input[name=person]'

      $.mask.definitions['Y']='[а-яА-ЯёЁіІєЄїЇ]';
      $.mask.definitions['X']='[а-яА-ЯёЁіІєЄїЇ ]';
      @tel.mask "+38 099 999 99 99"
      @name.mask "YX?XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",{placeholder:""}

      # @name.inputmask('Regex', {regex: "[а-яА-Я\\s]*"})
      # @name.inputmask("Regex", {regex: "[a-zA-Z ]+", onKeyValidation: @fuck})
      # @tel.inputmask("mask", {"mask": "+38 099 999 99 99", clearMaskOnLostFocus: false})

    fuck: (arg1, arg2, arg3)=>
      console.log arg1, arg2, arg3
      # if arg1 == false
        # @name.val(@name.val().replace(/r/," "))



  return CallBackController