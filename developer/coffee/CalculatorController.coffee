define [
  "ScrollController"
  ], (ScrollController)->

  class CalculatorController
    constructor: ()->
      @scrollController = new ScrollController()
      @visibilityChecked = false
      @mainCalculator = $ '.calculator-forms'
      @upButton = $ '.back-to-top'
      @popup = $ '.calculator-popup'
      $(window).on 'scroll', @isCalculatorVisible
      @isCalculatorVisible()
      
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