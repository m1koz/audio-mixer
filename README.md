<p align="center">
  <img src="https://raw.githubusercontent.com/m1koz/audio-mixer/assets/icon@2x.png" width="128" alt="AudioMixer icon">
</p>

<h1 align="center">AudioMixer</h1>

<p align="center">
  Per-app volume, a 10-band equalizer and per-app audio routing for macOS —<br>
  designed to feel like it shipped with the system.
</p>

<p align="center">
  <a href="https://github.com/m1koz/audio-mixer/releases/latest"><img src="https://img.shields.io/github/v/release/m1koz/audio-mixer?display_name=tag&color=0A84FF&label=download" alt="Latest release"></a>
  <img src="https://img.shields.io/badge/macOS-26%20Tahoe%2B-000000?logo=apple&logoColor=white" alt="macOS 26+">
  <img src="https://img.shields.io/badge/Apple%20silicon%20%26%20Intel-universal-34C759" alt="Universal binary">
  <img src="https://img.shields.io/badge/license-proprietary-8E8E93" alt="License">
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/m1koz/audio-mixer/assets/mixer.png" width="860" alt="AudioMixer — Mixer">
</p>

## Why

macOS gives you one volume slider for everything. AudioMixer adds the controls the system never had: turn down that one noisy browser tab, give a voice chat its own equalizer, send music to the speakers while calls stay in your headphones — all from the menu bar, with Liquid Glass and the look of a native macOS 26 app.

## Features

- **Per-app volume** — every app that plays sound gets its own slider and mute, with live level meters.
- **10-band equalizer** — ±12 dB per band, preamp, response curve, 22 built-in presets (Acoustic, Bass Booster, Rock, Vocal Booster …) plus your own presets saved per app. A master equalizer applies on top of everything.
- **Per-app audio routing** — play each app on a different output device: built-in speakers, AirPods, USB interface, HDMI, AirPlay.
- **Pinned apps** — keep your favorite apps at the top, even when they're not playing.
- **Menu bar panel** — a Control Center–style popover with the system output, system volume and every playing app.
- **Liquid Glass & appearance** — regular / clear glass, tint, accent color, light / dark / auto, window backdrop, Control Center or classic sliders, compact rows, menu bar icon style.
- **16 languages** — follows your system language automatically; can be overridden in Settings.
- **Native by design** — no kernel extensions, no virtual audio drivers, nothing to install besides the app. Built on Core Audio process taps, the same technology Apple introduced for system audio capture.

<p align="center">
  <img src="https://raw.githubusercontent.com/m1koz/audio-mixer/assets/equalizer.png" width="860" alt="AudioMixer — Equalizer">
</p>

## Download & install

**Requirements:** macOS 26 Tahoe or later · Apple silicon or Intel.

1. Download **`AudioMixer-1.0.dmg`** from the [latest release](https://github.com/m1koz/audio-mixer/releases/latest).
2. Open the image and drag **AudioMixer** to **Applications**.
3. Launch AudioMixer from Applications or Launchpad.
4. On first launch macOS asks for **System Audio Recording Only** access — click **Allow**. This is the permission Core Audio requires to adjust other apps' sound; nothing is recorded or stored.

> **"Apple could not verify AudioMixer is free of malware"** — the app is distributed outside the App Store and isn't notarized yet. Open **System Settings → Privacy & Security**, scroll down and click **Open Anyway**, or run once in Terminal:
> ```bash
> xattr -dr com.apple.quarantine /Applications/AudioMixer.app
> ```

To verify the download:

```bash
shasum -a 256 -c AudioMixer-1.0.dmg.sha256
```

## Using AudioMixer

| | |
|---|---|
| **Menu bar** | Click the bars icon for the quick mixer: output device, system volume and every app that is playing. Right-click a row for pin, mute, equalizer and reset. |
| **Mixer** | The main window (⌘1). Pinned apps stay on top; *Now Playing* lists everything with sound; *Other Apps* shows apps that used audio recently. |
| **Equalizer** | ⌘2. Pick *All Apps* for the master curve or a single app. Drag the bands, choose a preset or press **Save Preset…** to keep your own — presets belong to the app you saved them for. |
| **Routing** | The speaker icon on each row chooses that app's output device. *System Default* follows whatever you pick in Control Center. |
| **Appearance** | ⌘3. Liquid Glass style and tint, theme, accent, window backdrop, slider style, level meters, menu bar icon. |
| **General** | ⌘4. Launch at login, Dock icon behavior, language, background processes, permission status. |

Settings are applied instantly and remembered per app across launches. Quit AudioMixer and every app goes back to the regular system audio path.

## How it works

AudioMixer uses **Core Audio process taps** (macOS 14.2+). For each app that plays sound it creates a tap that mutes the app's direct output and feeds the audio through a small real-time pipeline — app equalizer → master equalizer → volume → soft limiter — into a private aggregate device on the output you chose. Everything happens in memory, in real time, with one buffer of added latency (≈10 ms). No audio is written to disk, and no data ever leaves your Mac.

## FAQ

**Does it record my audio?**
No. The "System Audio Recording Only" permission is what macOS calls the ability to receive other apps' audio. AudioMixer only processes it live; there is no recording, no file, no network access.

**An app doesn't show up.**
Apps appear when they actually output sound. Helper processes (Chrome / Brave / Electron helpers, WebKit) are grouped under their parent app automatically. Enable *Show background and system processes* in General to see everything Core Audio knows about.

**Bluetooth headphones sound worse during calls.**
That's macOS switching the headset to the low-bandwidth hands-free profile whenever its microphone is in use — AudioMixer follows the device's sample rate but can't change the profile.

**Where are my settings stored?**
In the app's preferences (`~/Library/Preferences/com.mk.AudioMixer.plist`). *General → Reset All…* clears everything.

## Privacy

AudioMixer has no analytics, no crash reporting, no network features and no accounts. It reads nothing but the audio it needs to adjust.

## Feedback

Found a bug or have an idea? Open an [issue](https://github.com/m1koz/audio-mixer/issues) — please include your macOS version and, for audio problems, the output device you were using.

## License

AudioMixer is free to download and use. It is proprietary software — the source code is not published, and redistribution or modification of the app is not permitted. See [LICENSE](LICENSE) for the full terms.

<p align="center"><sub>Copyright © 2026 m1koz. All rights reserved.</sub></p>
