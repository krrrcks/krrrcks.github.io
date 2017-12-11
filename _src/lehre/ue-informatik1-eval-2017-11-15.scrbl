#lang scribble/manual

@(require "format-eval.rkt")
@(define EVALUIERUNG
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
        (vector 2 2 1 1 1 1 1 1 1 2 1 1 1)))

@title[#:version "" #:date "2017-11-15"]{Evaluierungsergebnis Übung Informatik}

Die Veranstaltung war eine ganztägige Übung für die Vorlesung
Informatik 1 und die Studierenden wurden gebeten, pro Kategorie eine
Bewertung von: "++" trifft voll zu, "+" trifft meistens zu, "0" trifft
teilweise zu, "-" trifft selten zu, "- -" trifft überhaupt nicht zu
vorzunehmen.

@itemlist[#:style 'ordered @item{Die Veranstaltung ist klar strukturiert.
@tabular-result[EVALUIERUNG 0]
}
@item{Die verwendeten Veranstaltungsunterlagen sind hilfreich.
@tabular-result[EVALUIERUNG 1]}
@item{Ein Bezug zwischen Theorie und Praxis wird hergestellt.
@tabular-result[EVALUIERUNG 2]}
@item{Das Thema der Veranstaltung ist interessant.
@tabular-result[EVALUIERUNG 3]}
@item{Ich würde diese Veranstaltung weiterempfehlen.
@tabular-result[EVALUIERUNG 4]}
@item{Der Dozent/die Dozentin ist vorbereitet.
@tabular-result[EVALUIERUNG 5]}
@item{Der Dozent/die Dozentin benutzt geeignete Medien (z.B. Tafel, Folien, Laptop).
@tabular-result[EVALUIERUNG 6]}
@item{Der Dozent/die Dozentin geht auf Fragen ein.
@tabular-result[EVALUIERUNG 7]}
@item{Der Dozent/die Dozentin regt zur aktiven Mitarbeit an.
@tabular-result[EVALUIERUNG 8]}
@item{Der Dozent/die Dozentin vermittelt Inhalte verständlich und anschaulich.
@tabular-result[EVALUIERUNG 9]}
@item{Der Dozent/die Dozentin ist im Umgang mit den Studierenden freundlich und aufgeschlossen.
@tabular-result[EVALUIERUNG 10]}
@item{Der Dozent/die Dozentin zeigt Engagement.
@tabular-result[EVALUIERUNG 11]}
@item{Insgesamt beurteile ich die Veranstaltung positiv.
@tabular-result[EVALUIERUNG 12]}]
