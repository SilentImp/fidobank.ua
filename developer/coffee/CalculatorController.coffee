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
      @callBackForm = $ '.callback-form'
      @tabs = @mainCalculator.find '.tabs'
      @tabNav = @mainCalculator.find '.tab-navigation'
      @upButton = $ '.back-to-top'
      @popup = $ '.calculator-popup'
      @popupContent = @popup.find '.wrapper'
      @detailsButton = @tabs.find '.monitor .details'
      @calcButton = @callBackForm.find '.back-to-calculator'


      @tabNav.find('a').on @itype, @selectDeposit
      @detailsButton.on @itype, @showCallBackForm
      @calcButton.on @itype, @showCalcForm
      @upButton.on @itype, @scrollTop

      $(window).on 'scroll', @isCalculatorVisible
      @isCalculatorVisible()

    scrollTop: (event)=>
      event.preventDefault()
      @scrollController.scrollToTop()

    showCalcForm: (event)=>
      event.preventDefault()
      @mainCalculator.show()
      @callBackForm.hide()

    showCallBackForm: (event)=>
      event.preventDefault()
      @mainCalculator.hide()
      @callBackForm.show()

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