<p align="center">
  <img src="https://raw.githubusercontent.com/m1koz/audio-mixer/assets/icon@2x.png" width="128" alt="AudioMixer icon">
</p>

<h1 align="center">AudioMixer</h1>

<p align="center">
  Per-app volume, a 10-band equalizer and per-app audio routing for macOS —<br>
  designed to feel like it shipped with the system.
</p>

<p align="center">
  <a href="https://github.com/m1koz/audio-mixer/releases/latest"><img src="https://img.shields.io/github/v/release/m1koz/audio-mixer?style=flat-square&display_name=tag&color=0A84FF&label=download" alt="Latest release"></a>
  <img src="https://img.shields.io/badge/macOS-26%20Tahoe%2B-000000?style=flat-square&logo=apple&logoColor=white" alt="macOS 26+">
  <img src="https://img.shields.io/badge/Apple%20silicon%20%26%20Intel-universal-34C759?style=flat-square" alt="Universal binary">
  <img src="https://img.shields.io/badge/license-proprietary-8E8E93?style=flat-square" alt="License">
  <a href="https://github.com/m1koz/audio-mixer/stargazers"><img src="https://img.shields.io/github/stars/m1koz/audio-mixer?style=flat-square&color=0A84FF&label=stars" alt="GitHub stars"></a>
  <a href="https://github.com/m1koz/audio-mixer/releases"><img src="https://img.shields.io/github/downloads/m1koz/audio-mixer/total?style=flat-square&color=0A84FF&label=downloads" alt="Release asset downloads"></a>
</p>

<p align="center">
  <a href="https://github.com/m1koz/audio-mixer/releases/latest"><b>↓ Download for macOS</b></a>
  &nbsp; · &nbsp; <a href="#features">Features</a>
  &nbsp; · &nbsp; <a href="#installation">Installation</a>
  &nbsp; · &nbsp; <a href="#guide">Guide</a>
  &nbsp; · &nbsp; <a href="#faq">FAQ</a>
  &nbsp; · &nbsp; <a href="https://github.com/m1koz/audio-mixer/issues">Feedback</a>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/m1koz/audio-mixer/assets/mixer.png" width="860" alt="AudioMixer — Mixer">
</p>

## 🎛️ Your apps. Your sound.

macOS gives you one volume slider for everything. AudioMixer adds the controls the system never had: turn down a noisy browser, give a voice chat its own equalizer, send music to the speakers while calls stay in your headphones — all from the menu bar, with Liquid Glass and the look of a native macOS 26 app.

<a id="features"></a>

## ✨ Features

| Mix | Shape | Route |
|---|---|---|
| Volume and mute for each app | 10-band EQ and a master curve | Different outputs for different apps |
| Pinned apps and live meters | Built-in and per-app presets | Device priorities and Bluetooth controls |
| A quick mixer in your menu bar | Liquid Glass and appearance settings | Native Core Audio, no extra drivers |

<details>
<summary><b>See all features</b></summary>

- **Per-app volume** — every app that plays sound gets its own slider and mute, with live level meters while processing is active. Neutral apps use the native macOS audio path.
- **10-band equalizer** — ±12 dB per band, preamp, response curve, 22 built-in presets (Acoustic, Bass Booster, Rock, Vocal Booster …) plus your own presets saved per app. A master equalizer applies on top of everything.
- **Per-app audio routing** — play each app on a different output device: built-in speakers, AirPods, USB interface, HDMI, AirPlay.
- **Output priorities** — keep a preferred order of devices and optionally switch to the first available output. Manual selection disables automation; individual app routes stay independent.
- **Bluetooth audio** — connect already paired headphones and speakers from the output card, then choose them as your output.
- **Pinned apps** — keep your favorite apps at the top, even when they're not playing.
- **Menu bar panel** — a Control Center–style popover with the system output, system volume and every playing app.
- **Liquid Glass & appearance** — regular / clear glass, tint, accent color, light / dark / auto, window backdrop, Control Center or classic sliders, compact rows, menu bar icon style.
- **16 languages** — follows your system language automatically; can be overridden in Settings.
- **Native by design** — no kernel extensions, no virtual audio drivers, nothing to install besides the app. Built on Core Audio process taps, the same technology Apple introduced for system audio capture.

</details>

<p align="center">
  <img src="https://raw.githubusercontent.com/m1koz/audio-mixer/assets/equalizer.png" width="860" alt="AudioMixer — Equalizer">
</p>

<a id="installation"></a>

## 📥 Download & install

**Requirements:** macOS 26 Tahoe or later · Apple silicon or Intel.

**Latest download: 1.1.1, build 6.** If you installed an earlier 1.1.1 build, download the DMG again and replace the app to get the additional routing fixes.

