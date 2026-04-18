# 📱 Flutter Multi-Page App

Aplikasi Flutter sederhana berbasis multi-halaman dengan fitur login, dashboard, counter, profile, dan settings menggunakan state management **Provider**.

---

## 🚀 Fitur Utama

* 🔐 **Login Page**

  * Validasi username & password
  * SnackBar feedback
  * Navigasi ke dashboard

* 🏠 **Dashboard Page**

  * Tampilan modern (UI aesthetic)
  * Greeting dinamis berdasarkan user
  * Grid menu navigasi

* 🔢 **Counter Page**

  * Stateful counter (+ / -)
  * Menggunakan Provider

* 👤 **Profile Page**

  * Menampilkan data user
  * Status login

* ⚙️ **Settings Page**

  * Toggle Dark / Light Mode
  * State global dengan Provider

* 🚪 **Logout System**

  * Popup konfirmasi
  * Reset navigation (tidak bisa back)

---

## 🧠 Arsitektur

Menggunakan pendekatan:

* `State Management`: Provider (ChangeNotifier)
* `Routing`: Named Routes
* `Separation of Concern`:

  * `controllers/` → logic
  * `pages/` → UI

---

## 📂 Struktur Folder

```
lib/
│
├── controllers/
│   ├── auth_controller.dart
│   ├── counter_controller.dart
│   └── setting_controller.dart
│
├── pages/
│   ├── login_page.dart
│   ├── dashboard_page.dart
│   ├── counter_page.dart
│   ├── profile_page.dart
│   └── setting_page.dart
│
└── main.dart
```

---

## 🛠️ Teknologi

* Flutter
* Dart
* Provider (State Management)

---

## ▶️ Cara Menjalankan

```bash
flutter pub get
flutter run -d chrome
```

Atau untuk emulator:

```bash
flutter run
```

---

## 🎨 Tampilan

* UI modern (gradient, card, rounded)
* Responsive (web & mobile)
* Dark / Light mode

---

## 🔄 Workflow Git

Update project:

```bash
git add .
git commit -m "update fitur"
git push
```

---

## 📌 Catatan

Project ini dibuat untuk:

* Pembelajaran Flutter
* Portfolio development
* Dasar arsitektur aplikasi mobile modern

---

## ✨ Pengembangan Selanjutnya

* Firebase Authentication
* Database (Firestore / MySQL API)
* Notifikasi
* Animasi lanjutan
* UI premium (Material 3 / custom design)

---

## 👨‍💻 Author

Developed by **Revaldi**

---

## ⭐ Penutup

Project ini menunjukkan implementasi:

* Navigation
* State Management
* UI/UX dasar Flutter

Cocok sebagai pondasi untuk aplikasi yang lebih kompleks 🚀
