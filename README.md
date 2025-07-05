# 📱 StringCalculatorTDD

A simple and interactive SwiftUI app built with **Test-Driven Development (TDD)** principles. This app takes a string of numbers separated by delimiters and returns their sum. Inspired by the classic **String Calculator Kata**!

![App Demo](StringCalculatorTDD/assets/Screen-Recording.mp4)

---

## 🚀 Features

- 💡 Elegant SwiftUI Interface
- 🧪 TDD-backed `StringCalculator` logic
- ✅ Handles multiple delimiters and edge cases
- 🎨 Smooth animations and transitions
- ☁️ Clean code and MVVM-style separation

---

## 🖼 Screenshots

### 🌟 Home Screen

![Home Screen](StringCalculatorTDD/assets/home-screen.png)

### 🟢 Button Animation
![Button Animation](StringCalculatorTDD/assets/animation-start.png)
![Button Animation](StringCalculatorTDD/assets/animation-middle.png)
![Button Animation](StringCalculatorTDD/assets/animation-end.png)

### ✅ Success Result

![Success Result](StringCalculatorTDD/assets/success-result.png)

### ❌ Error Handling

![Error Result](StringCalculatorTDD/assets/error-result.png)

---

## 🔢 Example Inputs

| Input                | Output |
|----------------------|--------|
| `1,2,3`              | `6`    |
| `4\n5,6`             | `15`   |
| `//;\n1;2`           | `3`    |
| `//[***]\n1***2***3` | `6`    |

> For more examples, check the test cases in `StringCalculatorTests.swift`.

---

## 🛠 How It Works

The app uses a `StringCalculator` class that implements the logic to parse and sum integers from a string input. It supports custom delimiters, newlines, and throws descriptive errors for invalid inputs.

The UI is built with SwiftUI and includes animations, focus state handling, and error/success indicators.

---

## 📦 Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/StringCalculatorTDD.git
   cd StringCalculatorTDD

open StringCalculatorTDD.xcodeproj

📋 Requirements
- iOS 15.0+

- Xcode 15+

- Swift 5.9+

🧪 Testing
This project follows TDD principles. All core logic is unit tested.

To run tests:

- Open the project in Xcode

- Use the ⌘ + U shortcut to run tests

👨‍💻 Author
Pintu Dodeja

- 💼 LinkedIn - [Pintu Dodeja](https://www.linkedin.com/in/pintu-dodeja)

- 📧 [Pintu Dodeja](dodeja.pintu@gmail.com)

🪪 License
- MIT License. See LICENSE file for details.

🙌 Contributions
Feel free to open issues or submit pull requests. Feedback and ideas are welcome!
