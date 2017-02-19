# Racket

I collected several resources that I found useful when learning and using Racket. 

## Libraries

* [AWS](https://github.com/greghendershott/aws) by [Greg Hendershott](http://www.greghendershott.com/): Very nice package that helps to access to many Amazon Web Services via Racket. 
* [s3-sync](https://github.com/mflatt/s3-sync) by [Matthew Flatt](http://www.cs.utah.edu/~mflatt/): Syncs a local filesystem with a S3 bucket. 
* [Frog](https://github.com/greghendershott/frog) by [Greg Hendershott](http://www.greghendershott.com/): A nice static web site generator renders Markdown _and_ Scribble; used to make this site. 
* [Cover](https://github.com/florence/cover) by [Spencer Florence](http://florence.io/): A code coverage tool. 
* [Racket Explorer](https://github.com/tonyg/racket-explorer) by [Tony Garnock-Jones](https://eighty-twenty.org): Utility for interactive exploration of complex data structures.
* [raco-find-collection](https://github.com/takikawa/raco-find-collection) by [Asumu Takikawa](http://asumu.xyz): A raco script for finding collections.

## Blog Posts and Articles

* [Fear of Macros](http://www.greghendershott.com/fear-of-macros/) by [Greg Hendershott](http://www.greghendershott.com/): A great tutorial for macros. 

## Small snippets 

* How to install all libraries after a new version of Racket comes out: `raco pkg migrate` 
  * How to find where a module is located: `(collection-file-path "main" "drracket")`, `(require syntax/modresolve) (resolve-module-path 'drracket)` in Emacs (with Racket-Mode installed): `racket-open-require-path` (C-c C-x C-f), `racket-find-collection` which uses the Racket package [raco-find-collection](https://github.com/takikawa/raco-find-collection).
(Source: [Racket Users](https://groups.google.com/forum/#!topic/racket-users/tJULSX5mYAA) mailing list)
