# Movist

A simple trial movie listing app based on MVVM-C best practices by using TheMovieDB

<p align="center">
<img src="/home.png"  width="300"/>
<img src="/movie.png" width="300"/>
</p>

## Project Tech Stack
* Xcode: Version 12.4 (12D4e)
* Language: Swift 5.3.2
* Minimum iOS Version: 13.0
* Design Pattern: MVVM-C
* Dependency  Manager: Swift Package Manager
* Dependencies: Alamofire, Cosmos, Kingfisher, ObjectMapper, PromiseKit
* Style Guide: [Raywenderlich](https://github.com/raywenderlich/swift-style-guide)
* Powered by [TheMovieDB](https://developers.themoviedb.org/3/getting-started/introduction) and ♥️

## Structure
```bash
⊢ Common
  ⊢ UI
    ⊢ XY.swift
    ⊢ XY.xib
⊢ Scenes
  ⊢ Movies
    ⊢ API
      ⊢ Tasks // Tasks that retrieve any related response coming from API.
    ⊢ Models // Entity for API
    ⊢ UI
        ⊢ Display
        ⊢ View
            ⊢ ABCDisplay.swift //Presentation/ViewModel object of ABC
            ⊢ ABCView.swift
            ⊢ ABCView.xib
    ⊢ ABCCoordinator.swift
    ⊢ ABCViewModel.swift
    ⊢ ABCViewController.swift
    ⊢ ABC.storyboard
```
