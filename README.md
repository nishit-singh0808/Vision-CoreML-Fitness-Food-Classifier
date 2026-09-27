# Vision + Core ML Fitness and Food Classifier

An iOS app prototype that uses Apple Vision and on-device Core ML models to classify food and workout equipment from photos. It also includes screens for food nutrition lookups, equipment details, workout suggestions, and model-based nutrition estimates.

## Features

- **Classify a photo:** Pick an image from the photo library or take one with the camera. Vision runs an on-device image-classification model and shows the top two labels with confidence scores.
- **Food details:** For recognized foods present in the app's local nutrition table, view example calories, fat, protein, and carbohydrate values.
- **Equipment details:** For supported equipment entries, view an image and open a linked YouTube demonstration.
- **Workout suggestions:** Select a body part, training level, and equipment type to get up to three suggestions from the included Core ML model.
- **Nutrition estimates:** Enter steps, calories burned, workout duration, sleep, age, weight, and height to get estimates from four included Core ML models.

Predictions and nutrition values are prototype outputs. They are not medical, dietary, or fitness advice. Classification labels may not match the app's local food and equipment detail tables.

## Technology

- Swift and UIKit with storyboards
- Apple Vision for image classification requests and image orientation/cropping
- Core ML for local inference
- PhotosUI and `UIImagePickerController` for selecting or capturing images

The Xcode project sets an iOS 14.0 deployment target. The app can run in Simulator for photo-library selection; camera capture requires a device with a camera.

## Open and run

1. Open `Vision+Core-ML.xcodeproj` in Xcode.
2. Select the `Vision + CoreML` scheme and an iOS Simulator or connected device.
3. Choose a development team in Signing & Capabilities if Xcode requests one.
4. Build and run. On a device, allow camera access when prompted to take a photo.

The Core ML models are included in `Models/`; Xcode generates their Swift model wrappers when building. No external package setup is required by the project.

## Project layout

```text
App/                 App delegate, app settings, and image assets
Configuration/       Xcode sample-code build configuration
Documentation/       Sample screenshots
Extensions/          Image orientation and confidence formatting helpers
Image Predictor/     Vision + Core ML image-classification pipeline
Main View/           Storyboard screens, data, and app workflows
Models/              Image, workout, and nutrition Core ML models
Vision+Core-ML.xcodeproj/
                     Xcode project and shared scheme
```

## Model and source attributions

This project includes code and models derived from or distributed with their own license and attribution terms. Keep the notices in `LICENSE/` and `Models/` when copying or redistributing the project. In particular, review `Models/LICENSE.txt` and `Models/NOTICE.txt` for the included MobileNet attribution. The notices do not necessarily describe the terms for every model in `Models/`.
