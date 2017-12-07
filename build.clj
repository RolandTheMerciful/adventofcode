(require 'cljs.build.api)

(cljs.build.api/build "src" 
	{:main 'day6.core
	:output-to "../adventofcodeOut/day6/out/main.js"})