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

      @widget.on 'submit', @testInput

    testInput: (event)=>
      event.preventDefault()
      $.post(@widget.attr('action'),
        "person": @name.val(),
        "phone": @tel.val()
      )
      @widget[0].reset()

      @widget.find('.ready-to-send').hide()
      @widget.find('.message-was-send').show()



  return CallBackController