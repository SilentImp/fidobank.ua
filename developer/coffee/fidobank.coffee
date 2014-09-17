requirejs [
  "modernizr/modernizr",
  "requestAnimationFramePolyfill",
  "jquery/dist/jquery.min"
  ], (
  dummy1, 
  dummy2, 
  dummy3
  )->
    requirejs [
      "CalculatorController",
      "ParallaxController",
      "DropDownController",
      "CallBackController"
      ], (
      CalculatorController, 
      ParallaxController, 
      DropDownController,
      CallBackController
      )->
        new CalculatorController()
        new CallBackController()
        for parallax in $('.deposit>header')
          new ParallaxController(parallax)
        for dropdown in $('.drop-down-selector')
          new DropDownController(dropdown)

