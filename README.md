<p align="center">
  <img width="80" src="https://raw.githubusercontent.com/edent/SuperTinyIcons/master/images/svg/apple.svg" alt="Apple Invites" />
</p>

<h1 align="center">✨ ECHO</h1>
<p align="center"><em>Where event invitation design meets cloud-native intelligence and cinematic mobile UX.</em></p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Appwrite-000000?style=for-the-badge&logo=appwrite&logoColor=white" alt="Appwrite" />
  <img src="https://img.shields.io/badge/Riverpod-8A2BE2?style=for-the-badge&logo=flutter&logoColor=white" alt="Riverpod" />
  <img src="https://img.shields.io/badge/GoRouter-00A4EF?style=for-the-badge&logo=go&logoColor=white" alt="GoRouter" />
</p>

---

<p align="center">
  <img width="800" src="https://user-images.githubusercontent.com/000000/0000000000000000000000000000000000000000.png" alt="Apple Invites UI placeholder" />
</p>

## 🚀 Mission

> Apple Invites is a polished Flutter experience built for modern event creators, teams, and power users who want elegant invitation design, collaborative event workflows, and intelligent expense tracking — all powered by Appwrite and a sleek dark mobile interface.

### What it does best:

- Crafts captivating event invitations
- Displays upcoming, past and shared event experiences
- Splits event expenses with precision
- Hosts album galleries for each event
- Connects to Appwrite backend for cloud-native sync

---

## 🧭 Interactive Experience

<details>
<summary><strong>Launch Sequence · System Pulse</strong></summary>

```bash
> initializing Apple Invites console...
> loading dark theme assets
> establishing Appwrite connection
> verifying endpoint: https://sgp.cloud.appwrite.io/v1
> project id: 69fb24d3000d12c8bc0a
> boot sequence complete — welcome to Apple Invites
```

</details>

<details>
<summary><strong>System Status · Core Modules</strong></summary>

- ✅ **Authentication** — elegant login screen with Appwrite connectivity probe
- ✅ **Events** — create, browse, manage, and preview event details
- ✅ **Expenses** — split budgets, track totals, and control spend
- ✅ **Profile** — premium account dashboard, settings, and analytics
- ✅ **Shared Albums** — event multimedia experience

</details>

---

## 🎯 Feature Spotlight

| Experience | What it enables | Why it matters |
|---|---|---|
| Cinematic Event Builder | Create invitations and schedule events with beautiful motion and polish | Makes every event feel premium | 
| Smart Expense Flow | Add expenses and split costs inside event detail flow | Keeps teams aligned and budgets transparent |
| Appwrite Cloud Engine | Serverless backend, realtime database, secure auth | Cloud sync for event state and profile data |
| Dark UI with Glow | Motion-driven theme, animated cards, glowing elements | Immersive mobile design that feels high-end |

---

## 🧪 Built With

<details>
<summary><strong>Core stack</strong></summary>

- Flutter / Dart
- Appwrite
- Riverpod state management
- GoRouter navigation
- Google Maps SDK
- Flutter Local Notifications
- Google Fonts / Flutter SVG / Animate

</details>

<details>
<summary><strong>Architecture & Patterns</strong></summary>

- Feature-based module layout (`auth`, `events`, `expenses`, `profile`)
- Clean navigation tree with nested route paths
- Theme-driven design system in `lib/core/theme`
- Appwrite constants and environment config centralization

</details>

---

## 🧱 Architecture Overview

```text
lib/
├── config/
│   └── environment.dart
├── core/
│   ├── constants/appwrite_constants.dart
│   └── theme/app_theme.dart
├── features/
│   ├── auth/
│   │   └── presentation/login_screen.dart
│   ├── events/
│   │   ├── presentation/home_screen.dart
│   │   ├── presentation/create_event_screen.dart
│   │   ├── presentation/event_details_screen.dart
│   │   └── presentation/shared_album_screen.dart
│   ├── expenses/
│   │   └── presentation/expense_screen.dart
│   └── profile/
│       └── presentation/profile_screen.dart
└── routes/app_router.dart
```

### Routing Flow

- `/login` → login and Appwrite ping
- `/` → event dashboard
- `/create-event` → new event composer
- `/event/:id` → detail view
- `/event/:id/expenses` → expense breakdown
- `/event/:id/album` → shared media
- `/profile` → user profile hub

---

## 🎬 Showcase & Mood

<details>
<summary><strong>Preview gallery</strong></summary>

- `Home` — upcoming events, search, responsive list
- `Event detail` — split expenses, album access, action cards
- `Expense dashboard` — summary, chart-style cards, add expense modal
- `Profile hub` — avatar glow, stats blocks, settings tiles

</details>

> _Pro Tip_: Use screenshot cards or GIF previews in your repo once you have a polished UI capture.

---

## ⚡ Installation — Rapid Launch

```bash
git clone https://github.com/<your-username>/apple-invites.git
cd apple-invites
flutter pub get
flutter run
```

<details>
<summary><strong>Environment</strong></summary>

Update `lib/config/environment.dart` with your own Appwrite endpoint and project values.

```dart
class Environment {
  static const String appwriteProjectId = '<YOUR_PROJECT_ID>';
  static const String appwriteProjectName = 'echo';
  static const String appwritePublicEndpoint = 'https://sgp.cloud.appwrite.io/v1';
}
```

</details>

---

## ⚙️ Performance + Optimization

- Flutter native rendering optimized for dark theme and animations
- Riverpod async providers for efficient event state refresh
- Appwrite backend calls centralized in service modules
- Lightweight asset usage via SVG / vectors
- Smooth transitions with `flutter_animate`

---

## 🧠 Developer Experience

- Modular folder architecture for rapid feature expansion
- Reusable theme and constants across app flow
- One-click Appwrite configuration via environment file
- Clean route management using `GoRouter`
- Minimal yet powerful dependency matrix

---

## 🔮 Future Roadmap

- [ ] real Appwrite auth / user sessions
- [ ] event invitation export / share links
- [ ] multi-user collaboration mode
- [ ] event analytics dashboard
- [ ] calendar sync + reminder automation
- [ ] live event chat / RSVP system

---

## 🤝 Contribute

If you want to help Apple Invites become the premium event experience for creators:

- Fork the repo
- Create a feature branch
- Send a PR with your UI, backend, or product enhancements
- Add screenshots and animation demos to `README.md`

---

## 📌 Credits

Built as a modern Flutter event platform demo with Appwrite, motion design, and a dark SaaS aesthetic.

---

## 📜 License

MIT · free to adapt, remix, and improve.

---

<p align="center">
  <strong>Apple Invites</strong> — a cinematic event invitation experience for the modern mobile creator.
</p>
