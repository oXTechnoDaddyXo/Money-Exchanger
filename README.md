# Money-Exchanger
Simple Money exchanging
<img width="1536" height="1024" alt="gold" src="https://github.com/user-attachments/assets/0c430a4f-e03c-43c8-836a-e5969e80f451" />

# khali_money_exchanger

## ENGLISH

A modern RedM Gold/Cash Exchange script for VORP with a fully animated Old Western glow styled NUI.

---

## FEATURES

- VORP Core Support
- Multiple locations
- Gold ↔ Cash exchange
- Daily exchange rate
- Animated NUI
- Old Western design
- Glow effects
- Multi language (DE/EN)
- Custom notify
- Auto close after exchange
- Map blips
- Player cash & gold display
- Prompt system using G key

---

## INSTALLATION

1. Put the folder into your `resources` folder

2. Start the resource:

```cfg
ensure khali_money_exchanger
```

3. Done

---

## DEPENDENCIES

- vorp_core

---

## CONFIGURATION

### Change language

```lua
Config.Locale = "DE"
```

or

```lua
Config.Locale = "EN"
```

---

### Change locations

```lua
Config.Locations = {

    vector3(-308.11, 773.92, 118.70),
    vector3(1292.91, -1301.84, 77.04)
}
```

---

### Change key

```lua
Config.OpenKey = 0x760A9C6F
```

---

## EXCHANGE RATE

The exchange rate changes automatically every day.

Example:

- 1 Gold = 3 Cash
- 1 Cash = 0.33 Gold

---

## SUPPORT

Script Name:

`khali_money_exchanger`
