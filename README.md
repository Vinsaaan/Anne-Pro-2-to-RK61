# Anne Pro 2 to RK61 Key Layout Conversion

An AutoHotkey script that converts Anne Pro 2 keyboard layout and functionality to work seamlessly with the RK61 keyboard.

## 🎯 Project Purpose

When switching from **Anne Pro 2** to **RK61**, you lose the familiar key mappings and shortcuts you've grown accustomed to. This script bridges that gap by recreating the Anne Pro 2 experience on your new RK61 keyboard.

## ✨ Key Features

### 🔄 CapsLock Layer System
- **Hold CapsLock**: Access secondary layer (like Anne Pro 2's Fn layer)
- **Tap CapsLock**: Toggle CapsLock on/off normally
- **CapsLock + WASD**: Arrow key navigation with hold support
- **CapsLock + Numbers (1-0,-,=)**: Function keys (F1-F12)

### ⌨️ Arrow Key Remapping
- **Up Arrow**: Types `/` (Shift+Up types `?`)
- **Right Arrow**: Functions as Right Ctrl
- **Left/Down Arrows**: Disabled
- **Maintains arrow functionality**: Through CapsLock + WASD

### 🛡️ Safety Features
- **Anti-stuck mechanism**: Prevents keys from staying pressed
- **Clean state management**: Proper key release handling
- **Failsafe timers**: Automatic cleanup if keys get stuck

## 🚀 Quick Start

1. **Install AutoHotkey v2** from [autohotkey.com](https://www.autohotkey.com/)
2. **Download** the script file (`RK61_to_Anne_Pro_2.ahk`)
3. **Run** the script by double-clicking it
4. **Optional**: Add to Windows startup for automatic loading

## 📋 Complete Key Mappings

### Default Arrow Keys (No CapsLock)
| Key | Function |
|-----|----------|
| ↑ | Types `/` |
| Shift + ↑ | Types `?` |
| → | Right Ctrl |
| ← | Disabled |
| ↓ | Disabled |

### CapsLock Layer Mappings
| Combination | Output | Description |
|-------------|--------|-------------|
| CapsLock + W/A/S/D | ↑/←/↓/→ | Arrow keys with hold support |
| CapsLock + 1-0 | F1-F10 | Function keys |
| CapsLock + - | F11 | Function key |
| CapsLock + = | F12 | Function key |
| CapsLock + P | Ctrl+PrintScreen | Screenshot |
| CapsLock + Esc | ` (Backtick) | Backtick character |
| CapsLock + ↑ | Delete | Delete key |

### 🛡️ Gaming Safety Tips
1. **Close the script** before launching competitive games
2. **Create separate gaming profiles** without AutoHotkey
3. **Use hardware-level remapping** for competitive gaming
4. **Check game-specific policies** before use

## 🔧 Customization
The script is easily customizable. Key mappings are defined in the `allowedKeys` Map:

```autohotkey
allowedKeys := Map(
    "1", "{F1}",        ; CapsLock + 1 = F1
    "2", "{F2}",        ; CapsLock + 2 = F2
    // Add your custom mappings here
)
```

## 🐛 Troubleshooting

### Keys Getting Stuck
- The script includes anti-stuck mechanisms
- If issues persist, press CapsLock to release all keys
- Restart the script if problems continue

### CapsLock Toggle Not Working
- Ensure no other programs are interfering with CapsLock
- Check Windows accessibility settings
- Restart the script

### Gaming Detection Issues
- Always verify the script is closed before launching games
- Use Task Manager to confirm AutoHotkey.exe is not running

## 📁 File Structure

```
rk61-conversion/
├── RK61_to_Anne_Pro_2.ahk  # Main script file
├── README.md               # This file
```

**Disclaimer**: This software modifies keyboard behavior. Use responsibly and be aware of game anti-cheat policies before use in competitive gaming environments.
