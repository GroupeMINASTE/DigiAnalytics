# DigiAnalytics

[![License](https://img.shields.io/github/license/GroupeMINASTE/DigiAnalytics)](LICENSE)
[![Issues](https://img.shields.io/github/issues/GroupeMINASTE/DigiAnalytics)]()
[![Pull Requests](https://img.shields.io/github/issues-pr/GroupeMINASTE/DigiAnalytics)]()
[![Code Size](https://img.shields.io/github/languages/code-size/GroupeMINASTE/DigiAnalytics)]()

Realtime web analytics with privacy and simplicity at its core.

## Installation

Add `https://github.com/GroupeMINASTE/DigiAnalytics.git` to your Swift Package configuration (or using the Xcode menu: `File` > `Swift Packages` > `Add Package Dependency`)

## Register your app

Go to [https://digianalytics.fr/websites/new](https://digianalytics.fr/websites/new) to register your app.

You need to choose a domain name or subdomain to associate your app with.
In this example, we will use `https://app.example.com/` as website URL.

## Usage

Setup a shared instance of your analytics object:

```swift
import DigiAnalytics

extension DigiAnalytics {

    static let shared = DigiAnalytics(baseURL: "https://app.example.com/")

}
```

Then, send requests where you want to get analytics (e.g. in a view controller `viewDidAppear(_:)`)

```swift
// Will appear on dashbord as `https://app.example.com/home`
DigiAnalytics.shared.send(path: "home")
```
