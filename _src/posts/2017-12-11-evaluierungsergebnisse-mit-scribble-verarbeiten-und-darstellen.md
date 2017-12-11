    Title: Evaluierungsergebnisse mit Racket/Scribble verarbeiten und darstellen
    Date: 2017-12-11T17:58:35
	Tags: Racket, Scribble, Lehre

Auch in diesem Jahr habe ich (zum Teil mit Stephan Brunner zusammen)
wieder Lehrveranstaltungen für StudiumPlus durchgeführt. 

Die Ergebnisse finden sich jeweils als Link auf
der [Seite mit meinen Lehrveranstaltungen](/ueber/lehre.html). Im
Folgenden beschreibe ich, wie ich in diesem Jahr die Ergebnisse der
Evaluierung mit Racket und Scribble verarbeitet habe.

<!-- more -->

Im vergangenen Jahr wurde eine zentrale Evaluierung der
Lehrveranstaltungen von StudiumPlus durchgeführt. Die Studierenden
konnten zu 13 Fragen ihre Einschätzung von "trifft voll zu" über
"trifft meistens zu", "trifft teilweise zu", "trifft selten zu" zu
"trifft überhaupt nicht zu" abgeben. Von der Hochschule erhielten wir 
dann eine Auswertung mit der Anzahl der jeweils gegebenen
Einschätzungen pro Frage sowie der relativen Häufigkeit.

Nachdem ich in diesem Jahr eine Übung im Rahmen einer Vorlesung
übernommen hatte, wusste ich nicht, ob dieser Teil eine eigene
Evaluierung erhalten würde. Des Weiteren wurde für die
Zwei-Tages-Module in diesem Jahr keine zentrale Evaluierung angeboten.

Ich habe daher die Fragen vom vergangenen Jahr mit dem Projektor an
die Wand projeziert und die Studierenden um ihre Einschätzung gebeten.

Da ich die Ergebnisse verschiedentlich weiterverwenden wollte, habe
ich mich entschieden, diese in Racket zu verarbeiten und mit Scribble
in ein Dokument (sowie auch Seiten hier auf der Homepage) zu
setzen. Der Code hierfür ist als
Racket-Datei [hier](/_src/lehre/format-eval.rkt) zu finden.

Die Antworten führe ich dann als Liste von Arrays (Vector in
Racket). 

```racket
  (list (vector 3 4 3 1 2 1 2 1 2 3 1 1 2) ; 1
        (vector 2 1 1 1 2 1 1 1 2 #f 1 1 1) ; 2
        (vector 1 4 1 1 2 1 2 2 2 3 1 1 1) ; 3
        (vector 2 3 1 1 2 2 2 2 2  2 1 1 2) ; 4
		...)
```

Um die Häufigkeiten für eine Frage zu ermitteln, extrahiere ich
mittels `vector-ref` und `map` sämtliche Antworten zu einer Frage. Hat
ein Studierender nicht oder nicht leserlich geantwortet, habe ich
jeweils `#f` eingetragen, die ich aus der Ergebnisliste entferne:

```racket
(define (sample-question loe no)
  ;; Gibt alle Antworten auf eine Fragenummer
  (remove* (list #f) (map (lambda (answers) (vector-ref answers no)) loe)))
```

Als Ergebnis erhalte ich eine Liste mit
Antworten (wobei die Antworten derart kodiert sind, dass eine `1` für
"trifft voll zu" und eine `5` für "trifft überhaupt nicht zu" steht), zum Beispiel: 

```racket
'(4 1 4 3 3 5 4 3 3 4 3 2 4 1 4 1 3 3 2 2 2)
```
Für die Weiterverarbeitung habe ich im `math` Modul die praktische Funktion [`samples->hash`](http://docs.racket-lang.org/math/stats.html#%28def._%28%28lib._math%2Fstatistics..rkt%29._samples-~3ehash%29%29) gefunden, die einem das Zählen abnimmt und einen Hash-Table mit der absoluten Häufigkeit zurückgibt:

```racket
> (samples->hash '(4 1 4 3 3 5 4 3 3 4 3 2 4 1 4 1 3 3 2 2 2))
'#hash((4 . 6) (3 . 7) (2 . 4) (1 . 3) (5 . 1))
``` 

Hieraus habe ich dann eine Formatierung in eine Liste zusammengestellt, die anschließend in ein `tabular` eingebettet werden kann:

```racket
> (result EVALUIERUNG 0)
'(("Bewertung" "++" "+" "0" "-" "- -")
  ("Anzahl" "5" "7" "8" "2" "0")
  ("in v.H." "22.73" "31.82" "36.36" "9.09" "0.00"))
```

Etwas gekämpft hatte ich einige Zeit mit dem Umstand, dass ein
sogenannter `content` ein String sein muss und nicht einfach eine
Zahl. Man muss also die vorher ausgerechneten Werte via
`number->string` in einen String umwandeln, damit Scribble diese
verwenden kann.

Da ich die Parameter für die Tabular-Umgebung auch nicht immer wieder
tippen wollte, habe ich hierfür auch eine Funktion geschrieben, so
dass es im Scribble-Dokument wie folgt aussieht (gegeben, dass sich
hinter EVALUIERUNG die Liste der Arrays mit den Antworten verbirgt):

```scribble
@itemlist[#:style 'ordered @item{Die Veranstaltung ist klar strukturiert.
@tabular-result[EVALUIERUNG 0]
}
@item{Die verwendeten Veranstaltungsunterlagen sind hilfreich.
@tabular-result[EVALUIERUNG 1]}
...
```
Das Ergebnis kann man am Beispiel der letzten Veranstaltung [hier](/lehre/iot-eval-2017.html) einsehen, die zugehörige Scribble-Datei ist [hier](/_src/lehre/iot-eval-2017.scrbl) einsehbar. 

Der Vorteil für mich liegt bei dieser Vorgehensweise darin, dass ich
die Antworten in strukturierter Form behalte und auch noch für andere
Zwecke weiter verwenden kann. Darüberhinaus ist diese Ausgabe mittels
Scribble vielfältig nutzbar: Ich erzeuge bspw. daraus ein PDF-Dokument
(über LaTeX) und eine Seite hier auf der Homepage mit dem statischen
Seitengenerator Frog. Und, ich musste keine Tabellenkalkulation
verwenden.

