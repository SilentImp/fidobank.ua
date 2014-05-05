define [
  "ScrollController",
  "jquery.scrollTo"
  ], (ScrollController, scrl)->

  class CalculatorController
    constructor: ()->
      @itype = 'click'
      if $('html').hasClass 'touch'
        @itype = 'touchstart'

      @scrollController = new ScrollController()
      @visibilityChecked = false
      @mainCalculator = $ '.calculator-forms'
      @tabs = @mainCalculator.find '.tabs'
      @tabNav = @mainCalculator.find '.tab-navigation'
      @upButton = $ '.back-to-top'
      @popup = $ '.calculator-popup'
      @popupContent = @popup.find '.wrapper'

      @tabNav.find('a').on @itype, @selectDeposit

      $(window).on 'scroll', @isCalculatorVisible
      @isCalculatorVisible()

    selectDeposit: (event)=>
      event.preventDefault()
      link = $ event.currentTarget
      if link.hasClass 'current'
        return
      target = link.attr('href').substr 1
      @tabNav.find('.current').removeClass 'current'
      link.addClass 'current'
      element = @tabs.find('.'+target)
      @tabs.scrollTo(element, 500, {axis:'x'});
      @popupContent.find('>.current').removeClass 'current'
      @popupContent.find('.'+target).addClass 'current'

      
    isCalculatorVisible: =>
      if @visibilityChecked == true
        return
      @visibilityChecked = true
      if @scrollController.checkIfElementVisible(@mainCalculator)
        @upButton.removeClass 'visible'
        @popup.removeClass 'visible'
      else
        @upButton.addClass 'visible'
        @popup.addClass 'visible'
      window.setTimeout(()=>
        @visibilityChecked = false
      ,250)


  return CalculatorController