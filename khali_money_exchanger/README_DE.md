# khali_money_exchanger

## DEUTSCH

Ein modernes RedM Gold/Cash Exchange Script für VORP mit komplett animierter NUI im Old Western Glow Style.

---

## FEATURES

- VORP Core Support
- Mehrere Standorte
- Gold ↔ Cash Wechsel
- Täglicher Wechselkurs
- Animierte NUI
- Old Western Design
- Glow Effekte
- Mehrsprachig (DE/EN)
- Eigene Notify
- Automatisches Schließen nach Wechsel
- Blips auf der Karte
- Spieler Cash & Gold Anzeige
- Prompt-System mit Taste G

---

## INSTALLATION

1. Ordner in den `resources` Ordner legen

2. Resource starten:

```cfg
ensure khali_money_exchanger
```

3. Fertig

---

## ABHÄNGIGKEITEN

- vorp_core

---

## KONFIGURATION

### Sprache ändern

```lua
Config.Locale = "DE"
```

oder

```lua
Config.Locale = "EN"
```

---

### Standorte ändern

```lua
Config.Locations = {

    vector3(-308.11, 773.92, 118.70),
    vector3(1292.91, -1301.84, 77.04)
}
```

---

### Taste ändern

```lua
Config.OpenKey = 0x760A9C6F
```

---

## WECHSELKURS

Der Wechselkurs wird täglich automatisch generiert.

Beispiel:

- 1 Gold = 3 Cash
- 1 Cash = 0.33 Gold

---

## SUPPORT

Script Name:

`khali_money_exchanger`
