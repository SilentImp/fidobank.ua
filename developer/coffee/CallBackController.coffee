define [], ->

  class CallBackController
    constructor: ()->

      @itype = 'click'
      if $('html').hasClass 'touch'
        @itype = 'touchstart'

      @widget = $ '.callback-form'
      @tel = @widget.find 'input[name=phone]'
      @name = @widget.find 'input[name=person]'

      @name.inputmask('Regex', {regex: "[а-яА-Я]{,32}"})
      @tel.inputmask("mask", {"mask": "+38 099 999 99 99", showMaskOnHover: false})
      # @tel.inputmask("+38 099 999 99 99")
      # +38 0__ ___ __ __




  return CallBackController