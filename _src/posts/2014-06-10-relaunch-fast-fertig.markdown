	Title: Relaunch fast fertig
	Date: 2014-06-10T09:20:03
	Tags: Homepage, Octopress

So, nach einigem Gefummel mit Ruby und Octopress und den
Weiterleitungsmöglichkeiten meines Hosters ist die Sache wohl bald so
am laufen, wie ich mir das vorstelle. Es fehlt noch ein wenig das
Eindeutschen der Octopress-Texte und vielleicht so eine
Kategorien-Liste rechts.

Ansonsten habe ich, um der "Gem-Hölle" zu entgehen, das Octopress in
einen Docker-Container gepackt; hier ist ein
[Link](/blog/2014/06/10/unicode-support-for-octopress/)
zu dem verwendeten `Dockerfile`. Ich habe es dann auch so gemacht,
dass ich das `/opt/octopress`-Verzeichnis auf den Host-Rechner
verschoben habe und in den Container als *Volume* hineinpacke. So kann
ich auf dem Host-Rechner ganz bequem mit dem Emacs die Files editieren
und verwende den Container nur noch für die Erstellung, das "Preview"
und für das Hochladen. 

Die "preview"-Funktion ist übrigens ein wirklich nettes Features: Die
kann man derart nutzen, dass ein Webserver den aktuellen Stand lokal
ausliefert. Dabei beobachtet der Dienst, ob sich Dateien ändern und
erstellt unmittelbar wieder die HTML-Seiten. So kann man bequem im
Editor das Markdown bearbeiten und im Browser daneben das fertige
Ergebnis beurteilen.
