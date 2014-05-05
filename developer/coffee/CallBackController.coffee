define [], ->

  class CallBackController
    constructor: ()->

      @enter = 13
      @esc = 27
      @dash = 189
      @ctrl = 17
      @cmd = 91
      @shift = 16
      @alt = 18
      @space = 32
      @chars =  [@dash, @space]
      @r = 82
      @numbers = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57]
      @controls = [8, 9, 45, 46, 39, 37, @esc, @ctrl, @alt, @shift, @enter, @cmd]
      @controlsPressed = []
      @phoneBuffer = []

      @itype = 'click'
      if $('html').hasClass 'touch'
        @itype = 'touchstart'

      @widget = $ '.callback-form'
      @tel = @widget.find 'input[name=phone]'
      @name = @widget.find 'input[name=person]'

      @tel.on 'keyup', @keyUp
      @name.on 'keyup', @keyUp
      @name.on 'keyup', @checkRussian

      @name.on 'keydown', @filterCyrillic

    checkRussian: (event)=>
      val = @name.val()
      if val.match(/[^\sа-я]/ig) != null
        @name.val(val.replace(/[^\sа-яхъ]/,""))

    filterCyrillic: (event)=>

      # console.log String.fromCharCode(event.which), event.which

      notIsLetter = String.fromCharCode(event.which)
      notIsLetter = notIsLetter.match(/[a-zÝÛºÞÜ¼¾À]/i) == null

      if event.which not in @controls and notIsLetter and event.which != @space
        event.preventDefault()

      if event.which in @controls and @controlsPressed.indexOf(event.which)<0
        @controlsPressed.push event.which

      if (event.which == @space) and (@name.val().split(" ").length - 1) == 3
        event.preventDefault()

      switch event.which
        when @r
          isCmd = (@controlsPressed.indexOf(@cmd) > -1)
          isCtrl = (@controlsPressed.indexOf(@ctrl) > -1)
          if not isCmd and not isCtrl
            event.preventDefault()
        when @esc
          event.preventDefault()
          @name.blur()
        when @enter
          event.preventDefault()
          @name.blur()

    keyUp: (event)=>
      index = @controlsPressed.indexOf event.which
      if index > -1  
        @controlsPressed.splice index, 1



  return CallBackController