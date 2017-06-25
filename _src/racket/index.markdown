# Racket

*(work in progress)* 

## Racket as a "tool" 

* I found [Scribble](http://docs.racket-lang.org/scribble/index.html)
  a nice tool for taking notes, preparing documents. I use it a lot
  for communicating with colleagues, preparing offers etc. I
  customized the LaTeX output to use our company's document class. 
* I used [Slideshow](http://docs.racket-lang.org/slideshow/index.html)
  for some presentations. Though I lack a lot of practice and creating
  figures etc. is very time-consuming for me.

## Racket "in production"

* Receiving telegrams for a M2M application: The application receives
  messages via HTTP, checks and convert them and then forwards the
  messages to another service for data management and visualization. 
* Backup script: Fires up a instance on EC2 (Amazon Web Services),
  copies and runs a Racket script on the new instance. This script
  dumps a PostgreSQL database and copies the resulting dump to Amazon
  S3.
* File handling for an EDI project: Transfer files between a local
  directory and a remote directory via SFTP.

## Teaching / Education 

* "IoT" course (two days)

## Resources 
### Libraries

* [AWS](https://github.com/greghendershott/aws) by [Greg Hendershott](http://www.greghendershott.com/): Very nice package that helps to access to many Amazon Web Services via Racket. 
* [s3-sync](https://github.com/mflatt/s3-sync) by [Matthew Flatt](http://www.cs.utah.edu/~mflatt/): Syncs a local filesystem with a S3 bucket. 
* [Frog](https://github.com/greghendershott/frog) by [Greg Hendershott](http://www.greghendershott.com/): A nice static web site generator renders Markdown _and_ Scribble; used to make this site. 
* [Cover](https://github.com/florence/cover) by [Spencer Florence](http://florence.io/): A code coverage tool. 
* [Racket Explorer](https://github.com/tonyg/racket-explorer) by [Tony Garnock-Jones](https://eighty-twenty.org): Utility for interactive exploration of complex data structures.
* [raco-find-collection](https://github.com/takikawa/raco-find-collection) by [Asumu Takikawa](http://asumu.xyz): A raco script for finding collections.

### Blog Posts, Books and Articles

* [Fear of Macros](http://www.greghendershott.com/fear-of-macros/) by [Greg Hendershott](http://www.greghendershott.com/): A great tutorial for macros. 
* [The Racket Manifesto](http://www.ccs.neu.edu/home/matthias/manifesto/)
* [How to Design Programs, 2nd edition](http://www.ccs.neu.edu/home/matthias/HtDP2e/index.html)
* [Beautiful Racket](http://beautifulracket.com/)

### Small snippets 

* How to install all libraries after a new version of Racket comes out: `raco pkg migrate`.
  * How to find a module's location: `(collection-file-path "main" "drracket")`, `(require syntax/modresolve) (resolve-module-path 'drracket)` in Emacs (with Racket-Mode installed): `racket-open-require-path` (C-c C-x C-f), `racket-find-collection` which uses the Racket package [raco-find-collection](https://github.com/takikawa/raco-find-collection), 
(Source: [Racket Users](https://groups.google.com/forum/#!topic/racket-users/tJULSX5mYAA) mailing list).
* Adding `raco make` to Racket Minimal: `raco pkg install compiler-lib`.
