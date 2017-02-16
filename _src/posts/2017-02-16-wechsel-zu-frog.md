    Title: Mein Wechsel zu Frog
    Date: 2017-02-16T11:08:04
    Tags: Homepage, Racket, Frog

Bisher habe ich mein Blog mit [Octopress](http://www.octopress.org)
bereit gestellt. Eine neue Version ("3.0") ist auf
dem
[Weg](http://octopress.org/2015/01/15/octopress-3.0-is-coming/). Nachdem
in letzter Zeit die einen oder anderen Schwierigkeiten mit meiner
Octopress-Installation auftauchten, habe ich mich entschieden, mit dem 
Blog auf [Frog](https://github.com/greghendershott/frog), ebenfalls
ein Generator für statische Blogseiten, zu wechseln.

## Meine Erfahrungen mit Octopress

* Ich hatte Octopress und alle Abhängigkeiten in einen Docker-Container [gepackt](/2014/06/10/relaunch-fast-fertig/). Das war ganz sinnvoll, um die Ruby-Bibliotheken-Abhängigkeitshölle in den Griff zu bekommen. Es hatte mich aber nur bedingt glücklich gemacht, da ich immer auf Docker angewiesen war, um einen Blogpost zu erzeugen.
* Einige der Sachen, die [Brandon Mathis (dem Autor von Octopress)](http://octopress.org/2015/01/15/octopress-3.0-is-coming/) aufgezeigt hatte, fand ich auch überarbeitungsbedürftig (bspw. das Ausliefern über Git und die enge Verzahnung, die Updates schwierig machte). 
* Was mir sehr gut gefallen hat, war das Layout und Thema sowie auch die Zahl an Plugins und Erweiterungsmöglichkeiten. Da wird mir doch die eine oder andere Möglichkeit fehlen.

## Warum nun Frog?

Es gibt ja viele Generatoren für statische Homepages und Blogs. Ich habe mich für den Generator 
[Frog](https://github.com/greghendershott/frog) von Greg Hendershott entschieden. Es sprach für mich dafür:

* Frog ist in [Racket](http://www.racket-lang.org) geschrieben und da ich das praktisch täglich für allerlei Sachen benutze, liegt es mir deutlich näher als Ruby und ich kann die Abhängigkeiten etc. besser beurteilen und ggf. beheben. 
* Frog verwendet im Standard ein paar HTML-Templates, die dann eine Seite mit Bootstrap-CSS etc. bereit stellen. Da ich eh das eine oder andere mit Bootstrap mache bzw. vorhabe, ist das für mich eine ganz gute Lernmöglichkeit.
* Die Anpassung von Templates ist für mich einfacher als bei Octopress, da ich dort direkt Racket-Code eingeben und nutzen kann.
* Wie Octopress/Jekyll verarbeitet Frog Markdown als Eingabeformat. Allerdings kann man auch [Scribble](https://docs.racket-lang.org/scribble/index.html)-Dateien zum Schreiben von Seiten und Posts verwenden. Scribble verwende ich zwischenzeitlich recht oft als Dokumentations- bzw. Schreibwerkzeug, so dass das ein nettes zusätzliches Feature ist. 
* Es wirkt auf mich, als wäre Frog auch etwas schneller als Octopress im Erzeugen der HTML-Seiten. 

## Umstellungsaufwand

Frog verarbeitet ebenso wie Octopress Dateien im Markdown-Format;
allerdings sind die Metadaten etwas anders formatiert (in Octopress
gibt es eine YAML-Präambel). Insofern musste ich alle Blog-Posts
(knapp 60 Stück) und Seiten einmal in die Hand nehmen und
anpassen. Für die Einrichtung und die Anpassung der Files habe ich
ca. eine Stunde gebraucht, dann noch "etwas" Gefummel mit dem CSS und
den DNS-Einträgen für die Github Pages. Also durchaus überschaubar.

## Zukünftiges

Es gibt beim neuen Blog noch einiges, was ich ergänzen möchte ("Letzte
Artikel"-Sidebar, Tag-Sidebar etc.) und mit dem CSS/Thema bin auch
noch nicht so zufrieden, aber es tut zumindest nun schon mal.

Ach ja, zum Thema CSS und Fummeln darf natürlich nicht der übliche
Hinweis auf diesen
(bewegten) [Cartoon](https://imgur.com/gallery/Q3cUg29) fehlen.
