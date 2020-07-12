# Rechnung.sty

Das ist ein Fork von [M G Berberich](https://www.forwiss.uni-passau.de/~berberic/TeX/Rechnung/index.html)
bzw der von Ulrich Sibiller verbesserten Version.

Diese Version wurde wiederum mehrfach erweitert und um ein Makefile ergänzt.

## Beschreibung

rechnung.sty ist der Versuch das Erstellen von Bestellungen und Rechnungen mit LaTeX 2e zu erleichtern.
Dazu verfügt rechnung.sty über folgende Fähigkeiten:

* Automatisches Durchnumerieren der Positionen
* Automatischer Umbruch langer Artikelbezeichnungen
* Varianten mit und ohne Artikelnummern
* Berechnung der Preise aus Anzahl und Einzelpreis
* Einstellbare Währung
* Berechnung der Gesamtsumme und der Mehrwertsteuer
* Bestellungen, Netto-Rechnungen und Brutto-Rechnungen
* Gesamtsumme und Mehrwertsteuer sind nachher noch zugreifbar.
* Mehrwertsteuer wird separat in zwei Zeilen ausgegeben.
* horizontale Trennlinien zwischen den einzelnen Artikeln können abgeschaltet werden.

## Einschränkungen/bekannte Bugs:

* rechnung.sty bricht zwar die Tabelle um, fügt aber nach einem Umbruch keine neue Kopfzeile ein.

## Installation

Die installation kann entweder durch das Kommando `make install && make install.dvi` automatisiert oder manuell ausgeführt werden:

### Manuelle installation

* Zuerst rechnung.sty erzeugen: `latex rechnung.ins`
* Dann die Dokumentation: `latex rechnung.dtx`
* rechnung.sty muss in den Pfad von LaTeX 2e `.../tex/latex/`, wobei „`...`“
  systemspezifisch ist. In den meisten Linux-Distributionen ist `~/texmf` der
  typische Ort, sodass der gesamte Pfad `~/texmf/tex/latex/` wäre.

