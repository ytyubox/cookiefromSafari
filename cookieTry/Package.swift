// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "cookieTry",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMinor(from: "3.3.0")),
        // 👤 Authentication and Authorization framework for Fluent.
                .package(url: "https://github.com/vapor/auth.git", from: "2.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor","Authentication"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

