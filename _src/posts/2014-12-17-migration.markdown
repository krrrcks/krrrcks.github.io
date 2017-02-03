	Title: Migration alter Blog-Einträge
	Date: 2014-12-17T18:11:00
	Tags: Homepage, Org-Mode, Octopress

Es kamen lange Winterabende und ich habe die alten Blog-Einträge von
der mittels Org-Mode erstellten Seite hier nach Octopress
migriert. Im Archiv sind diese zu finden und die Links etc. sollten
nun auch passend mit migriert worden sein.

Bei der Konvertierung habe ich ein Programm kennengelernt, das mir
sehr geholfen hat: [Pandoc](http://johnmacfarlane.net/pandoc/). Das
ist ein Konverter, der Text- und Markupdateien hin und her
konvertieren kann. Dabei beherrscht er eine ganze Reihe von
Formaten. Insbesondere kann er das Org-Mode-Format (das ich für viele
Dinge verwende) ebenso wie LaTeX und Markdown (daneben aber auch noch
eine Legion von Formaten).

Da mein Hauptdateiformat ohnehin "Textdateien" sind ("Never trust a
file that isn't ASCII") ist das sehr praktisch, um zwischen
verschiedenen Markup-Formaten hin und her zu springen.

Für die Migration meine Blog-Einträge lief dies wie folgt: Ich hatte
die in der alten Homepage mit Org-Mode und Org-Jekyll erstellt. Dabei
hatte das Org-Jekyll-Modul entsprechende HTML-Dateien mit einem
YAML-Header erzeugt. Mittels Pandoc konnte ich die nun wieder nach
Markdown konvertieren, habe die YAML-Header ein wenig angepasst,
Kategorien aktualisiert und noch mal das Markup zwecks Zeilenumbrüche,
Fußnoten und Links geprüft und leicht angepasst. Insgesamt sehr
schnell bewältigbar.

Dieser ganze Zoo rund um Markdown und andere ähnliche Formate ist zwar
manchmal ein bisschen unübersichtlich, aber mir gefällt das sehr gut,
dass man mit wenig Markup schön Textdateien strukturieren kann und
dann mit Pandoc auch gut hin und her konvertieren kann.
