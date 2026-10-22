# Changelog

All notable changes to AudioMixer are documented here.

## [1.1.1] — 2026-10-23

Refreshed download: **build 6**. If you installed the earlier 1.1.1 build, download the DMG again and replace the app.

### Fixed
- Bluetooth output readiness tracking: AirPods and other devices are observed even before their output streams become available (#3).
- Recover from missed device/default-output notifications and preserve the last valid device snapshot during transient Core Audio read errors.
- Retry failed automatic output selections with bounded backoff; unrelated device metadata changes no longer cause immediate repeated attempts.
- A failed old output or process no longer delays starting audio processing on a new device, Bluetooth format or process identity.
- Avoid false Bluetooth connection errors when enumeration lags a successful request; clear a device's stale error if it connects through macOS Settings.
- Preserve existing app processing during transient Core Audio process-list read errors; valid app exits still release processing.
- Keep existing per-app routes and audio settings; automatic output priorities remain opt-in.

## [1.1] — 2026-10-16

### New
- **Output-device priorities:** arrange your preferred outputs in General → Output Priority and optionally switch to the first available device automatically. Manual output selection turns automation off; app-specific routing stays independent.
- **Bluetooth audio controls:** connect already paired headphones and speakers from the output card in the menu bar panel or main window, then select them as your output. Includes connection status, retry and permission guidance.
- **Scroll to adjust:** change app volume and EQ bands with the scroll wheel. Hold Option for finer adjustments.
- **Double-click to reset:** restore an app's volume to 100% or an EQ band to 0 dB. System volume does not reset on double-click.
- All new controls and Bluetooth permission descriptions are localized into the 16 supported languages.

### Audio improvements
- Apps with neutral settings use their original macOS audio path when no equalizer processing is needed. These apps show a playback indicator instead of a captured level meter.
- Independent master-EQ filter history for each app.
- Improved recovery handling for sleep/wake, output changes and Core Audio service restarts.
- Protection against stale audio-tap starts, repeated failed-start loops and a blocked quit while an audio request is pending.
- Includes the menu bar panel sizing fix from 1.0.1.


## [1.0.1] — 2026-10-16

### Fixed
- Fixed the menu bar app list collapsing and clipping application rows (#1).
- Size the list to its content and scroll longer lists within the available screen height.

## [1.0] — 2026-09-14

Initial release.

### Added
- Per-app volume and mute with live level meters
- 10-band graphic equalizer (±12 dB, preamp, response curve) per app plus a master equalizer
- 22 built-in presets and user presets saved per app
- Per-app output device routing (speakers, headphones, USB, HDMI, AirPlay)
- Pinned apps that stay in the mixer even when idle
- Menu bar panel with system output, system volume and playing apps
- Liquid Glass appearance settings: glass style and tint, accent color, theme, window backdrop, slider style, compact rows, menu bar icon
- Localization in 16 languages with automatic system language detection and manual override
- Launch at login, Dock icon while the window is open
- Universal binary (Apple silicon and Intel), macOS 26 Tahoe or later
