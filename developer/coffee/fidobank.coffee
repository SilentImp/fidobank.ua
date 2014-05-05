requirejs [
  "modernizr/modernizr",
  "requestAnimationFramePolyfill",
  "jquery/dist/jquery.min",
  "CalculatorController",
  "ParallaxController"
  ], (moderniz, poly, jq, CalculatorController, ParallaxController)->
    new CalculatorController()
    for parallax in $('.deposit>header')
      new ParallaxController(parallax)