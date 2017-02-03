	Title: "Ich habe mal Octopress aktualisert"
	Date: 2014-12-21T11:58:16
	Tags: Homepage, Octopress 

Neulich fiel mir auf, dass die Suchfunktion, die auf Google basiert,
nicht nur auf der eigenen Homepage, sondern im "gesamten" Suchindex
von Google gesucht hat. Eben flatterte dieser
[Tweet](https://twitter.com/octopress/status/546528904115404800) mit
[Link](https://github.com/imathis/octopress/commit/514ed5eb9f6bb91a6f3288febf3c2ba892a9b693)
zu einem Fix an mir vorbei und da hat sich wohl die API geändert. 

![Octopress-Tweet](/img/2014-12-21-octopress.png)

Also habe ich mich einmal an den
[Hinweisen](http://octopress.org/docs/updating/) zum Aktualisieren von
Octopress orientiert. Hierzu werden die folgenden Schritte vorgeschlagen:

```
git pull octopress master      # Get the latest Octopress
bundle install                 # Keep gems updated
rake update_source             # update the template's source
rake update_style              # update the template's style
```

Soweit lief das auch. Es tauchten anschließend zwei Probleme auf:

1. Das `execjs` jammerte, dass ihm irgendwie eine
   JavaScript-Bibliothek fehlte. Nach kurzer Recherche gab es die
   Empfehlung, die Zeile `gem 'therubyracer'` in das `Gemfile`
   aufzunehmen. Okay, das funktionierte schon einmal.

2. Bei den Feeds für die Kategorien jammerte das Octopress ein
   ungültiges Layout an. In `category_feed.xml` stand in der Tat
   `layout: nil`. Ich habe das auf `layout: page` geändert. Nun tat
   auch dies.

Mit dem Update funktioniert nun auch das Such-Formular wieder. 

**Ergänzung:** Ich lasse das Jekyll und Octopress in einem
   [Docker-Container](/blog/2014/06/10/relaunch-fast-fertig/) laufen und irgendwie bekam ich bei `rake preview`
   meine Seite nicht mehr zu sehen. Da ich mich mit Ruby und den
   Komponenten nicht so gut auskenne, weiß ich nicht, ob mein "Fix" so
   gut ist: Ich habe im `Rakefile` den `rackup`-Aufruf um den
   Parameter `-o 0.0.0.0` ergänzt. Dann bekam ich vom Host wieder eine
   Verbindung zum Webserver im Octopress-Container. 

**Update vom 04. Januar 2014:** Nach einem kurzen
  [Gespräch](https://twitter.com/Krrrcks/status/546667456128114688)
  via Twitter habe ich mich entschieden, den eingebauten Server doch
  wieder so zu belassen, wie es im `Rakefile` ursprünglich
  stand. Statt dessen habe ich einfach in dem Docker-Container einen
  `nginx` hinzuinstalliert, der dann mein `public`-Verzeichnis an den
  Port 4000 ausliefert. So funktioniert es wieder prima: Ich starte
  den `nginx` und lasse dann das `rake watch` laufen, um die Seiten
  immer wieder neu zu erzeugen, wenn sich Dinge geändert haben. 
