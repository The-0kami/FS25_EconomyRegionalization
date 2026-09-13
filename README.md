# Agriculture Science Mod Depot

Dieses Repository dient als kleiner externer Mod-Speicher fuer den **Bauer von Nebenan / Agriculture Science Launcher**.

Die eigentlichen Mod-ZIPs sollen nach Moeglichkeit als **GitHub Release Assets** abgelegt werden. Das Repository selbst enthaelt nur Metadaten, Hinweise und ggf. eigene Quelltexte.

## Zweck

- Mods aus Quellen bereitstellen, die der Launcher nicht direkt aufloesen kann.
- Direkte, stabile Download-URLs fuer `master_mods.txt` bereitstellen.
- Fremde Hoster-spezifische Logik aus dem Launcher fernhalten.
- Eigene One-Off-/Troll-Mods koennen weiterhin hier liegen.

## Struktur

- `depot.json` – optionale Uebersicht ueber Depot-Eintraege.
- `templates/mod-entry.example.json` – Vorlage fuer neue Eintraege.
- Release Assets – eigentliche ZIP-Dateien.
- Bestehende Dateien von `FS25_EconomyRegionalization` bleiben vorerst erhalten.

## Empfohlener Ablauf

1. Mod-ZIP lokal beschaffen.
2. Vor dem Spiegeln pruefen, ob die Weiterverteilung erlaubt ist.
3. Neues GitHub Release oder bestehendes Depot-Release verwenden.
4. ZIP als Release Asset hochladen.
5. Direkte Release-Asset-URL in `master_mods.txt` des Launchers eintragen.
6. Optional den Eintrag auch in `depot.json` dokumentieren.

## Beispiel fuer `master_mods.txt`

```text
https://github.com/The-0kami/FS25_EconomyRegionalization/releases/download/depot-2026-09/FS25_BeispielMod.zip
```

## Bestehende eigene Mod

`FS25_EconomyRegionalization` bleibt eine eigene kleine One-Off-Mod fuer `FS25_additionalCurrencies` und kann hier weiterhin mitverwaltet werden.

> AGRICULTURE SCIENCE: Externe Modversorgung. Offiziell genehmigte Feldversuche seit vermutlich eben gerade.
