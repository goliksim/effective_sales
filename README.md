# EffectiveSales

## Content

0. [Description](#description)
1. [Installation](#installation)
2. [Usage](#usage)
3. [Stack](#features)
4. [Contributing](#contributing)
5. [License](#license)

## Description

Application for searching tickets as part of a test task in Effective Mobile

Completed by Alexander Golev (goliksim) 05/07/2024 - 05/14/2024

## Installation

Instructions on how to install your application. This may include cloning the repository, installing dependencies, and other necessary steps.

```bash
git clone link
cd effective_sales
# get dependencies
flutter pub get
flutter packages pub get
flutter packages get
# start code-gen
flutter gen-l10n 
flutter pub run build_runner build --delete-conflicting-outputs
```

## Usage
```bash
# run with dart-define
flutter run --dart-define=OFFERS_API_LINK=397d0a13-1029-4865-a257-068bc60cc11e --dart-define=TICKETS_OFFERS_API_LINK=632f8e89-618a-4357-ac07-1fcc397cd666 --dart-define=TICKETS_API_LINK=ba3e3f04-0d8e-44d7-9dee-0d8cbe6e5496
```

## Stack
- Clean Architecture
- App Structure: feature-first
- **Flutter/Dart**: My app is built with Flutter on Dart.
- **State Management**: Bloc.
- **Navigator**: go_route
- **API Integration**: Effective Mobile API on **mocky.io**.
- Networking: retrofit + dio
- **Database**: Shared preferences.
- Code gen: freezed

## Links
 - Figma - https://www.figma.com/file/Mpk2ewCODAz5wmr95vXn38/Untitled?type=design&mode=design&t=qLDb6uv5pkFoP5zD-0
 - API Main - [https://run.mocky.io/v3/397d0a13-1029-4865-a257-068bc60cc11e](https://run.mocky.io/v3/00727197-24ae-48a0-bcb3-63eb35d7a9de)
 - API Offers - [https://run.mocky.io/v3/632f8e89-618a-4357-ac07-1fcc397cd666](https://run.mocky.io/v3/3424132d-a51a-4613-b6c9-42b2d214f35f)
 - API Tickets - [https://run.mocky.io/v3/ba3e3f04-0d8e-44d7-9dee-0d8cbe6e5496](https://run.mocky.io/v3/2dbc0999-86bf-4c08-8671-bac4b7a5f7eb)

## Contributing
If you want to contribute to the development of this application, please follow the instructions below:

1. Fork the project.
2. Create your branch (git checkout -b feature/new-feature).
3. Make your changes and commit them (git commit -m 'Add new feature').
4. Push your branch (git push origin feature/new-feature).
5. Create a pull request (PR).
