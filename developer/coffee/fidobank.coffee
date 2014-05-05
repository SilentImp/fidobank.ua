requirejs [
  "modernizr/modernizr",
  "requestAnimationFramePolyfill",
  "jquery/dist/jquery.min",
  "CalculatorController"
  ], (moderniz, poly, $, CalculatorController)->
    new CalculatorController()