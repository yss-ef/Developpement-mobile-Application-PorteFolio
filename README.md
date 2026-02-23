# 📱 Interactive Mobile Portfolio | Youssef Fellah

> A mobile application developed in Flutter serving as an interactive professional showcase. This project highlights my skills as a software engineering student (Full Stack, Cloud & DevOps), my background, and synchronizes my GitHub repositories in real-time.

## 📑 Table of Contents

* [UI Overview](https://www.google.com/search?q=%23%EF%B8%8F-ui-overview)
* [Key Features](https://www.google.com/search?q=%23-key-features)
* [Technical Architecture](https://www.google.com/search?q=%23%EF%B8%8F-technical-architecture)
* [Stack & Dependencies](https://www.google.com/search?q=%23%EF%B8%8F-stack--dependencies)
* [Deployment & Installation](https://www.google.com/search?q=%23-deployment--installation)

## 👁️ UI Overview

| 🏠 Home | 💻 Projects | ℹ️ About | 📞 Contact |
| --- | --- | --- | --- |
| <img src="assets/images/screen_home.jpeg" width="200" alt="Home Screen"> | <img src="assets/images/screen_projet.jpeg" width="200" alt="Projects Screen"> | <img src="assets/images/screen_info.jpeg" width="200" alt="About Screen"> | <img src="assets/images/screen_contact.jpeg" width="200" alt="Contact Screen"> |

## ✨ Key Features

* **Dynamic Profile**: A concise presentation of the current professional status (Seeking a work-study program) and core areas of expertise.
* **GitHub Synchronization (REST API)**: Asynchronous fetching and real-time display of repositories linked to the `yss-ef` account, including programming languages, descriptions, and star statistics.
* **Modern User Experience (UX)**:
* Fluid navigation utilizing a curved bottom navigation bar (`curved_navigation_bar`).
* Smooth transitions and progressive rendering handled by `flutter_animate`.


* **Adaptive Design System**: Clean typography (*Poppins*, *Roboto*) and customized UI components (drop shadows, bespoke containers) for a professional look.

## 🏗️ Technical Architecture

The source code follows a modular structure to ensure optimal maintainability and a clear separation of concerns (SoC):

```text
lib/
├── models/       # Data models (e.g., JSON mapping for the Project class)
├── services/     # Business logic and external calls (e.g., ProjectService, HTTP requests)
├── screens/      # Main application views (Home, Projects, About, Contact)
├── components/   # Reusable UI widgets (e.g., MyDrawer, project cards)
└── main.dart     # Entry point, orchestrates navigation via PrincipalPage

```

## 🛠️ Stack & Dependencies

* **Environment**: Flutter (SDK `^3.10.1`) / Dart
* **Core Packages**:
* [`http`](https://www.google.com/search?q=%5Bhttps://pub.dev/packages/http%5D(https://pub.dev/packages/http)): GitHub API consumption.
* [`curved_navigation_bar`](https://www.google.com/search?q=%5Bhttps://pub.dev/packages/curved_navigation_bar%5D(https://pub.dev/packages/curved_navigation_bar)): Implementation of the stylized bottom navigation.
* [`flutter_animate`](https://www.google.com/search?q=%5Bhttps://pub.dev/packages/flutter_animate%5D(https://pub.dev/packages/flutter_animate)) & `flutter_staggered_animations`: Management of visual choreographies.
* [`url_launcher`](https://www.google.com/search?q=%5Bhttps://pub.dev/packages/url_launcher%5D(https://pub.dev/packages/url_launcher)): Redirection to external contact links.



## 🚀 Deployment & Installation

To set up the development environment on **Fedora 43** and deploy the application to an **Android** emulator or physical device:

**1. System Environment Preparation**

```bash
# Install Android development tools and Git
sudo dnf install git android-tools

```

**2. Project Installation**

```bash
# Clone the repository
git clone https://github.com/yss-ef/[REPOSITORY_NAME].git
cd [REPOSITORY_NAME]

# Fetch Dart packages
flutter pub get

```

**3. Launching the App**
Ensure an Android device is connected via USB debugging or an emulator is running, then execute:

```bash
flutter run -d android

```

---

*Developed by Youssef Fellah as part of a Flutter skills assessment.*
