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

      @max = 128+@widget.height()-@percent.height()
      @widgetHeight = @widget.height()

      $(window).on 'scroll', @isVisible
      @isVisible()

    redraw: =>
      percents = @getPercents()
      @recountBGPos(percents)
      @recountPercPos(percents)

      if @redrawing == false
        return
      requestAnimationFrame @redraw

    recountPercPos: (percents)=>
      
      bottom = parseFloat((@max*percents/100)-64,10)
      console.log bottom
      @percent.css
        'bottom': bottom.toString()+'px'


    getPercents: =>
      docViewTop = $(window).scrollTop()
      docViewBottom = docViewTop + $(window).height()

      widgetTop = @widget.offset().top
      widgetBottom = widgetTop+@widgetHeight

      maxHeight = $(window).height() + (@widgetHeight - 96)
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