1. Download **`AudioMixer-1.1.1.dmg`** from the [latest release](https://github.com/m1koz/audio-mixer/releases/latest).
2. Open the image and drag **AudioMixer** to **Applications**.
3. Launch AudioMixer from Applications or Launchpad.
4. On first launch macOS asks for **System Audio Recording Only** access — click **Allow**. This is the permission Core Audio requires to adjust other apps' sound; nothing is recorded or stored.

> **"Apple could not verify AudioMixer is free of malware"** — the app is distributed outside the App Store and isn't notarized yet. Open **System Settings → Privacy & Security**, scroll down and click **Open Anyway**, or run once in Terminal:
> ```bash
> xattr -dr com.apple.quarantine /Applications/AudioMixer.app
> ```

To verify the download:

```bash
shasum -a 256 -c AudioMixer-1.1.1.dmg.sha256
```

<a id="guide"></a>

## 🧭 Using AudioMixer

| | |
|---|---|
| **Menu bar** | Click the bars icon for the quick mixer: output device, system volume and every app that is playing. Right-click a row for pin, mute, equalizer and reset. |
| **Mixer** | The main window (⌘1). Pinned apps stay on top; *Now Playing* lists everything with sound; *Other Apps* shows apps that used audio recently. |
| **Equalizer** | ⌘2. Pick *All Apps* for the master curve or a single app. Drag the bands, choose a preset or press **Save Preset…** to keep your own — presets belong to the app you saved them for. |
| **Routing** | The speaker icon on each row chooses that app's output device. *System Default* follows whatever you pick in Control Center. |
| **Appearance** | ⌘3. Liquid Glass style and tint, theme, accent, window backdrop, slider style, level meters, menu bar icon. |
| **General** | ⌘4. Output-device priorities, launch at login, Dock icon behavior, language, background processes, permission status. |
| **Bluetooth** | Open the Bluetooth controls beside the output selector, connect a paired audio device, then select it from the output menu. |

Settings are applied instantly and remembered per app across launches. Quit AudioMixer and every app goes back to the regular system audio path.

### Tips & shortcuts

| Shortcut | Action |
|---|---|
| ⌘1 / ⌘2 / ⌘3 / ⌘4 | Mixer · Equalizer · Appearance · General |
| ⌘, | Open Settings |
| Right-click a row | Pin, mute, open its equalizer, reset, reveal in Finder |
| Drag the volume capsule | Works anywhere along the bar — no need to grab a knob |
| Scroll over app volume or an EQ band | Adjust the value; hold Option for finer changes |
| Double-click app volume / an EQ band | Reset to 100% / 0 dB; system volume is excluded |

- Pin the apps you adjust most often: they stay at the top of both the window and the menu bar panel.
- Save an equalizer curve with **Save Preset…** — it is stored for that app only, so a browser and a music player can keep different presets.
- If an app uses helper processes (browsers, Electron apps), they are grouped under the app automatically.

<details>
<summary><b>Under the hood — audio processing and the native audio path</b></summary>

## How it works

AudioMixer uses **Core Audio process taps** for apps that need volume, equalizer or routing changes. Their audio passes through a real-time pipeline — app equalizer → master equalizer → volume → soft limiter — into a private aggregate device on the selected output. Each app has independent filter history.

Apps at neutral settings bypass processing when neither equalizer changes their sound. Their sound stays on the native macOS path, and a playback indicator replaces the captured level meter. Pinning an app alone does not enable processing. Audio is processed in memory and is never written to disk or uploaded.

</details>

<a id="faq"></a>

## 💬 FAQ

**Does it record my audio?**
No. The "System Audio Recording Only" permission is what macOS calls the ability to receive other apps' audio. AudioMixer only processes it live; there is no recording, no file, no network access.

**An app doesn't show up.**
Apps appear when they actually output sound. Helper processes (Chrome / Brave / Electron helpers, WebKit) are grouped under their parent app automatically. Enable *Show background and system processes* in General to see everything Core Audio knows about.

**Bluetooth headphones sound worse during calls.**
That's macOS switching the headset to the low-bandwidth hands-free profile whenever its microphone is in use — AudioMixer follows the device's sample rate but can't change the profile.

**Why does GitHub offer “Source code” downloads?**
Those ZIP/TAR archives contain this public repository’s documentation and distribution materials, not the AudioMixer application source. To install the app, choose the `.dmg` asset from the [latest release](https://github.com/m1koz/audio-mixer/releases/latest).

**Where are my settings stored?**
In the app's preferences (`~/Library/Preferences/com.mk.AudioMixer.plist`). *General → Reset All…* clears everything.

## 🔒 Privacy

AudioMixer has no analytics, crash reporting or accounts, and it does not upload audio or usage data. Bluetooth access is used to list and connect paired audio devices when you open those controls. Device priorities and audio preferences are stored locally.

## ⭐ Feedback & support

Found a bug or have an idea? Open an [issue](https://github.com/m1koz/audio-mixer/issues) — please include your macOS version and, for audio problems, the output device you were using.

If AudioMixer makes your Mac more useful, a star helps others discover it. You can also share the [latest release](https://github.com/m1koz/audio-mixer/releases/latest) with a friend.

## ⚖️ License

AudioMixer is free to download and use. It is proprietary software — the source code is not published, and redistribution or modification of the app is not permitted. See [LICENSE](LICENSE) for the full terms.

<p align="center"><sub>Copyright © 2026 m1koz. All rights reserved.</sub></p>
