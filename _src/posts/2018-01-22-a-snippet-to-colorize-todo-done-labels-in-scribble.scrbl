#lang scribble/manual

Title: A snippet to colorize TODO/DONE labels in Scribble
Date: 2018-01-22T16:24:41
Tags: Racket, Scribble 

I played with text properties in Scribble and produced red and green labels for
todos: 

<!-- more -->

@(begin

(require scribble/core)

(define TODO-COLOR "black")
(define TODO-BACKGROUND "red")
(define DONE-COLOR "black")
(define DONE-BACKGROUND "green")

(define (todo/done-entry label txt color background)
  (element
    (style #f (list (color-property color)
                    (background-color-property background)))
    (if (string=? txt "")
        label
        (string-append label " (" txt "): "))))

(define (TODO [txt  ""])
  (todo/done-entry "TODO" txt TODO-COLOR TODO-BACKGROUND))

(define (DONE [txt ""])
  (todo/done-entry "DONE" txt DONE-COLOR DONE-BACKGROUND))
)

One thing I like about Emacs' @hyperlink["http://www.org-mode.org"]{Org-mode}
(a major mode for note taking, todo lists and everything else) is that it
highlights any "TODO" or "DONE" labels. This makes it easy to get an overview
what topics still have to be done. At the moment I am working in a small group
and I organized our todo points and the resulting documents with Racket and
Scribble (and at first with Org-Mode). I put all todo points in a Scribble
document and added this small Racket snippet for green and red labels:

@racketblock[(define TODO-COLOR "black")
(define TODO-BACKGROUND "red")
(define DONE-COLOR "black")
(define DONE-BACKGROUND "green")

(define (todo/done-entry label txt color background)
  (element (style #f (list (color-property color)
                           (background-color-property background)))
           (if (string=? txt "")
               label
               (string-append label " (" txt "): "))))

(define (TODO [txt  ""])
  (todo/done-entry "TODO" txt TODO-COLOR TODO-BACKGROUND))

(define (DONE [txt ""])
  (todo/done-entry "DONE" txt DONE-COLOR DONE-BACKGROUND))]

Therefore I get nice red and green labels:
@itemlist[@item{@DONE{Jack} Write specification for our new Great program.}
@item{@TODO{John} Develop our new Great program}
@item{@TODO[] Write user manual}]

I put the snippet in a Racket source file and included it with @code[#:lang "at-exp racket"]|{@(require
"foo.rkt")}| but it's of course possible to include it directly in a Scribble
document.