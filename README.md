# Flutter Rating Bar Demo

A comprehensive demonstration of different rating bar implementations in Flutter using the `flutter_rating_bar` package.

## Features

- **Basic Rating Bar**: Simple star-based rating with half ratings
- **Custom Rating Bar**: Heart-shaped rating icons
- **Indicator Rating Bar**: Read-only rating display
- **Color Changing Emoji Rating Bar**: Emoji-based rating with color transitions
  - 😡 Dark Red (1 star)
  - 😕 Pink (2 stars)
  - 😊 Yellow (3 stars)
  - 😃 Light Green (4 stars)
  - 🤩 Dark Green (5 stars)
- **Interactive Rating Input**: Text field input with real-time rating bar update

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
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

4. Run the app:
```bash
flutter run
```

## Dependencies

- [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar): ^4.0.1

## Project Structure

```
lib/
├── configurations/
│   └── rating_configuration.dart
├── screens/
│   └── rating_bar_demo_screen.dart
├── utils/
│   └── rating_utils.dart
├── widgets/
│   ├── rating_bar_widget.dart
│   └── rating_text_field.dart
└── main.dart
```

## Features in Detail

1. **Basic Rating Bar**
   - Star-based rating system
   - Supports half ratings
   - Amber colored stars

2. **Custom Rating Bar**
   - Heart-shaped icons
   - Red colored hearts
   - Supports half ratings

3. **Indicator Rating Bar**
   - Read-only rating display
   - Useful for displaying fixed ratings
   - Larger size for better visibility

4. **Color Changing Emoji Rating Bar**
   - Different emojis for each rating level
   - Color transitions from red to green
   - Whole number ratings only

5. **Interactive Rating Input**
   - Text field input (0-5)
   - Real-time rating bar update
   - Input validation
   - Supports decimal values

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the creators of the `flutter_rating_bar` package
- Flutter team for the amazing framework
