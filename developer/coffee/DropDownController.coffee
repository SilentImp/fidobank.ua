define [], ->

  class DropDownController
    constructor: (widget)->
      console.log widget
      @widget = $ widget
      @current = @widget.find('>.current')
      @inputs = @widget.find('input').on 'change', @onChange

    onChange: (event)=>
      input = $ event.currentTarget
      label = input.next()
      @current.text(label.text())

  return DropDownController