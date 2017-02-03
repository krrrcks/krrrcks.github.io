	Title: Programm-Bibliotheken und verschiedene Versionsstände
	Date: 2011-10-16T00:00:00
	Tags: Homepage, Org-Mode, IT

Ich bin ein sehr intensiver Nutzer von
[Org-Mode](http://www.orgmode.org), einem speziellen Modul/Modus für den
Emacs-Editor (ich habe hier auf meiner Homepage auch einmal mit einer
kleinen [Seite](http://archive.dbrunner.de/it/org-mode.html) dazu begonnen). Nun ja, was soll man
sagen: Bei Emacs wird eine recht alte Version mitgeliefert. Ich wollte
dann mal auch wegen einiger Funktionen die neueste nutzen. Also via
`git` heruntergeladen und eingebunden und Peng, irgendwas funktioniert
natürlich nicht mehr: Ich benötige pratisch täglich den Export von
Org-Mode-Dateien nach `LaTeX`, der wollte aber nicht mehr. Nun kann ich
zwar Lisp, aber das Emacs Lisp ist doch etwas speziell und die
Debug-Möglichkeiten sind etwas … nun ja, altbacken. Kurzum: Das macht
überhaupt keinen Spaß. Im Endeffekt habe ich dann herausgefunden, dass
unter bestimmten Umständen Teile des alten, bei Emacs mitgelieferten
Codes nachgeladen wird anstelle der neuen Distribution. Diese
bescheidene Art von Emacs mit Modulen und Paketen umzugehen ist wirklich
erschreckend. Was dafür wiederum total toll war: In der von mir
verwendeten Org-Mode-Version war wohl ein Fehler, das ganze Ding über
die Mailingliste geschickt und innert einem halben Tag war der Fehler
von anderen Nutzern und von Carsten Dominik auch gleich gefixt.
Grandiose Antwortzeit!

