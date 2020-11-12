# Changelog

## Unpublished

### 🛠 Breaking changes

- Deprecated `.installationId` and `.deviceId`. Please implement installation identifier on your own using `expo-secure-store` on iOS, `expo-application`'s `.androidId` on Android and `localStorage` on Web.

### 🎉 New features

### 🐛 Bug fixes

## 9.2.0 — 2020-08-18

_This version does not introduce any user-facing changes._

## 9.1.1 — 2020-05-28

*This version does not introduce any user-facing changes.*

## 9.1.0 — 2020-05-27

### 🐛 Bug fixes

- Fixed `uuid`'s deprecation of deep requiring ([#8114](https://github.com/expo/expo/pull/8114) by [@actuallymentor](https://github.com/actuallymentor))
