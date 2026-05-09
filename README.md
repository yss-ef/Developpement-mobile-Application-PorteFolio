# Interactive Mobile Portfolio (Flutter)

A cross-platform mobile application developed in Flutter, serving as an interactive professional showcase. This project highlights software engineering capabilities, specifically focusing on mobile architecture, API integration, and fluid UX design.

## Technical Architecture

The application is structured to ensure optimal maintainability and a clear separation of concerns (SoC) between the UI layer and business logic.

```text
lib/
├── models/       # Data serialization (JSON mapping for GitHub entities)
├── services/     # Business logic and external HTTP orchestration
├── screens/      # Primary application views (Routing targets)
├── components/   # Reusable UI widgets and atomic design elements
└── main.dart     # Application entry point and theme configuration
```

---

## Core Features

### 1. API Integration & Synchronization
*   **GitHub REST API**: Asynchronous fetching and real-time parsing of remote repositories.
*   **Data Mapping**: Dynamic extraction of programming languages, descriptions, and repository statistics into structured Dart models.

### 2. User Experience & Motion Design
*   **Navigation**: Implementation of a stylized, state-managed curved bottom navigation bar.
*   **Progressive Rendering**: Utilization of staggered animations for list loading to prevent UI blocking.
*   **State Management**: Efficient widget rebuilding utilizing FutureBuilders for HTTP request states.

### 3. Adaptive Design System
*   **Typography**: Clean integration of *Poppins* and *Roboto* typefaces.
*   **Component Styling**: Customized drop shadows, bespoke containers, and platform-agnostic material design elements.

---

## Stack & Dependencies

*   **Environment**: Flutter SDK (^3.10) / Dart
*   **Network**: `http` (GitHub API consumption)
*   **Navigation**: `curved_navigation_bar`
*   **Animation**: `flutter_animate` / `flutter_staggered_animations`
*   **Routing**: `url_launcher` (External deep linking)

---

## Interface Showcase

| Home View | Repository View | Identity View | Communication View |
| --- | --- | --- | --- |
| <img src="assets/images/screen_home.jpeg" width="200" alt="Home Screen"> | <img src="assets/images/screen_projet.jpeg" width="200" alt="Projects Screen"> | <img src="assets/images/screen_info.jpeg" width="200" alt="About Screen"> | <img src="assets/images/screen_contact.jpeg" width="200" alt="Contact Screen"> |

---

## Deployment & Setup

To compile and deploy the application locally on an Android emulator or physical device:

### Prerequisites
*   Flutter SDK configured
*   Android Studio / command-line tools

### Execution
1.  **Clone the repository**:
    ```bash
    git clone https://github.com/yss-ef/flutter-interactive-portfolio.git
    cd flutter-interactive-portfolio
    ```
2.  **Fetch dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Compile and launch**:
    ```bash
    flutter run -d android
    ```

---
*Authored by Youssef Fellah.*
*Developed for the Engineering Cycle - Mundiapolis University.*
