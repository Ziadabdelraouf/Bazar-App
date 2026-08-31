# Bazar Books

**Cross-Platform Flutter Mobile Application**

Bazar Books is a cross-platform mobile application built with Flutter that provides users with a modern and intuitive experience for discovering, browsing, and buying books. The application delivers a clean, responsive interface while integrating trusted third-party services for book data, authentication, and push notifications.

The project follows Clean Architecture principles, separating presentation, domain, and data layers to ensure scalability, testability, and long-term maintainability.

## Features

- Splash screen with brand animation
- Onboarding flow (3 slides)
- User authentication — Email/Password, Google Sign-In, Apple Sign-In, Phone (OTP)
- Sign-up email verification and phone OTP verification
- Forgot password via email and phone flows
- Home page with special offers carousel, top-of-week books, authors, and vendors
- Book detail page
- Category browsing with tab bar
- Search with recent searches history
- Favorites (persisted to Firestore)
- Cart and checkout (local persistence)
- Order confirmation with address selection, payment method, and delivery scheduling
- Order history
- Push notifications (Firebase Cloud Messaging — foreground and background)
- Profile: My Account, Address, Order History, Help Center
- Dark and Light theme toggle
- Arabic and English localization with full RTL support
- Responsive layout system (Mobile, Tablet, Desktop)
- Reusable UI component library (buttons, inputs, app bars, rating stars)

## Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform development |
| Dart | Programming language |
| Firebase Auth | Authentication (Email, Google, Apple, Phone) |
| Cloud Firestore | Database and favorites persistence |
| Firebase Messaging | Push notifications (FCM) |
| Firebase App Check | Backend abuse protection |
| Google Books API | Book data |
| Riverpod | State management |
| Dio | HTTP client |
| Freezed / json_serializable | Code generation (models, sealed classes) |
| google_maps_flutter | Map integration |
| geocoding | Address resolution |
| flutter_local_notifications | Local notification display |
| responsive_framework | Responsive layout system |
| intl / intl_utils | Localization (AR + EN) |
| flutter_secure_storage | Secure token storage |
| shared_preferences | Lightweight local persistence |
| flutter_svg | SVG icon rendering |
| Git | Version control |

## Architecture

This project follows **Clean Architecture**, with each feature organized into three layers:

- **presentation** — screens, widgets, state management (Riverpod providers and notifiers)
- **domain** — entities, use cases, repository interfaces
- **data** — models, API/Firebase integration, repository implementations

## Project Structure

```
lib/
│
├── core/
│   ├── components/         # Reusable UI components (buttons, inputs, app bars)
│   ├── constants/          # API constants, enums
│   ├── localization/       # ARB files and generated l10n classes (AR + EN)
│   ├── network/            # Dio client and interceptors
│   ├── notifications/      # FCM service and Riverpod notification provider
│   ├── responsive/         # Breakpoint definitions and responsive extensions
│   ├── router/             # App routes and route builder
│   ├── theme/              # Colors, text styles, icons, images, theme data
│   └── utils/              # Firebase error utilities
│
├── features/
│   ├── auth/               # Sign-in, sign-up, OTP verification, OAuth
│   ├── cart_checkout/      # Cart, checkout, order confirmation
│   ├── categories/         # Category browsing and book listing
│   ├── forgot_password/    # Password reset flows
│   ├── home/               # Home view, offers, authors, vendors, book detail
│   ├── notifications/      # Notifications page
│   ├── offers/             # Coupons and offers page
│   ├── onboarding/         # Onboarding slides
│   ├── orders/             # Order tracking
│   ├── profile/            # My Account, Favorites, Order History, Help Center, Address
│   ├── search/             # Search with recent searches
│   └── splash_screen/      # Splash screen
│
└── main.dart
```

## Design

Application UI and user experience are implemented according to the approved product design.

**Design Reference:**
https://www.figma.com/design/Pxpnq99X09fjpDnqmhbQJ9/Bazar---Books-Mobile-App--Community-?node-id=0-1&p=f&t=XzH3d51wGYySBOU1-0

## Getting Started

Ensure you have Flutter version 3.44.2.

Clone the repository:
```
git clone <repository-url>
```

Copy the environment file and fill in the required values:
```
cp .env.example .env
```

Install dependencies:
```
flutter pub get
```

Regenerate localization files:
```
dart run intl_utils:generate
```

Run the application:
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
