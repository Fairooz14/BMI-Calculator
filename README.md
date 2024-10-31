# BMI Calculator App

A minimalistic BMI calculator app developed using Flutter. The app includes theme toggling between light and dark modes, a user-friendly input interface, and displays results in categorized and color-coded formats.

## Features

- **Light and Dark Theme Toggle**
- **BMI Calculation**:
  - Results categorized as Underweight, Healthy, Overweight, or Obese
- **Color-coded Results**: Visual feedback on BMI category
- **User-Friendly Interface**:
  - Gender selection
  - Adjustable height, weight, and age fields

## Walkthrough Video

<div align="center">
  <video src="https://github.com/user-attachments/assets/2521a5b0-e32e-4751-a9bc-350c1af442da" controls width="700" height="400">
    Your browser does not support the video tag.
  </video>
</div>

## Project Structure

```plaintext
lib/
├── main.dart                         
├── home_game.dart
├── result_page.dart    
├── theme_controller.dart 
└── bmi_controller.dart
```

## Dependencis

- **Flutter**: 3.x or higher
- **Dart**: 2.x or higher
- **GetX**: State management library
- **Syncfusion Flutter Sliders**: For the height slider

## Getting Started

### Prerequisites

- Ensure that you have [Flutter](https://flutter.dev/docs/get-started/install) installed on your system.
- Add required dependencies by running:

  ```bash
  flutter pub add get
  flutter pub add get_storage
  flutter pub add syncfusion_flutter_sliders
  ```

## Installation

1. Clone the Repository
   ```
   https://github.com/Fairooz14/BMI-Calculator.git
   ```
   
2. Navigate to the Project Directory
   ```
   cd Bmi-Calculator
   ```
3. Install Dependencies
   ```
   flutter pub get
   ```
## Usage

- Select Gender: Choose between Male and Female options.
- Set Age and Weight: Use the + and - buttons to adjust values.
- Set Height: Slide vertically to adjust the height value.
- Calculate BMI: Press “Let’s Calculate” to view the BMI score, category, and health recommendations.
