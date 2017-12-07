(require 'cljs.build.api)

(cljs.build.api/watch "src"
  {:main 'day6.core
   :output-to "../adventofcodeOut/day6/out/main.js"})