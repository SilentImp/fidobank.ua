requirejs [
    "modernizr/modernizr",
    "requestAnimationFramePolyfill",
    "jquery/dist/jquery.min",
    "CalculatorController",
    "ParallaxController",
    "DropDownController",
    "CallBackController"
  ], (
    moderniz, 
    poly, 
    jq, 
    CalculatorController, 
    ParallaxController, 
    DropDownController,
    CallBackController
  )->
    new CalculatorController()
    new CallBackController()
    # new ParallaxController($('.deposit>header:eq(0)'))
    for parallax in $('.deposit>header')
      new ParallaxController(parallax)
    for dropdown in $('.drop-down-selector')
      new DropDownController(dropdown)