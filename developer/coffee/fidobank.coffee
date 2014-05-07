requirejs [
  "modernizr/modernizr",
  "requestAnimationFramePolyfill",
  "jquery/dist/jquery.min",
  "iscroll/build/iscroll",
  "CalculatorController",
  "ParallaxController",
  "DropDownController",
  "CallBackController"
  ], (
  dummy1, 
  dummy2, 
  dummy3, 
  dummy4,
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

