define [
  "big.js/big",
  "ScrollController",
  "jquery.scrollTo"
  ], (Big, ScrollController, scrl)->

  class CalculatorController
    constructor: ()->
      @Big = Big

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

      @updetails = @popup.find '.monitor .details'

      @popupMonitor = @popup.find('.monitor')
      @popupMonitorSumm = @popupMonitor.find 'b'
      @popupMonitorCurrency = @popupMonitor.find '.currency'
      @popupMonitorPercent = @popupMonitor.find '.percent'
      
      @calcMonitor = @mainCalculator.find('.monitor')
      @calcMonitorSumm = @calcMonitor.find 'b'
      @calcMonitorCurrency = @calcMonitor.find '.currency'
      @calcMonitorPercent = @calcMonitor.find '.percent'

      @summ = $ 'input.summ'
      @summ.on 'keyup', @syncSumm

      @ddi = $ '.drop-down-selector input'
      @ddi.on 'change', @syncDropDowns

      @popup.find('input').on 'change', @recountForm
      @tabs.find('input').on 'change', @recountForm


      @updetails.on @itype, @showCallBackFormUp
      @tabNav.find('a').on @itype, @selectDeposit
      @detailsButton.on @itype, @showCallBackForm
      @calcButton.on @itype, @showCalcForm
      @upButton.on @itype, @scrollTop

      @current = @tabs.find '>.current'

      $(window).on 'scroll', @isCalculatorVisible
      @isCalculatorVisible()
      @recountForm()

    syncDropDowns: (event)=>
      input = $ event.currentTarget
      name = input.attr('name')
      form = input.parents('form')
      type = form.attr('data-type')

      @current.find('[name='+name+'][value='+input.val()+']:not(:checked)').trigger(@itype)
      @popup.find('.'+type+' input[name='+name+'][value='+input.val()+']:not(:checked)').trigger(@itype)


    syncSumm: (event)=>
      input = $ event.currentTarget
      name = input.attr('name')
      form = input.parents('form')
      type = form.attr('data-type')
      
      linked = @current.find('[name='+name+']')
      if linked.val()!=input.val()
        linked.val(input.val())
      linked = @popup.find('.'+type+' input[name='+name+']')
      if linked.val()!=input.val()
        linked.val(input.val())

    recountForm: ()=>

      type = @current.attr('data-type')
      containers = $ '.'+type
      
      if type == 'unity-calculator'

        summ = @Big(@current.find('.summ').val())
        if isNaN(summ)
          summ = 0
        term = @current.find('[name="loan_term"]:checked').val()
        currency = @current.find('[name="loan_currency"]:checked').val()

        switch currency
          when 'uah' 
            currency = 'ГРН'
            switch term
              when '1' then perc = 24
              when '2' then perc = 24
              when '3' then perc = 25
              when '6' then perc = 19
              when '9' then perc = 19.5
              when '12' then perc = 19.5
              when '18' then perc = 19
              when '24' then perc = 19
          when 'usd'
            currency = 'USD'
            switch term
              when '1' then perc = 13
              when '2' then perc = 13
              when '3' then perc = 13
              when '6' then perc = 8
              when '9' then perc = 8
              when '12' then perc = 9
              when '18' then perc = 9
              when '24' then perc = 9
          when 'eur'
            currency = 'EUR'
            switch term
              when '1' then perc = 12
              when '2' then perc = 12
              when '3' then perc = 12
              when '6' then perc = 7
              when '9' then perc = 7
              when '12' then perc = 8
              when '18' then perc = 8
              when '24' then perc = 8

        @calcMonitorCurrency.html(currency)
        @popupMonitorCurrency.html(currency)

        @calcMonitorPercent.text(perc+'%')
        @popupMonitorPercent.text(perc+'%')

        term = parseInt(term,10)
        result = summ.times(perc/100).div(12).times(term).plus(summ).toFixed(0)
        len = parseInt(result.toString().length,10)

        if len <= 6
          @calcMonitorSumm.removeClass 'small'
          @calcMonitorSumm.removeClass 'very-small'
          @popupMonitorSumm.removeClass 'small'
          @popupMonitorSumm.removeClass 'very-small'
        else if len > 6 && len < 9
          @calcMonitorSumm.addClass 'small'
          @calcMonitorSumm.removeClass 'very-small'
          @popupMonitorSumm.addClass 'small'
          @popupMonitorSumm.removeClass 'very-small'
        else
          @calcMonitorSumm.removeClass 'small'
          @calcMonitorSumm.addClass 'very-small'
          @popupMonitorSumm.removeClass 'small'
          @popupMonitorSumm.adClass 'very-small'

        @calcMonitorSumm.html(result.toString())
        @popupMonitorSumm.html(result.toString())
        

      else if type == 'double-guarantee-calculator'

        summ = @Big(@current.find('.summ').val())
        term = @current.find('[name="loan_term"]:checked').val()
        
        switch term
          when '3' then perc = 12
          when '6' then perc = 7
          when '9' then perc = 7
          when '12' then perc = 8

        @calcMonitorCurrency.html('USD')
        @popupMonitorCurrency.html('USD')

        @calcMonitorPercent.text(perc+'%')
        @popupMonitorPercent.text(perc+'%')

        term = parseInt(term,10)
        result = summ.times(perc/100).div(12).times(term).plus(summ).toFixed(0)
        len = parseInt(result.toString().length,10)

        if len <= 6
          @calcMonitorSumm.removeClass 'small'
          @calcMonitorSumm.removeClass 'very-small'
          @popupMonitorSumm.removeClass 'small'
          @popupMonitorSumm.removeClass 'very-small'
        else if len > 6 && len < 9
          @calcMonitorSumm.addClass 'small'
          @calcMonitorSumm.removeClass 'very-small'
          @popupMonitorSumm.addClass 'small'
          @popupMonitorSumm.removeClass 'very-small'
        else
          @calcMonitorSumm.removeClass 'small'
          @calcMonitorSumm.addClass 'very-small'
          @popupMonitorSumm.removeClass 'small'
          @popupMonitorSumm.adClass 'very-small'

        @calcMonitorSumm.html(result.toString())
        @popupMonitorSumm.html(result.toString())

      else if type == 'plastic-fantasy-calculator'

        summ = @Big(@current.find('.summ').val())

        if summ.lt(1000)
          perc = 8
        else
          perc = 20

        @calcMonitorPercent.html(perc+'%')
        @popupMonitorPercent.html(perc+'%')
        @calcMonitorCurrency.html('ГРН')
        @popupMonitorCurrency.html('ГРН')

        result = summ.times(perc/100).plus(summ).toFixed(0)
        len = parseInt(result.toString().length,10)

        if len <= 6
          @calcMonitorSumm.removeClass 'small'
          @calcMonitorSumm.removeClass 'very-small'
          @popupMonitorSumm.removeClass 'small'
          @popupMonitorSumm.removeClass 'very-small'
        else if len > 6 && len < 9
          @calcMonitorSumm.addClass 'small'
          @calcMonitorSumm.removeClass 'very-small'
          @popupMonitorSumm.addClass 'small'
          @popupMonitorSumm.removeClass 'very-small'
        else
          @calcMonitorSumm.removeClass 'small'
          @calcMonitorSumm.addClass 'very-small'
          @popupMonitorSumm.removeClass 'small'
          @popupMonitorSumm.adClass 'very-small'

        @calcMonitorSumm.html(result.toString())
        @popupMonitorSumm.html(result.toString())

    scrollTop: (event)=>
      event.preventDefault()
      @scrollController.scrollToTop()

    showCalcForm: (event)=>
      event.preventDefault()
      @mainCalculator.show()
      @callBackForm.hide()

    showCallBackFormUp: (event)=>
      event.preventDefault()
      @mainCalculator.hide()
      @callBackForm.show()
      @scrollController.scrollToElement(@callBackForm)

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
      @tabs.find('>.current').removeClass 'current'
      @tabs.find('>.'+target).addClass 'current'

      # @tabs.scrollTo(element, 500, {axis:'x'});

      @popupContent.find('>.current').removeClass 'current'
      @popupContent.find('>.'+target).addClass 'current'
      
      @current = element
      @current.addClass 'current'

      @recountForm()

      
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