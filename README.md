# ShadowTranceAlert

### **A WoW Classic Addon for Warlocks**

ShadowTranceAlert provides a visual alert when the **Shadow Trance** buff (Nightfall proc) is active. It displays pulsing graphics on both sides of your screen, ensuring you never miss a free Shadow Bolt cast again!

---

## Features:
- **Visual Overlay:** Pulsing textures appear on the left and right sides of your screen when Shadow Trance is active.  
- **Automatic Detection:** Monitors your buffs in real-time to detect the **Shadow Trance** proc.  
- **Pulsing Animation:** Textures fade in and out smoothly to draw your attention without being intrusive.  
- **Lightweight:** Minimal performance impact with efficient event handling.

---

## Installation:
1. **Download** the addon files.
2. Place the **ShadowTranceAlert** folder into your `Interface\AddOns` directory:

3. Make sure the addon is enabled in the **AddOns** menu at the character selection screen.

---

## How It Works:
1. When the **Shadow Trance** buff (Nightfall proc) is active, two side textures will appear:
- Left side: Normal texture.  
- Right side: Mirrored texture.  
2. Textures **pulse** (fade in and out) to make them more noticeable.  
3. Buff monitoring updates automatically when your auras change.

---

## Requirements:
- **WoW Classic Era**  
- Tested on **TurtleWoW** servers.  

---

## Visual Demonstration:
Here's an example of what you'll see in-game when **Shadow Trance** procs:

![Shadow Trance Overlay Example](https://github.com/wsmaxcy/ShadowTranceAlert/alert.png)

---

## Technical Details:
- Monitors player auras using `GetPlayerBuffTexture()` for efficient detection.  
- Pulse animation runs on `OnUpdate` for smooth visuals.  
- Triggers on `PLAYER_AURAS_CHANGED` events for minimal CPU usage.

---

## Changelog:
- **v1.0:** Initial release.  
- Buff detection and visual pulse implemented.  
- Lightweight and optimized event handling.  

---

## Troubleshooting:
- **Textures not appearing?**  
- Make sure the addon is enabled in your AddOns menu.  
- Verify the TGA file path in `NightFallAlert.tga` matches your directory.

- **Too intrusive?**  
- Modify the texture alpha range in the Lua file to make it more transparent:
  ```lua
  pulseAlpha <= 0.3 -- Minimum transparency
  pulseAlpha >= 0.8 -- Maximum transparency
  ```

---

## Credits:
- **Author:** [Your Name]  
- Special thanks to the TurtleWoW API for additional inspiration.

---

Enjoy never missing another **Shadow Trance** proc again!
