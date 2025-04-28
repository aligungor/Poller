# Poller

A lightweight and customizable polling utility using Combine.

## 📦 Features

- ✅ Periodic event publishing using `Combine`
- ⚡️ Optional immediate first fire (`fireImmediately`)
- 🛑 Easily start and stop polling
- 🧪 Fully tested with `XCTest`

---

## 🛠 Installation

### Swift Package Manager

Add the following to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/yourusername/Poller.git", from: "1.0.0")
```

Then add `"Poller"` to your target dependencies:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "Poller", package: "Poller")
    ]
)
```

Or use **Xcode**:

1. `File > Add Packages`
2. Paste the URL of this repo
3. Choose version and add `Poller` to your target

---

## 🚀 Usage

```swift
import Poller
import Combine

let poller = DefaultPoller(interval: 1.0, fireImmediately: true)
var cancellables = Set<AnyCancellable>()

poller.publisher
    .sink {
        print("Tick")
    }
    .store(in: &cancellables)

poller.start()

// Stop polling when needed
poller.stop()
```

---

## 📂 Structure

- `Sources/Poller` — Core implementation
- `Tests/PollerTests` — Unit tests

---

## 📄 License

MIT License. See [LICENSE](LICENSE) file for details.
