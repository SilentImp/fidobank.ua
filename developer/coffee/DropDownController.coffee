define [], ->

  class DropDownController
    constructor: (widget)->
      @itype = 'click'
      if $('html').hasClass 'touch'
        @itype = 'touchstart'
      @widget = $ widget
      @current = @widget.find('>.current')
      @inputs = @widget.find('input').on 'change', @onChange
      @linked = @widget.attr('data-linkedto')

      @preinit()

    preinit: =>
      input = @widget.find('input:checked')
      label = input.next()
      @current.text(label.text())

    onChange: (event)=>
      input = $ event.currentTarget
      label = input.next()
      @current.text(label.text())
      # linkedLabel = $('input[name='+@linked+']:not(:checked)+label:contains("'+label.text()+'")')
      # if linkedLabel.length == 0
      #   return
      
      # linkedLabel.prev().trigger(@itype)
      # linkedLabel.prev().trigger('change')

  return DropDownController