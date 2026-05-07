# SeNless SoNe zero

<p align="center">
  <img src="Screenshot/Logo.png" width="200" alt="SeNless SoNe Logo">
</p>

This is an e-commerce concept for a vintage video tape store, built as part of the Mobile Application Development course at Binus. It covers the basics of a store app: browsing movies, managing a cart, and an admin side for handling the inventory.

## Demo Video
### 📱 App Walkthrough

<div align="center">
  <video src="https://github.com/ghtmarco/SeNless-SoNe-zero/raw/main/assets/video/demo.mp4" width="100%" controls autoplay loop muted>
    Your browser does not support the video tag.
  </video>
</div>

## Screenshots

### Auth Flow
| Login | Sign Up |
|---|---|
| ![Login](Screenshot/LoginPage.jpg) | ![Sign Up](Screenshot/SignUpPage.jpg) |

### Store Experience
| Home | Product Detail | Shopping Cart |
|---|---|---|
| ![Home](Screenshot/HomePage.jpg) | ![Detail](Screenshot/ProductDetailPage.jpg) | ![Cart](Screenshot/ShoppingCartPage.png) |

### Admin Side
| Video List | Add Video | Edit Video |
|---|---|---|
| ![List](Screenshot/VideoListPage.jpg) | ![Add](Screenshot/AddVideoPage.jpg) | ![Edit](Screenshot/EditVideoPage.jpg) |

## Tech Stack
- **Frontend:** Flutter
- **Backend:** Node.js (Express)
- **Database:** MariaDB / MySQL
- **Auth:** Google Sign-In & Email/Password

## Installation

### Frontend
<!-- AUTO-GENERATED:SCRIPTS_FRONTEND -->
1. Navigate to `FrontEnd`
2. Run `flutter pub get`
3. Run `flutter run`

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install Flutter dependencies |
| `flutter run` | Run the app in debug mode |
| `flutter build apk` | Build Android APK |
<!-- /AUTO-GENERATED:SCRIPTS_FRONTEND -->

### Backend
<!-- AUTO-GENERATED:SCRIPTS_BACKEND -->
1. Navigate to `BackEnd`
2. Run `npm install`
3. Set up your `.env` file (see table below)
4. Run `npm start` (Database dump is in `BackEnd/database/`)

| Command | Description |
|---------|-------------|
| `npm install` | Install Node.js dependencies |
| `npm start` | Start production server |
| `npm run dev` | Start development server with Nodemon |
<!-- /AUTO-GENERATED:SCRIPTS_BACKEND -->

### Environment Variables (BackEnd)
<!-- AUTO-GENERATED:ENV_BACKEND -->
| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| `PORT` | No | Server port (default: 3000) | `3000` |
| `DB_HOST` | Yes | Database host | `localhost` |
| `DB_USER` | Yes | Database user | `root` |
| `DB_PASS` | No | Database password | `password123` |
| `DB_NAME` | Yes | Database name | `videotape_store` |
| `JWT_SECRET` | Yes | Secret key for JWT | `your_secret_key` |
| `JWT_EXPIRES_IN` | No | JWT expiration time | `24h` |
<!-- /AUTO-GENERATED:ENV_BACKEND -->

---
*Created for academic purposes at Binus University.*
