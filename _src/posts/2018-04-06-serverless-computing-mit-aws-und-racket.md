    Title: Serverless Computing mit AWS und Racket
    Date: 2018-04-06T12:19:39
    Tags: IT, Racket, AWS, DRAFT

Für eine kleine Programmierarbeit hatte ich mich entschieden, die
Umsetzung in einer "serverlosen" Umgebung mit Amazon Web Services
auszurollen. Im Folgenden meine Erfahrungen und was ich dabei gelernt
habe.

<!-- more -->

## Anforderungen

Es war ein kleiner Web-Dienst zu schreiben, bei dem auf HTTP-Request
einige Daten in Amazon S3 abgelegt werden sollten.

## Umsetzung

Für die Umsetzung habe ich erstmals das API Gateway genutzt und dann
eine Lambda-Funktion hinter die API-Endpunkte konfiguriert. Hierbei
muss man etwas aufpassen, wie die Eigenschaften des HTTP-Requests
weitergereicht werden und wie das entsprechende Antwortdokument
aussehen muss. 

Ausführungsrolle 

Wrapper-Code für den Racket-Prozess. 

Der Wrapper-Code startet den Racket-Prozess und kommuniziert über die
Standard-Eingabe und Standard-Ausgabe. Das hat den Vorteil, dass der
Racket-Prozess bei wiederholten Aufrufen erhalten bleibt und nicht so
viel Zeit mit dem Starten des Prozesses verbraucht wird. (Siehe hierzu
auch den Blogpost für Details). Somit lassen sich recht kurze
Antwortzeiten erzielen.

Was mir am Ende noch etwas unklar blieb, ist, wie ich die Rechte der
Ausführungsrolle auch in mein Racket-Code bekomme. Ich habe zwar eine
Idee, aber in der mir zur Verfügung stehenden Zeit konnte ich das
nicht testen und umsetzen.

## Was ich gelernt habe:

- Der Großteil meines Codes ist auch komplett lokale auf meinem
  Notebook lauffähig. So konnte ich sicherstellen, dass der Code
  inhaltlich das richtige macht und etwaige Probleme bei den
  Einstellungen der Ausführungsumgebung verorten.

- Die Ausführungsumgebung von Amazon Lambda hat die Zeitzone UTC. Das
  ist eine gute Entscheidung, fiel mir allerdings erst auf, als ich
  einige Zeitstempel angeschaut habe.

- Einige male (nicht bei jedem Test) hing meine Lambda-Funktion und es
  gab einen Time-Out. Wie ich herausfand, trat das wohl dann auf, wenn
  der Funktion nicht genügeng Hauptspeicher zugewiesen wurde. Der
  Praxistipp ist hier, erst einmal mit etwas mehr Hauptspeicher zu
  beginnen, die Ausführung unter verschiedenen Bedingungen zu
  beobachten und dann etwas nach unten zu justieren. 

- Das Herumklicken auf der Management-Konsole von AWS wird schnell
  sehr nervig. Statt dessen sollte man für wiederholende Aufgaben
  zügig auf die Kommandozeilenwerkzeuge wechseln. Ich habe mir dann
  Skripte bzw. Makefiles gebaut, die die wesentlichen Schritte
  ausgeführt haben.

- Das Erstellen eines ZIP-Archivs mit dem NodeJS-Wrapper, dem
  kompilierten Programm sowie das Hochladen als AWS Lambda-Funktion
  ist recht zeitaufwändig, man wartet also immer mal wieder einige
  Sekunden.

- Klar ist, dass nicht alles auf Anhieb funktioniert. Wenn man eine
  REPL und Inspektionswerkzeuge seiner Sprache gewohnt ist, dann ist
  das Debuggen von Lambda-Funktionen schwierig, nervig und
  zeitraubend. Man kann der Funktion Daten mitgeben und sich in den
  CloudWatch-Logfiles Ausgaben anzeigen lassen. Für jede Änderung muss
  man aber neu kompilieren und das Paket mit dem Wrapper neu hochladen
  und neu testen.  Ich habe zum Debuggen das Produkt X-Ray
  ausprobiert, da konnte ich zumindest sehen, welche etwaigen weiteren
  Aufrufe (bspw. zu Amazon S3) scheiterten und warum.

- Der gesamte Prozess aus Kompilieren, Zusammenpacken, Hochladen, mit
  Testdaten füttern, Logfiles ansehen fühlt sich recht pelzig an. Ich
  fühlte mich etwas an die Zeiten im Rechenzentrum erinnert, in denen
  man seinen Code als Stapel Lochkarten abgegeben hat und dann in
  seinem Fach einen Zettel mit "Syntax Fehler in Zeile 3"
  zurückerhalten hat.
