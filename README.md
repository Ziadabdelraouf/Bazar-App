# Bazar Books

**Cross-Platform Flutter Mobile Application**

Bazar Books is a cross-platform mobile application built with Flutter that provides users with a modern and intuitive experience for discovering, browsing, and buying books. The application delivers a clean, responsive interface while integrating trusted third-party services for book data and authentication.

The project follows Clean Architecture principles, separating presentation, domain, and data layers to ensure scalability, testability, and long-term maintainability.

## Features

- Modern and responsive user interface
- User authentication (Email, Google, Apple, Phone Number)
- Book discovery and browsing
- Search functionality
- Book, author, and vendor details
- Cart, checkout, and order tracking
- Clean and consistent design system
- Reusable UI components
- Cross-platform support for Android and iOS

## Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform development |
| Dart | Programming language |
| Firebase | Authentication, database, backend services |
| Google Books API | Book data |
| Git | Version control |

## Architecture

This project follows **Clean Architecture**, with each feature organized into three layers:

- **presentation** — screens, widgets, state management
- **domain** — entities, use cases, repository interfaces
- **data** — models, API/Firebase integration, repository implementations

## Project Structure

```
lib/
│
├── core/
├── features/
│   └── feature_name/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── main.dart
```

## Design

Application UI and user experience are implemented according to the approved product design.

**Design Reference:**
https://www.figma.com/design/Pxpnq99X09fjpDnqmhbQJ9/Bazar---Books-Mobile-App--Community-?node-id=0-1&p=f&t=XzH3d51wGYySBOU1-0

## Getting Started
Ensure you have Flutter version 3.44.2

Clone the repository
```
git clone <repository-url>
```

Install dependencies
```
flutter pub get
```

Run the application
```
flutter run
```

## Development Workflow

This project follows a feature-branch workflow.

1. Create a new feature branch from `dev`.
2. Implement the assigned feature following Clean Architecture layering.
3. Commit changes using clear commit messages.
4. Push the feature branch.
5. Open a Pull Request.
6. Obtain the required review and approval.
7. Merge into `main` / `dev`.

Direct commits to the `main` branch are not permitted.

## Branch Naming Convention

```
feature/theme
feature/home
feature/search
bugfix/login
hotfix/navigation
```

## Commit Convention

```
feat: implement splash screen
feat: add onboarding screens
fix: resolve navigation issue
refactor: improve theme structure
docs: update README
style: format code
```
