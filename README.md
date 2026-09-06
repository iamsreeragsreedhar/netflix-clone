# court_flix

A new Flutter project.

## Getting Started

# Court Flix 🎬

A Netflix-inspired movie browsing application built with Flutter.

## Features

- Trending movies
- Popular movies
- Now playing movies
- Top-rated movies
- Movie search
- Coming Soon screen
- Movie details
- Pull-to-refresh
- Shimmer loading states
- Error handling
- Bottom navigation
- Dark Netflix-style UI

## Tech Stack

- Flutter
- Dart
- BLoC
- Clean Architecture
- Dio
- GetIt
- GoRouter
- Shimmer
- TMDB API

## Architecture

The application follows Clean Architecture with a feature-based structure.

```text
lib/
├── core/
│   ├── network/
│   ├── repository/
│   ├── shared_widget/
│   └── ...
│
├── feature/
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── search/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── ...
│
└── main.dart