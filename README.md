# Agriculture Science Pack 1.0 – Preview 1

**Version:** `v1.0.0-preview.1`  
**Für:** Farming Simulator 25  
**Enthaltene Mods:** APS 1.0.0.0 & SmartGate 1.0.0.0

Agriculture Science verbindet automatisiertes Fahrzeug- und Geräteparken, intelligente Torsteuerung und koordinierte Fahrzeugservices in einem gemeinsamen System.

Die Navigation erfolgt über **AutoDrive**.

Diese Version ist ein **öffentlich testbarer Entwicklungsstand**. Einzelne Funktionen befinden sich weiterhin in der Erprobung; die abschließende Dedicated-Server-Abnahme steht noch aus.

## Enthaltene Systeme

### A.P.S. – Advanced Parking Sequence

- Bis zu zwei direkt angehängte Geräte nacheinander automatisch abstellen und abkuppeln.
- Fahrzeuge anschließend zum zugewiesenen Parkplatz schicken.
- Unterstützte AutoDrive-Parkanforderungen und Jobende-Übergänge übernehmen.
- Abkuppelzustände für Geräte lernen.
- Bei Bedarf Fahrzeugservices vor dem Parkvorgang ausführen lassen.

### A.S.S. – Autonomous Service Supervisor

A.S.S. ist bereits Bestandteil der APS-Mod und benötigt keine separate ZIP.

- Automatische Auswahl und Reservierung geeigneter Service-Bays.
- **WASH:** Unterstützte Waschstraßen anfahren und das Reinigungsergebnis überprüfen.
- **REPAIR:** Unterstützte Werkstätten einschließlich konfigurierter Hebebühnen verwenden.
- **REFUEL:** Unterstützte native Tank- und Ladeeinrichtungen nutzen.
- Services bei geeigneten Park- oder AutoDrive-Abläufen einschieben und anschließend die ursprüngliche Fahrt fortsetzen.
- Optionale lokale Servicebelege mit Druckeranimation und Soundeffekten anzeigen.

Die humorvollen Werkstattpositionen auf den Belegen sind rein dekorativ und stellen keine echte Kostenabrechnung dar.

### L.E.G.S. – Logical Entrance Guidance System

*Bereitgestellt durch die SmartGate-Mod.*

- Automatische Torsteuerung einschließlich AutoDrive-Voröffnung.
- Konfigurierbare Trigger, Sicherheitsbereiche und Animationsrichtungen.
- Einstellbarer Vorlauf je Tor.
- Service-Provider mit mehreren individuell konfigurierbaren Bays.
- Berücksichtigung von Fahrzeuggröße, Fähigkeiten, AD-Zielen, Belegung und Reservierungen.

### Gemeinsame Funktionen

Deutsche und englische Benutzeroberfläche, gemeinsamer Agriculture-Science-Einstellungsbereich, Voice-Queue, Musik-Ducking und lokale Ingame-Radio-Priorität.

## Voraussetzungen

| Bestandteil | Hinweise |
|---|---|
| Farming Simulator 25 | Zuletzt dokumentierter SP-Teststand: 1.25.0.0 |
| AutoDrive | Erforderlich für APS-/A.S.S.-Fahrten; Referenzversion 3.0.1.4 |
| APS und SmartGate | Beide für die kombinierten A.S.S.-Serviceabläufe erforderlich |
| Servicegebäude | Nur unterstützte, korrekt konfigurierte Einrichtungen |
| Courseplay | Optionale Integration |

AutoDrive, Courseplay und externe Servicegebäude sind **nicht im Download enthalten**.

## Installation

1. Farming Simulator 25 beziehungsweise den Dedicated Server beenden.
2. Vorhandene Mods und Spielstand sichern.
3. `Agriculture_Science_Pack_1.0.zip` entpacken.
4. Die beiden darin enthaltenen Mod-ZIPs in den Mods-Ordner kopieren.
5. **Die einzelnen Mod-ZIPs nicht entpacken.**
6. Alte parallele Modversionen entfernen und beide Mods im Spielstand aktivieren.
7. Einstellungen im Reiter **Agriculture Science** vornehmen.

**Multiplayer:** Server und alle Clients müssen dieselben Moddateien verwenden. Identische Versionsnummern allein reichen nicht.

## Bekannte Einschränkungen

- Nicht jede Waschstraße, Werkstatt oder Tankstelle wird automatisch unterstützt.
- Alle relevanten Fahrzeug- und Gespannteile müssen den tatsächlichen Wirkbereich einer Serviceanlage erreichen.
- Reparaturergebnisse unterliegen den Grenzen der jeweiligen nativen Serviceeinrichtung.
- Vorhandene AutoDrive-Ziele garantieren keine befahrbare Route.
- Der Serviceeditor ist noch nicht vollständig per Controller bedienbar.
- Belegte Service-Bays können zur Ablehnung eines Auftrags führen; eine ausführende Warteschlange mit physischem Nachrücken ist noch nicht enthalten.
- Die finale Singleplayer- und Dedicated-Server-Gesamtabnahme steht aus.

### Experimenteller Drehschemel-Fix

Diese Preview enthält einen **experimentellen Resume-Zusatz**, der Stillstände nach dem Abkuppeln von Drehschemelanhängern beziehungsweise bei der Servicefortsetzung reduzieren soll.

Erste erfolgreiche Singleplayer-Tests liegen vor. Eine allgemeine Kompatibilitäts- oder Dedicated-Server-Garantie besteht nicht.

## Noch nicht enthalten

Das geplante Mass Maintenance Protocol, eine vollständige Service-Warteschlange, DevTools, zusätzliche private Voicepacks, Ordis-/Warframe-Medien und echte wirtschaftliche Ticketabrechnungen sind kein Bestandteil dieser Preview.

## Downloads und Prüfsummen

**Komplettpaket:** `Agriculture_Science_Pack_1.0.zip`

SHA-256:

`879eb0c50c53271969ff155e0e1bd66dee35503a5cc95f94d8c5401a42c4960c`

**Enthaltene Moddateien:**

`FS25_APS_AgricultureScience.zip`

SHA-256:

`f344f327a2aadccbc35dfb82e2927f676fbfc260732ed70ac50090bb2e7fcd70`

`FS25_SmartGate_AgricultureScience.zip`

SHA-256:

`bf58d0cdd7e8dcf71c9a34eec9aab82ef4777488a8e69a0ad7b18b8231588123`

Die ZIP-Struktur, CRC-Prüfungen und Entpacktests wurden laut Release-Vorbereitung erfolgreich durchgeführt.

## Feedback und Fehlermeldungen

Diese Preview dient insbesondere dazu, weitere Erfahrungen mit unterschiedlichen Fahrzeugen, Geräten, Serviceeinrichtungen und Multiplayer-Konfigurationen zu sammeln.

Bitte bei Fehlermeldungen nach Möglichkeit folgende Informationen angeben: Spielversion, AutoDrive-Version, Singleplayer oder Dedicated Server, betroffene Funktion, Schritte zur Reproduktion und relevante Ausschnitte aus `log.txt`.

---

**Agriculture Science Pack 1.0 – Automate smarter. Farm better.**

*Development Preview · Not a final stable release*
