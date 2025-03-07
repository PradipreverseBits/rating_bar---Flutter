# Flutter Rating Bar Demo

A comprehensive Flutter application showcasing various types of rating bars and gauges.

## Features

### 1. Default Rating
- Simple star-based rating system
- Smooth animation effects
- Customizable star count and size

### 2. Gauge Rating
- Semi-circular gauge with dynamic needle movement
- Color gradient indication
- Real-time score display

### 3. Credit Score Rating
- Professional credit score visualization
- Range: 300-850
- Color-coded segments

### 4. Star Rating
- Interactive star rating system
- Half-star support
- Customizable colors and sizes

### 5. Heart Rating
- Animated heart-based rating
- Love meter visualization
- Smooth transitions

### 6. Emoji Rating
- Emotion-based rating system
- Interactive emoji selection
- Visual feedback

### 7. Mood Rating
- Semi-circular mood gauge
- Five distinct mood levels with emojis
- Interactive needle control
- Color-coded segments from red to green
- Real-time mood text display

## Connect With Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/pradip-khandla/)

Feel free to connect with me on LinkedIn or follow me on Twitter for more updates and discussions about Flutter development!

## Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/PradipreverseBits/rating_bar_demo.git
```

2. Navigate to project directory:
```bash
cd rating_bar_flutter
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

### Building

To generate route files:
```bash
dart run build_runner build --delete-conflicting-outputs
```

## Dependencies

- auto_route: For navigation
- flutter_hooks: For state management
- Other dependencies as listed in pubspec.yaml

## Project Structure

```
lib/
  ├── routes/
  │   └── app_router.dart
  ├── screens/
  │   ├── rating_bar_demo_screen.dart
  │   ├── gauge_rating_screen.dart
  │   ├── credit_score_screen.dart
  │   ├── star_rating_screen.dart
  │   ├── heart_rating_screen.dart
  │   ├── emoji_rating_screen.dart
  │   └── mood_rating_screen.dart
  ├── widgets/
  │   ├── gauge_rating_bar.dart
  │   ├── credit_score_rating_bar.dart
  │   ├── star_rating_bar.dart
  │   ├── heart_rating_bar.dart
  │   ├── emoji_rating_bar.dart
  │   ├── mood_rating_bar.dart
  │   └── custom_button.dart
  ├── theme.dart
  └── main.dart
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Contributors and maintainers
- Community feedback and support
