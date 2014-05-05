requirejs [
    "modernizr/modernizr",
    "requestAnimationFramePolyfill",
    "jquery/dist/jquery.min",
    "CalculatorController",
    "ParallaxController",
    "DropDownController"
  ], (
    moderniz, 
    poly, 
    jq, 
    CalculatorController, 
    ParallaxController, 
    DropDownController
  )->
    new CalculatorController()
    for parallax in $('.deposit>header')
      new ParallaxController(parallax)
    for dropdown in $('.drop-down-selector')
      new DropDownController(dropdown)