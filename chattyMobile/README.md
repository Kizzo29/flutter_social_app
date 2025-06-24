# ChattyMobile

A Flutter-based social media application.

## Overview

ChattyMobile is a cross-platform social media app built with Flutter. It features real-time chat, user authentication, and a modern UI. The project includes both mobile and web support, as well as a Node.js backend server.

##
It is not a complete app yet as intended but core features are fully developed

## Features

- User authentication and registration
- Real-time chat functionality
- Social media feed
- Theming and custom UI
- Asset management for images and icons
- Modular architecture for scalability

## Project Structure

```
chattyMobile/
├── android/           # Android native files
├── assets/            # App images and assets
├── ios/               # iOS native files
├── lib/               # Dart source code
│   ├── cache/
│   ├── datasources/
│   ├── factory/
│   ├── models/
│   ├── services/
│   ├── states_management/
│   ├── colors.dart
│   ├── composition_root.dart
│   ├── main.dart
│   └── theme.dart
├── nodeserver/        # Node.js backend server
├── social_media/      # (Additional social media logic)
├── test/              # Unit and widget tests
├── web/               # Web support
├── .gitignore
├── pubspec.yaml
└── README.md
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Node.js](https://nodejs.org/) (for backend)
- Android Studio or Xcode (for mobile development)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/chattyMobile.git
   cd chattyMobile
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

4. **(Optional) Start the Node.js backend:**
   ```sh
   cd nodeserver
   npm install
   node index.js
   ```

## Useful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Node.js Documentation](https://nodejs.org/en/docs/)

---

Feel free to contribute or open issues for improvements!