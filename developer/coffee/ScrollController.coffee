define [], ()->

  class ScrollController
    constructor: ()->

    scrollToTop: =>
      

    checkIfElementVisible: (element)=>
      docViewTop = $(window).scrollTop()
      docViewBottom = docViewTop + $(window).height()

      elemTop = element.offset().top
      elemBottom = elemTop+element.height()
      if (elemTop<docViewBottom)&&(elemBottom>docViewTop)
        return true
      return false

  return ScrollController