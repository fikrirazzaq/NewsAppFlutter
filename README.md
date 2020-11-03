# News App
![GitHub stars](https://img.shields.io/github/stars/rrifafauzikomara/NewsApp?style=social)
![GitHub forks](https://img.shields.io/github/forks/rrifafauzikomara/NewsApp?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/rrifafauzikomara/NewsApp?style=social)

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/rrifafauzikomara/MovieCatalogue)


## Features
* Headline
* Detail News
* Dynamic Behavior (Cupertino for iOS, Material for Android)
* Dynamic Theme (Light and Dark)
* Localization


## 📸 Example iOS
<pre>
<img src="screenshot/ios1.png" width="30%">     <img src="screenshot/ios2.png" width="30%">     <img src="screenshot/ios3.png" width="30%">     <img src="screenshot/ios4.png" width="30%">     <img src="screenshot/ios5.png" width="30%">     <img src="screenshot/ios6.png" width="30%">
</pre>


## 📸 Example Android
<pre>
<img src="screenshot/android1.png" width="30%">     <img src="screenshot/android2.png" width="30%">     <img src="screenshot/android3.png" width="30%">     <img src="screenshot/android4.png" width="30%">     <img src="screenshot/android5.png" width="30%">     <img src="screenshot/android6.png" width="30%">
</pre>


## Quick start
This is a normal flutter app. You should follow the instructions in the [official documentation](https://flutter.io/docs/get-started/install).
This project uses **BLoC** (business logic component) to separate the business logic with UI itself and uses **Modularization** approach to separate each modules.
It's recommended to do self-study about it in here (BLoC: [here](https://bloclibrary.dev/), Modularization: [here](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a) and [here](https://pub.dev/packages/flutter_modular)).


## Modularization Structure 🔥

    # Root Project
    .
    ├── features               # Name of directory
    |   ├── feature A          # Feature module with a clean architecture inside it.
    |   ├── feature B
    |   └── feature etc
    |
    ├── lib                    # Name of module (default from Flutter)
    |
    └── libraries              # Name of directory
        ├── core               # Core module.
        ├── dependencies       # Handle dependency version updates.
        └── shared             # Handle common utility class and custom widget.


## Clean Architecture Flow (Feature Module) 🔥
<pre>
<img src="screenshot/architecture.png">
</pre>


## Built With 🛠
* [Modularization](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a) with [flutter_modular](https://pub.dev/packages/flutter_modular) packages  - Separate functionality into independent, interchangeable modules.
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in `Dart` often involves having to override the `==` operator.
* [Json Serializable](https://pub.dev/packages/json_serializable) - Builders for handling JSON.
* [Dio](https://github.com/flutterchina/dio/) - A type-safe HTTP client.
* [BLoC Pattern](https://bloclibrary.dev/) - Business logic component to separate the business logic with UI.
* State - (Loading, No Data, Has Data, No Internet Connection, Request Timeout, Error)
* [Flutter Screenutil](https://pub.dev/packages/flutter_screenutil) - Responsive UI.
* [Flavor](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b) - Handling different environments for development and production.
* [Localization](https://pub.dev/packages/easy_localization) - Easy to change language between English and Indonesian.


## Todo
* [ ] Favorite News using Moor
* [ ] CI/CD
* [ ] Unit Testing
* [ ] Integration Testing
* [ ] Code Coverage
* [ ] Publish to Play Store


## How to run Flutter App
### Generated `*.g.dart` file
Before run the app, make sure to generate `*.g.dart` file, you can use this command on terminal. But before you running that, make sure go to [list_news](https://github.com/rrifafauzikomara/NewsApp/tree/master/features/list_news) feature module first using `cd` command. For example `cd features` then `cd list_news`. Then you can run the command below.

One time build:
```console
flutter pub run build_runner build
```
or you can watch for changes and rebuild automatically
```console
flutter pub run build_runner watch
```


### Run Flutter with command prompt
Development
```console
flutter run --flavor development --target=lib/ui/launcher/main-dev.dart
```
Production
```console
flutter run --flavor production --target=lib/ui/launcher/main-prod.dart
```


### Run Flutter with green button
Just follow this [instruction](https://github.com/rrifafauzikomara/MovieApp#run-flutter-app-between-flavor-for-development-and-production-with-).


## Author

* **R Rifa Fauzi Komara**

Don't forget to follow me, fork and give me a ⭐


## License

```
MIT License

Copyright (c) [2020] [R Rifa Fauzi Komara]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```