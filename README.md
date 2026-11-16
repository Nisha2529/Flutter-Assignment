# Mindful Cosmic Tracker - Flutter Developer Assignment

A production-grade Flutter application implementing a celestial personal tracker, journal, and astrological insights experience designed in accordance with Clean Architecture and BLoC/Cubit principles based on the reference Figma design.

---

## 📸 Screenshots

All screenshots were captured from the running Flutter application on the iPhone 15 Plus simulator.

### Home Screen

![Home Screen - Top and Cosmic Dial](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.04.png)

![Home Screen - Goals and Horoscope](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.11.png)

![Home Screen - Numerology and Journal Preview](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.15.png)

### Journal Screen

![Journal Screen - Header and Month Filters](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.20.png)

![Journal Screen - Filtered Entries](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.24.png)

![Journal Screen - Entries and Add Action](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.29.png)

### Insights Screen

![Insights Screen - Period Selector and Hero](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.33.png)

![Insights Screen - Daily Focus and Traits](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.39.png)

![Insights Screen - Fun Facts and Numerology](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.45.png)

![Insights Screen - Destiny Number 7](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.47.png)

### Goals Screen

![Goals Screen](screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.24.50.png)

## 🎥 Demo Video

[Watch Assignment Demo Video](demo/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Plus%20-%202026-11-16%20at%2012.26.41.mov)

---

## 📱 Features & Screens

1. **Home Screen**
   - **Header & Profile**: Personalized greeting (_"Good evening, Saniya"_), astrological traits (_"Sagittarius • Life Path 3"_), notification badge, and profile icon with interactive feedback.
   - **Celestial Background & Cosmic Dial**: Dynamic 6-ring concentric dial (Yrs, Mm, Days, Hrs, Mins, Sec) calculated live according to the user's birthdate using custom Agdasima typography and exact Figma color palette (#FEFBEC, #FEF2C2, #DFD4AA, #659BA5, #84BAC4, #A9D1D9).
   - **Goals Card**: _"No goals yet"_ with guided intention text, cosmic mountain artwork, and an interactive _"Create your goal"_ button navigating to the Goals tab.
   - **Today's Horoscope Card**: _"Sagittarius"_ with date, glowing zodiac glyph artwork, daily horoscope guidance, and _"Read more >"_ prompt.
   - **Today's Numerology Card**: _"Lucky Number 3"_ with globe artwork and daily guidance.
   - **Journal Preview Card**: Celestial notebook card with _"SANIYA'S JOURNAL"_ banner; tapping navigates directly to the Journal tab.

2. **Journal Screen**
   - **Notebook Header**: Saniya's journal notebook display with entry count badge (_"2 entries"_).
   - **Month Filter Selector**: Interactive filter chips (_"ALL"_, _"AUG"_, _"SEP"_, _"OCT"_, _"NOV"_) that filter journal entries in real-time.
   - **Journal Entry Cards**: Date badges (_Day, Month, Weekday_), entry titles, and reflection text.
   - **Add Entry Dialog**: Interactive modal bottom sheet enabling users to enter a title and reflection, dynamically timestamping the entry with the current date/month and instantly updating the journal list.

3. **Insights Screen**
   - **Period Selector**: Interactive horizontal tabs (_"YESTERDAY"_, _"TODAY"_, _"TOMORROW"_, _"WEEK"_, _"MONTH"_), with _"TODAY"_ active on initial load.
   - **Astrological Identity Hero**: User profile (_"Gilli Gaurav Singh"_), birth chart info (_"You • Sept 23, 2003"_), dual sign badges (_Cancer Sun Sign_ & _Leo Moon Sign_), and responsive zodiac lion illustration.
   - **Astrology Section**: _"Focus of the day: Career"_ badge with comprehensive daily career and astrological reading.
   - **Favourable Traits Grid**: 2x2 grid featuring _"Favourable Direction: North"_ and _"Lucky Colour: Pink"_.
   - **Fun Facts Card**: Cosmic card with Sun-ruler astrological lore and bullet points.
   - **Numerology & Destiny Section**: Lucky Number guidance card and Destiny Number 7 (_"The Seeker"_) illustrated path.

4. **Goals Screen**
   - Dedicated tab featuring _"Your journey starts here"_ with target illustration, motivating copy, and _"Create Your First Goal"_ action button.

---

## 🏗️ Architecture & State Management

The project strictly follows **Clean Architecture** with separation of concerns:

```
Presentation Layer (Pages, Widgets, Cubits & States)
        ⬇️
Domain Layer (Entities, Use Cases, Repository Contracts)
        ⬇️
Data Layer (Data Models, Repository Implementations, Local Data Sources)
```

- **State Management**: Implemented using **BLoC / Cubit** (`flutter_bloc`):
  - `NavigationCubit`: Controls bottom navigation tab index and active tab state.
  - `HomeCubit`: Manages home profile, horoscope, and numerology state.
  - `JournalCubit`: Handles journal entries, dynamic creation, and month filtering.
  - `InsightsCubit`: Manages period selection and astrological/numerological insights.
- **Dependency Injection**: Configured using `get_it` in [lib/injection_container.dart](lib/injection_container.dart).
- **Responsive Sizing**: Configured using `flutter_screenutil` based on the 402 × 874 reference design, ensuring scalable typography (`.sp`), layout width (`.w`), height (`.h`), and corner radii (`.r`).

