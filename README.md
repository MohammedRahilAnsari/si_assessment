# si_assessment

This is a assessment from sports interactive
A modern, premium, and dynamic Flutter application that provides cricket match details, squad information, and player statistics.

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

📦 lib/
┣ 📂 core/                  # Core utilities & configurations
┃ ┣ 📜 api_client.dart      # API service for network requests
┃ ┣ 📜 app_theme.dart       # Theme & UI styling
┃ ┗ 📜 constants.dart       # App-wide constants
┣ 📂 models/                # Data models for Match, Team, Player
┃ ┗ 📜 match_model.dart
┣ 📂 providers/             # Riverpod state management providers ( Watches ViewModel & updates UI.)
┃ ┣ 📜 http_client_provider.dart
┃ ┣ 📜 match_provider.dart
┃ ┗ 📜 theme_provider.dart
┣ 📂 repositories/          # Business logic & API handling ( Fetches data from APIs & processes it and Keeps API logic separate)
┃ ┗ 📜 match_repository.dart
┣ 📂 viewmodels/            # Handles UI logic and connects to providers ( Calls Repository & manages UI state.)
┃ ┗ 📜 match_viewmodel.dart
┣ 📂 views/                 # UI screens (Match, Squad, Splash)
┃ ┣ 📜 match_screen.dart
┃ ┣ 📜 splash_screen.dart
┃ ┗ 📜 squad_screen.dart
┣ 📂 widgets/               # Reusable UI components
┃ ┣ 📜 custom_app_bar.dart
┃ ┣ 📜 custom_background.dart
┃ ┣ 📜 custom_drop_down_widget.dart
┃ ┣ 📜 custom_player_details_widget.dart
┃ ┣ 📜 custom_row_widget.dart
┃ ┗ 📜 custom_team_widget.dart
┗ 📜 main.dart              # Entry point of the app