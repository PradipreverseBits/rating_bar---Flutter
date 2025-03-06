# Flutter Rating Bar Demo

A comprehensive demonstration of various rating bar implementations in Flutter using the `flutter_rating_bar` package. This project showcases different styles of rating bars including default stars, gauge ratings, credit scores, heart ratings, and emoji ratings.

## Features

- **Multiple Rating Styles**
  - Default Star Rating
  - Gauge Rating with Dynamic Score
  - Credit Score Rating with Color Gradient
  - Heart Rating with Animation
  - Emoji Rating
  - Custom Rating Indicators

- **Interactive Components**
  - Draggable rating indicators
  - Real-time score updates
  - Smooth animations
  - Responsive layouts

## Getting Started

### Prerequisites

- Flutter SDK (Latest Version)
- Dart SDK (Latest Version)
- Any IDE with Flutter support (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/rating_bar_demo.git
   ```

2. Navigate to the project directory:
   ```bash
   cd rating_bar_demo
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the build runner (for code generation):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── configurations/
│   └── rating_configuration.dart
├── routes/
│   └── app_router.dart
├── screens/
│   ├── rating_bar_demo_screen.dart
│   ├── gauge_rating_screen.dart
│   ├── credit_score_screen.dart
│   └── heart_rating_screen.dart
├── widgets/
│   ├── gauge_rating_bar.dart
│   ├── credit_score_rating_bar.dart
│   ├── heart_rating_bar.dart
│   └── rating_text_field.dart
├── utils/
│   └── rating_utils.dart
└── main.dart
```

## Dependencies

- flutter_rating_bar: ^4.0.1
- auto_route: ^7.8.4
- flutter_hooks: ^0.20.4

## Features in Detail

### Gauge Rating
- Semi-circular gauge with dynamic score display
- Smooth gradient colors from red to green
- Interactive draggable indicator
- Real-time score updates

### Credit Score Rating
- Color-coded segments
- Score indicator with animation
- Range-based color feedback
- Professional design

### Heart Rating
- Animated heart icons
- Customizable heart colors
- Half-rating support
- Smooth transitions

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the `flutter_rating_bar` package creators
- Flutter community for continuous support
- Contributors who helped improve the demo
