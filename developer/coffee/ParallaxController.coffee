define [
    "ScrollController"
  ], (
    ScrollController
  )->

  class ParallaxController
    constructor: (widget)->
      @widget = $ widget
      @percent = @widget.find '>.percent'
      @scrollController = new ScrollController()

      @visibilityChecked = false
      @discreteTime = 100
      @redrawing = false

      @widgetHeight = @widget.height()
      @max = 256 + @widgetHeight

      $(window).on 'scroll', @isVisible
      
      # if Modernizr.touch
      #   $(window).on 'touchmove', @isVisible
      #   $(window).on 'touchmove', @redrawForIpad

      @isVisible()

    redrawForIpad: =>
      if @redrawing == true
        percents = @getPercents()
        @recountBGPos(percents)
        @recountPercPos(percents)      

    redraw: =>
      percents = @getPercents()
      @recountBGPos(percents)
      @recountPercPos(percents)
      if @redrawing == false
        return
      requestAnimationFrame @redraw

    recountPercPos: (percents)=>
      bottom = parseFloat((@max*percents/100)-128,10)
      @percent.css
        'bottom': bottom.toString()+'px'
      console.log @percent.css('bottom')


    getPercents: =>
      docViewTop = $(window).scrollTop()
      docViewBottom = docViewTop + $(window).height()

      widgetTop = @widget.offset().top
      widgetBottom = widgetTop+@widgetHeight

      maxHeight = $(window).height() - 96 + @widgetHeight/2
      part = widgetTop - (docViewTop - (@widgetHeight - 96))
      return 100-Math.min(Math.max(parseFloat(part*100/maxHeight,10),0),100)

    recountBGPos: (percents)=>
      @widget.css
        'background-position': '50% '+percents.toString()+'%'
        

    isVisible: (event)=>
      if @visibilityChecked == true
        return

      @visibilityChecked = true

      if @scrollController.checkIfElementVisible(@widget) == true
        if @redrawing == false
          @redrawing = true
          @redraw()
      else
        @redrawing = false

      window.setTimeout(()=>
        @visibilityChecked = false
      ,@discreteTime)

  return ParallaxController