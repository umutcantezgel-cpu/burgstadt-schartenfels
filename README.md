# Burgstadt Schartenfels – Spuk im Gewölbe

Pixel-Krimi in der Ich-Sicht (Flutter): Eine Geburtstagsfeier auf Burg Schartenfels, der Strom fällt aus,
im Gewölbe ist etwas passiert. Du bist das Geburtstagskind und ermittelst – allein mit Bots in allen
übrigen Rollen (Besetzung 4–20) oder im lokalen WLAN mit Freunden.

## Starten

```
flutter pub get
flutter run            # Gerät oder Chrome
flutter build web --release --no-web-resources-cdn
```

Im Browser kann man einer WLAN-Partie beitreten; eröffnen kann sie nur die App.

## Prüfen

```
bash tool/alle_tests.sh            # Gesamtlauf aller Ebenen (mit „schnell“ ohne Web-Build und Leistung)
(cd packages/burgstadt_spiel && dart run bin/spieltest.dart /tmp/spieltest 4)   # Fall headless bis zum Ende
dart run tool/layout_pruefsumme.dart --pruefe
bash tool/secret_scan.sh
```

## Aufbau

| Pfad | Inhalt |
|---|---|
| `lib/` | App-Hülle (`main.dart`) und Flutter-Anbindung (`burgstadt/`) |
| `packages/burgstadt_core` | Fall, Kanon-Leser, Welt, Prüfungen |
| `packages/burgstadt_spiel` | Bildschirme, Spiellogik, Werkzeuge (`bin/`) |
| `packages/pixel_engine` | Pixel-Renderer, Figuren |
| `packages/room_host` | WLAN-Raum (Gastgeber/Gast) |
| `assets/burgstadt` | Klänge (erzeugt von `tool/ton`) |
| `krimidinner/` | eingefrorene Kopie des Kanons (siehe `krimidinner/KOPIE.md`) |
| `nachtlauf/`, `hd/` | Planung, Belege und Abnahme der Entstehung |

## Herkunft

Ausgelagert aus [umutcantezgel-cpu/werwolf_digital_flutter](https://github.com/umutcantezgel-cpu/werwolf_digital_flutter)
(dort bleiben „Mordakte“, der Partyabend „Spuk im Schlosskeller“ und das Krimidinner). Der Verlauf der
Burgstadt-Dateien ist erhalten. Der Branch `hd-linie` enthält die noch nicht übernommene HD-Arbeit.
