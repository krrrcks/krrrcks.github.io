;;; format-eval.rkt
;;;
;;;   StudiumPlus
;;;   Zusammenfassung der Evaluierung fuer Scribble
;;;
;;;   Daniel Brunner

#lang racket/base

(require racket/format
         scribble/base
         math)

(provide result
         format-counts
         tabular-counts
         tabular-result)

;; Eine Evaluierung ist eine Liste von Antworten auf die
;; Evaluierungsfragen (gespeichert in einem Vector) 

(define (sample-question loe no)
  ;; Gibt alle Antworten auf eine Fragenummer
  (remove* (list #f) (map (lambda (answers) (vector-ref answers no)) loe)))

(define (format-counts counts)
  ;; Formatiert die counts (aus samples->hash)
  ;; Eingabe ist ein Hash mit den Noten und ihrer Anzahl
  ;; '#hash((4 . 2) (3 . 8) (2 . 7) (1 . 5))
  ;; Ausgabe (fuer Scribble)
  ;; (list (list 1 2 3 4 5)
  ;;       (list 5 7 8 2 0)
  ;;       (list "22.7" "31.8" "36.4" "9" "0"))
  ;;
  (define no-answers (foldr + 0 (hash-values counts)))

  (define (print-ratio n)
    (~r (* 100 n) #:precision '(= 2)))
  
  (list (list "Bewertung" "++" "+" "0" "-" "- -")
        (list "Anzahl" (number->string (hash-ref counts 1 0))
              (number->string (hash-ref counts 2 0))
              (number->string (hash-ref counts 3 0))
              (number->string (hash-ref counts 4 0))
              (number->string (hash-ref counts 5 0)))
        (list "in v.H." (print-ratio (/ (hash-ref counts 1 0) no-answers))
              (print-ratio (/ (hash-ref counts 2 0) no-answers))
              (print-ratio (/ (hash-ref counts 3 0) no-answers))
              (print-ratio (/ (hash-ref counts 4 0) no-answers))
              (print-ratio (/ (hash-ref counts 5 0) no-answers)))))

(define (result loe no)
  ;; Gibt das Ergebnis fuer Frage no in der Liste der Antworten loe
  (format-counts (samples->hash (sample-question loe no))))

(define (tabular-counts formatted-counts)
  (tabular #:sep (hspace 1)
           #:column-properties '(left right right right right right)
           #:row-properties '(bottom-border ())
           formatted-counts))

(define (tabular-result loe no)
  (tabular-counts (result loe no)))

(module+ test
  (require rackunit)

  (define EVALUIERUNG
  (list (vector 3 4 3 1 2 1 2 1 2 3 1 1 2) ; 1
        (vector 2 1 1 1 2 1 1 1 2 #f 1 1 1) ; 2
        (vector 1 4 1 1 2 1 2 2 2 3 1 1 1) ; 3
        (vector 2 3 1 1 2 2 2 2 2  2 1 1 2) ; 4
        (vector 2 3 2 1 2 2 2 2 2 2 1 1 2) ; 5 
        (vector 3 5 1 1 1 1 2 1 1 2 2 2 2) ; 6 
        (vector 3 4 1 1 2 3 2 1 1 3 1 1 2) ; 7
        (vector 3 3 1 1 2 1 2 2 2 3 2 1 2) ; 8
        (vector 2 3 2 1 2 3 2 2 2 4 2 2 2) ; 9
        (vector 3 4 1 1 2 2 2 1 2 2 1 1 2) ; 10
        (vector 1 3 1 1 1 2 2 4 4 4 1 2 1) ; 11
        (vector 2 2 1 1 2 2 2 1 2 3 1 2 2) ; 12
        (vector 2 4 1 1 2 2 2 2 2 3 1 1 2) ; 13
        (vector 1 1 1 1 1 1 1 1 1 1 1 1 1) ; 14
        (vector 3 4 2 2 2 2 2 2 4 4 2 3 3) ; 15
        (vector 1 1 1 1 1 1 1 1 1 1 1 1 1) ; 16
        (vector 4 3 1 1 3 2 3 2 1 4 2 2 2) ; 17
        (vector 3 3 3 1 2 2 1 1 3 2 1 1 2) ; 18
        (vector 3 2 1 1 1 2 2 1 2 3 1 1 1) ; 19
        (vector 4 2 1 1 1 1 1 1 4 2 1 2 1) ; 20
        (vector 1 #f 1 1 1 1 1 1 1 2 1 1 1 ) ; 21
        (vector 2 2 1 1 1 1 1 1 1 2 1 1 1))) ; 22

  (check-equal? (result EVALUIERUNG 0)
                '(("1" "2" "3" "4" "5") ("5" "7" "8" "2" "0") ("22.73" "31.82" "36.36" "9.09" "0.00")))
  )
