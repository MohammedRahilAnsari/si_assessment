# si_assessment

This is a assessment from sports interactive
A modern, premium, and dynamic Flutter application that provides cricket match details, squad information, and player statistics.

## 📋 Table of Contents
- [🛠️ Tech Stack](#-tech-stack)
- [📂 Project Structure](#-project-structure)
- [🚀 Getting Started](#-getting-started)
- [🛠️ Setup & Installation](#-setup--installation)
- [🧑‍💻 Features](#-features)
- [📦 API Integration](#-api-integration)
- [🛠️ State Management](#-state-management)
- [🎨 UI/UX Design](#-uiux-design)
- [📖 Code Style](#-code-style)
- [🛠️ Development Guide](#-development-guide)
- [🤝 Contributing](#-contributing)
- [📝 License](#-license)

## 📌 Tech Stack & Requirements

- **Flutter Version:** `>=3.29.0`
- **Dart Version:** `>=3.7.0`
- **State Management:** Riverpod (`flutter_riverpod`)
- **Architecture:** MVVM (Model-View-ViewModel)
- **UI Design:** Custom Theming, Glassmorphism, and Dynamic Layouts
- **Additional Libraries:**
  - `http` (API calls)
  - `flutter_riverpod` (State management)
  - `syncfusion_flutter_charts` (Data visualization)
  - `shared_preferences` (Local storage)

---

## 📂 Project Structure (MVVM)

lib/
├── core/                     # Core logic, utilities, themes
│   ├── api_client.dart        # API helper
│   ├── app_theme.dart         # Light & Dark Theme
│   ├── constants.dart         # Global constants
│
├── models/                    # Data models
│   ├── match_model.dart        # Match API response model
│
├── providers/                 # Riverpod state management
│   ├── http_client_provider.dart  # API provider
│   ├── match_provider.dart        # Fetch match data
│   ├── theme_provider.dart        # Manage theme
│
├── repositories/               # Business logic layer
│   ├── match_repository.dart    # Handles API calls
│
├── viewmodels/                 # Handles UI logic & connects providers
│   ├── match_viewmodel.dart     # Match screen logic
│
├── views/                      # UI Screens
│   ├── match_screen.dart        # Main match details screen
│   ├── splash_screen.dart       # Splash screen
│   ├── squad_screen.dart        # Squad listing screen
│
├── widgets/                    # Reusable UI components
│   ├── custom_app_bar.dart      # Custom app bar
│   ├── custom_background.dart   # Themed background
│   ├── custom_drop_down.dart    # Dropdown widget
│   ├── custom_player_details.dart  # Player bottom sheet
│   ├── custom_row_widget.dart   # Player stat rows
│   ├── custom_team_widget.dart  # Team UI
│
├── main.dart                   # Entry point

---

##  Getting Started
1 Clone the Repository
```sh git clone https://github.com/MohammedRahilAnsari/si_assessment ```

2 Install Dependencies
```shflutter pub get```

3 Run the App
```sh flutter run```

🧑‍💻 Features

✅ Match Details - View details of current matches
✅ Squad Listing - View all players with filters
✅ Detailed Player Stats - View batting & bowling stats
✅ Premium UI - Glassmorphism, modern typography
✅ State Management - Powered by Riverpod
✅ Dark & Light Mode - Auto-switching themes

📦 API Integration
•	API Base URL: https://demo.sportz.io/
•	Endpoints:

| Method  | Endpoint               | Parameters      |
|---------|------------------------|-----------------|
| **GET** | `/nzin01312019187360`  | `id` (Match ID) |
| **GET** | `/sapk01222019186652`  | `id` (Match ID) |


🛠️ State Management

We use Riverpod for managing state across the app.

🎨 UI/UX Design
•	Glassmorphism UI - Blur, transparency, modern aesthetics
•	Dynamic Theme - Light/Dark mode based on system settings
•	Syncfusion Charts - For visualizing player performance

📖 Code Style
•	Uses Linting: flutter_lints
•	Folder Structure: Follows MVVM with Providers
•	Naming Conventions: CamelCase for methods, snake_case for files
•	Widgets are Stateless where possible

🛠️ Development Guide

Adding a New Feature
1.	Define API Model in models/
2.	Create API Call in repositories/
3.	Setup State Provider in providers/
4.	Use Provider in ViewModel (viewmodels/)
5.	Consume Provider in UI (views/)
