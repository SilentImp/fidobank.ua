requirejs [
  "requestAnimationFramePolyfill",
  "jquery/dist/jquery.min",
  "modernizr/modernizr",
  "CalculatorController"
  ], (poly, $, moderniz, CalculatorController)->
    new CalculatorController()