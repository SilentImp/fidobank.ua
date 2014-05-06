define [], ()->

  class ScrollController
    constructor: ()->
      @html = document.querySelector 'html'

      #Скролим ли мы сейчас страницу
      @scrolling = false

      #Максимальное время скрола в мс.
      @max_scroll_time = 1500

      #За сколько милисекунд
      @scroll_time_step = 250

      #Скролим сколько пикселей
      @scroll_px_step = 1000

    scrollToCoords: (y, notime)=>
      @startTime = parseInt(new Date().getTime().toString().substr(-5),10)
      @startPos = window.pageYOffset
      @endPos = y
      # @current.offsetTop
      
      if notime == true
        window.scroll 0, @endPos
        return false

      @vector = 1
      @scrolling = true
      @html.classList.add 'scrolling'
      if @endPos<@startPos
        @vector = -1
      @toScroll = Math.abs(@endPos-@startPos)
      @duration = Math.round(@toScroll*@scroll_time_step/@scroll_px_step)
      if @duration > @max_scroll_time
        @duration = @max_scroll_time
      @scrollPerMS = @toScroll/@duration
      @endTime = @startTime+@duration
      @animationLoop()
    
    animationLoop: =>
      if not @renderScroll()
        @scrolling = false
        @html.classList.remove 'scrolling'
        $(window).trigger 'scrolled'
        return
      
      requestAnimationFrame @animationLoop


    renderScroll: =>

      time = parseInt(new Date().getTime().toString().substr(-5),10)
      if time>@endTime
        time = @endTime

      currentTime = time-@startTime

      window.scroll 0, Math.round((@vector*@scrollPerMS*currentTime)+@startPos)

      if @endTime<=time
        return false

      if window.pageYOffset==@endPos
        return false

      return true

    scrollToElement: (element)=>
      @scrollToCoords element.offset().top-20, false
      

    scrollToTop: =>
      @scrollToCoords 0, false

    checkIfElementVisible: (element)=>
      docViewTop = $(window).scrollTop()
      docViewBottom = docViewTop + $(window).height()

      elemTop = element.offset().top
      elemBottom = elemTop+element.height()
      
      if (elemTop<docViewBottom)&&(elemBottom>docViewTop)
        return true
      return false

  return ScrollController