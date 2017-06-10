	Title: Verrechnen leicht gemacht
	Date: 2010-06-13T15:10:00
	Tags: Statistik, IT

Folgende Ereignisse finde ich ja sehr erhellend: Telepolis
[berichtete](http://www.heise.de/tp/blogs/3/121897) von einer Studie
(Pollet und Nettle, 2009), in der anhand von Daten aus dem "Chinese
Health and Family Life Survey" der Schluss gezogen wurde, dass die Zahl
der Orgasmen einer Frau mit dem Einkommen des Partners ansteige:

> "In a large representative sample of the Chinese population, we found
> evidence that women's self-reported orgasm frequency increases with
> the income of their partner." (Pollet und Nettle, 2009, S. 149)

Etwas später [berichtete](http://www.heise.de/tp/blogs/3/147390)
Telepolis, dass dem wohl doch nicht so sei. Was war passiert? Die
Forscher Esther Herberich und Torsten Hothorn haben die Analysen mit den
frei verfügbaren Daten nachgerechnet und erhielten andere Ergebnisse
(Herberich et al., 2010). Ursache war, dass der in der von Pollet und
Nettle (2009) verwendeten Software (SPSS 15.0) der Algorithmus zur
Auswahl des besten Modells (verwendet wurde ein *ordinal regression
model*) einen Fehler aufwies: Die Kriterien zur Modellauswahl (Akaike
Information Criteion (AIC) und Bayesian Information Criterion (BIC))
wurden in der Standardeinstellung der Modellauswahl falsch berechnet, so
dass die Kriterien eigentlich nicht verglichen werden konnten. In der
Folge kam es zu einer verkehrten Modellauswahl für das beste Modell.
Herberich et al. berechneten die Analysen mit
[R](http://www.r-project.org) neu und kamen zu anderen Ergebnissen: So
konnte das Modell durch die Aufnahme weiterer Variablen verbessert
werden; und zwar derart, dass der Einfluss des Einkommens letztendlich
nicht mehr signifikant war. In der Korrektur ihres Beitrages fassen
Pollet und Nettle (2010) dies wie folgt zusammen:

> The association in the CHFLS (Chinese Health and Family Life Survey,
> D.B.) data between partner wealth and self-reported orgasm frequency
> ist best explained by the fact that women with higher-income partners
> are healthier, happier, younger, and more educated than women with
> lower-income partners. The data do not support a direct effect of
> partner income on self-reported orgasm frequency, once other variables
> have been controlled for." (Pollet und Nettle, 2010, S. 149)

Zusammengefasst: (1) Erst durch das Bereitstellen der Daten konnte ein
anderes Forscherteam die Anwendung der Methode prüfen und stieß auf die
oben skizzierten Merkwürdigkeiten. Somit war es möglich, nach den
Ursachen für die falsche Modellauswahl zu suchen. (2) Es zeigt sich,
dass eine geschlossene, proprietäre Implementierung so ihre Tücken hat;
wenn eine Gemeinschaft gegenseitig Kontrolle über Implementierungen von
Modellen übt und sie verbessert, kann auch hier wieder ein System der
gegenseitige Kontrolle wirksam werden, was zu einer höheren Qualität
führen kann.

Literatur:

* *Pollet, T. und Nettle, D.* (2009), Partner Wealth predicts
self-reported orgasm frequency in a sample of Chinese women, Evolution
and Human Behavior, Volume 30, S. 146-151.
*  *Herberich, E., Hothorn, T., Nettle, D. und Pollet, T.* (2010), A
re-evalutation of the statistical model in Pollet and Nettle 2009,
Evolution and Human Behavior, Volume 31, S. 150-151 (sowie der Online
Appendix).
* *Pollet, T. und Nettle, D.* (2010), Correction to Pollet and Nettle (2009): "Partner wealth predicts self-reported orgasm frequency in a sample of Chinese women", Evolution and Human Behavior, Volume 31, S. 149.
