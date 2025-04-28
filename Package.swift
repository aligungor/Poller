// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Poller",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Poller",
            targets: ["Poller"]
        ),
    ],
    dependencies: [
        // No external dependencies.
    ],
    targets: [
        .target(
            name: "Poller",
            path: "Sources"
        ),
        .testTarget(
            name: "PollerTests",
            dependencies: ["Poller"],
            path: "Tests"
        ),
    ]
)
