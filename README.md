# Rechnung.sty

Das ist ein Fork von [M G Berberich](https://www.forwiss.uni-passau.de/~berberic/TeX/Rechnung/index.html)
bzw der von Ulrich Sibiller verbesserten Version.

Die Originalversion wurde um ein Makefile ergänzt.

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
