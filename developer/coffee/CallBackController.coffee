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

      currentForm = $('.calculator-forms form.current')
      type = currentForm.attr 'data-type'
      switch type
        when 'unity-calculator'
          name = "Депозит «Єдність»"
          term = currentForm.find('[name="loan_term"]:checked').val()
          currency = currentForm.find('[name="loan_currency"]:checked').val()
        when 'double-guarantee-calculator'
          name = "Депозит «Двойная гарантия»"
          term = currentForm.find('[name="loan_term"]:checked').val()
          currency = "USD"
        when 'plastic-fantasy-calculator'
          name = "Депозит «Пластик Фантастик»"
          term = 12
          currency = "UAH"
      summ = currentForm.find('.summ').val()

      data = 
        "person": @name.val(),
        "phone": @tel.val(),
        "name": name,
        "term": term,
        "currency": currency,
        "summ": summ


      $.post @widget.attr('action'), data
      @widget[0].reset()
      @widget.find('.message').hide()
      @widget.find('.ready-to-send').hide()
      @widget.find('.message-was-send').show()



  return CallBackController