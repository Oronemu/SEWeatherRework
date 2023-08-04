import ProjectDescription

// swift-tools-version:4.0

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .package(url: "https://github.com/Swinject/Swinject.git", .exact("2.8.1")),
        ]
    ),
    platforms: [.iOS]
)