---

## 📁 Directory Structure

```text
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart                 # Color palette & tokens
│   │   ├── app_spacing.dart                # Responsive spacing & corner radii
│   │   ├── app_strings.dart                # UI string constants
│   │   ├── app_text_styles.dart            # Typography styling helpers
│   │   └── app_typography.dart             # Centralized text theme definitions
│   ├── entities/
│   │   └── numerology_data.dart            # Shared core domain entity
│   ├── theme/
│   │   └── app_theme.dart                  # Material 3 light theme configuration
│   └── widgets/
│       ├── asset_background.dart           # Background image loader with fallback
│       ├── journal_preview_card_widget.dart# Shared journal preview notebook widget
│       ├── numerology_card_widget.dart     # Shared numerology guidance card
│       └── responsive_layout.dart          # Screen-width breakpoint utilities
│
├── features/
│   ├── goals/
│   │   └── presentation/pages/goals_page.dart
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── datasources/home_local_data_source.dart
│   │   │   ├── models/home_data_model.dart
│   │   │   └── repositories/home_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/home_data.dart
│   │   │   ├── repositories/home_repository.dart
│   │   │   └── usecases/get_home_data_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/home_cubit.dart, home_state.dart
│   │       ├── pages/home_page.dart
│   │       └── widgets/goals_card_widget.dart, horoscope_card_widget.dart
│   │
│   ├── journal/
│   │   ├── data/
│   │   │   ├── datasources/journal_local_data_source.dart
│   │   │   ├── models/journal_entry_model.dart
│   │   │   └── repositories/journal_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/journal_entry.dart
│   │   │   ├── repositories/journal_repository.dart
│   │   │   └── usecases/
│   │   │       ├── add_journal_entry_usecase.dart
│   │   │       └── get_journal_entries_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/journal_cubit.dart, journal_state.dart
│   │       ├── pages/journal_page.dart
│   │       └── widgets/
│   │           ├── add_entry_dialog.dart
│   │           ├── journal_entry_card.dart
│   │           └── month_filter_selector.dart
│   │
│   ├── insights/
│   │   ├── data/
│   │   │   ├── datasources/insights_local_data_source.dart
│   │   │   ├── models/insights_data_model.dart
│   │   │   └── repositories/insights_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/insights_data.dart
│   │   │   ├── repositories/insights_repository.dart
│   │   │   └── usecases/get_insights_data_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/insights_cubit.dart, insights_state.dart
│   │       ├── pages/insights_page.dart
│   │       └── widgets/
│   │           ├── astrological_hero_card.dart
│   │           ├── astrology_section_widget.dart
│   │           ├── destiny_number_card.dart
│   │           ├── favourable_traits_grid.dart
│   │           ├── fun_facts_card.dart
│   │           └── insights_period_selector.dart
│   │
│   └── navigation/
│       ├── cubit/navigation_cubit.dart, navigation_state.dart
│       └── presentation/
│           ├── pages/main_navigation_page.dart
│           └── widgets/custom_bottom_nav_bar.dart
│
├── injection_container.dart                # GetIt service locator registration
└── main.dart                               # App entry point & ScreenUtilInit
```

---

## 🎯 Verified Interactions & UI Functionality

1. **Persistent Bottom Navigation**: Seamless tab navigation preserving page scroll states via `AutomaticKeepAliveClientMixin`.
2. **Dynamic Journal Filtering**: Month pills filter the entries list reactively via `JournalCubit`.
3. **Journal Entry Addition**: Modal sheet inputs title and reflection, dynamically assigns current month and date, and updates the reactive entry count.
4. **Insights Period Selection**: Segmented tabs switch timeframes with active state indicator.
5. **Cross-Tab Deep Navigation**:
   - Tapping _"Create your goal"_ on Home navigates to the Goals tab.
   - Tapping the Journal Preview on Home navigates to the Journal tab.
6. **Multi-Screen Responsive Layout**: Validated across mobile and tablet widths (320px, 375px, 402px, 600px, 800px) with 0 RenderFlex overflows.

---

## 🚀 Setup & Execution

### Prerequisites

- **Flutter SDK**: `>=3.19.0` (tested on Flutter `3.27.x` / `3.47.x`)
- **Dart SDK**: `>=3.3.0`

### Step-by-Step Instructions

1. **Clone or Navigate to the Project Root**:

   ```bash
   cd Test_Nisha
   ```

2. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

3. **Verify Code Formatting**:

   ```bash
   dart format --output=none --set-exit-if-changed lib test
   ```

4. **Run Static Code Analysis**:

   ```bash
   flutter analyze
   ```

   _(Expected result: `No issues found!`)_

5. **Run Automated Test Suite**:

   ```bash
   flutter test
   ```

   _(Expected result: `All tests passed!`)_

6. **Run the Application**:
   - **Chrome / Web**:
     ```bash
     flutter run -d chrome
     ```
   - **macOS Desktop**:
     ```bash
     flutter run -d macos
     ```
   - **Mobile Device / Emulator (iOS / Android)**:
     ```bash
     flutter run
     ```
