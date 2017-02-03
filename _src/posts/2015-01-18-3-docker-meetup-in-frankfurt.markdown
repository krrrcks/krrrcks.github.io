	Title: 3. Docker-Meetup in Frankfurt
	Date: 2015-01-18T20:05:35
	Tags: IT, Docker, Veranstaltungen

Am 13. Januar 2015  fand in Frankfurt das bereits [dritte Docker-Meetup](http://www.meetup.com/Docker-Frankfurt/events/219160756/)
statt, hier einige Notizen von mir dazu. 

## Neues zum Them Orchestrierung

[Peter Rossbach](https://www.twitter.com/PRossbach) hat in einem
munteren Vortrag einige Neuerungen aus dem "Docker Universum" zum
Thema Orchestrierung vorgestellt. Unter anderem
[Docker Machine](https://github.com/docker/machine),
[Docker Swarm](https://github.com/docker/swarm), Docker Compose
(ehemals [fig.sh](http://fig.sh), das wohl aufgrund von
Aussprachemehrdeutigkeiten umbenannt wurde) etc. Ein sehr
interessanter Überblick, insbesondere da Peter auch die ganzen Sachen
immer mal angefasst und ausprobiert hat. Im Kern scheint es mir jedoch
so zu sein, als wäre die Frage nach "Was nimmt man am besten, um
Docker auf einer oder mehreren Maschinen im Produktivbetrieb zu
nutzen?" noch recht in Bewegung. Für mich kristallisiert sich für
meine Anwendungsfälle da bisher noch keine überzeugende Lösung
heraus. Was ich jedoch einmal testen werde ist das fig.sh bzw. Docker
Compose, da man damit eigentlich sehr schön in einem YAML-Dokument
mehrere Container und ihre Abhängigkeiten darstellen kann.

## Docker Linking

[Erkan Yanar](http://linsenraum.de) hat in einem Einsteigervortrag die
Grundlagen von Links zwischen Containern vorgestellt. Hier scheint die
Entwicklung auch noch in Bewegung zu sein, insbesondere Links über
mehrere Hosts hinweg scheinen doch noch nicht so ganz einfach
handzuhaben zu sein (vorgestellt wurden
[Ambassador-Ansätze](https://github.com/SvenDowideit/dockerfiles/blob/master/ambassador/Dockerfile)
mit [socat](http://www.dest-unreach.org/socat/) und anderes).

Besonders erhellend fand ich den Hinweis, dass ab Docker Version 1.3
nun bei Links zwischen den Containern die `/etc/hosts` auch nach
Neustarts von gelinkten Containern immer deren richtige IP-Adresse
erhält, wohingegen die Umgebungsvariablen nur die
Ursprungs-IP-Adressen enthalten (also ein klares "Verlasst Euch nicht
auf die Umgebungsvariablen!"). 

## Netzwerken mit Docker

[Andreas Schmidt](https:/www.twitter.com/aschmidt75) stellte eine
ganze Reihe von Varianten vor, mit denen man die Container im Netzwerk
auf unterschiedliche Arten und Weisen verknoten kann. Soweit ganz
interessant, aber nicht meine "Liga", wo ich mich gut auskenne.

## Fazit 

Bei Docker in Bezug auf Orchestrierung und Container-Linken gibt es
recht viel Bewegung und für mich kristallisieren sich die
überzeugenden Konzepte noch nicht so richtig heraus, um damit in eine
Produktivumgebung zu gehen. Im Bereich der Entwicklung und der Tests
nutze ich die Container von Docker schon recht gerne, bei
Produktiv-Umgebungen schreckt mich die Vielzahl an Werkzeugen und zum
Teil auch die Komplexität doch noch etwas.

Jedenfalls wieder ein gutes Meetup mit Ideen und Anregungen. Ich finde
das schon sehr außergewöhnlich (besonders wenn man es mit anderen
Branchen vergleicht), dass sich Leute zum Austauschen über Technologie
treffen, Vorträge vorbereiten etc. 

## Links zu den Folien

* [Peter Rossbach, Docker Orchestation](https://speakerdeck.com/rossbachp/docker-meetup-frankfurt-2015-docker-orchestration)
* [Andreas Schmidt, Docker Networking](https://speakerdeck.com/aschmidt75/docker-networking)

