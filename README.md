# Premium Shopping App

A modern, high-performance Flutter e-commerce application built with **GetX**, featuring a premium UI/UX, Dark Mode support, and robust state management.

## ✨ Features

- **Product Listing:** A clean, grid-based view of products with modern cards.
- **Product Details:** Immersive view with large imagery, smooth transitions, and detailed information.
- **Real-time Search:** Instant local filtering by product title with a sleek search UI.
- **Favorites System:** Save and manage your favorite products with local persistence.
- **Dark Mode Support:** Complete theme switching (Light/Dark) with persistence.
- **Immersive Animations:** Hero transitions and staggered grid animations for a premium feel.
- **Pull to Refresh:** Easy data refreshing with modern loading indicators.
- **Shimmer Effects:** Professional skeleton loaders during data fetching.
- **Error Handling:** Graceful handling of network failures with retry options.

---

## 🏗️ Project Structure

The project follows a **Feature-First Architecture**, ensuring high maintainability and scalability.

```text
lib/
├── core/               # Shared logic, constants, and global widgets
│   ├── constants/      # Colors, themes, and static strings
│   ├── services/       # Core services (Storage, etc.)
│   ├── theme/          # Theme configurations and controller
│   ├── utils/          # Bindings and helpers
│   └── widgets/        # Reusable global UI components
├── features/           # Independent feature modules
│   └── products/       # Product-related screens, controllers, and models
├── routes/             # Navigation and route definitions
└── main.dart           # Application entry point
```

---

## 🛠️ Tech Stack & Packages

| Package | Purpose |
|---------|---------|
| **GetX** | State Management, Dependency Injection, and Navigation |
| **http** | Performing asynchronous API calls |
| **shared_preferences** | Persistent local storage for favorites and themes |
| **cached_network_image** | Efficient image caching and loading |
| **shimmer** | Beautiful skeleton loading effects |
| **flutter_staggered_animations** | Smooth, staggered list/grid animations |

---

## 🚀 Architecture & Data Flow

The application is built on a clear separation of concerns:

1.  **UI Layer:** Responsible for rendering and user interaction (StatelessWidgets + Obx).
2.  **Controller Layer:** Manages business logic and reactive state (GetxController).
3.  **Service Layer:** Handles external data sources (API services).
4.  **Model Layer:** Defines data structures and JSON serialization.

**Data Flow:**
`API` ➔ `ProductService` ➔ `ProductController` (State) ➔ `UI` (Obx)

---

## 🌐 API Reference

Data is fetched from the **Fake Store API**:
`https://fakestoreapi.com/products`

---

## 💾 Local Storage

**SharedPreferences** is used to persist:
- **Favorites:** A list of product IDs marked by the user.
- **Theme Preference:** The user's selection of Light or Dark mode.

---

## ⚙️ Installation

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd shopping_app
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

---

## 🔮 Future Improvements

- [ ] **Cart System:** Comprehensive shopping cart with checkout flow.
- [ ] **Authentication:** User login, registration, and profile management.
- [ ] **Product Categories:** Filtering and browsing products by category.
- [ ] **Pagination:** Infinite scrolling for large product lists.
- [ ] **Offline Support:** Local caching of API data for offline browsing.
- [ ] **Product Reviews:** Section for user ratings and feedback.

---

Developed with ❤️ as a demonstration of clean architecture and premium UI in Flutter.
