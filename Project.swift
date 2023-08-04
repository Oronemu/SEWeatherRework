
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "SEWeather",
    targets: [
        Target(
            name: "SEWeather",
            platform: .iOS,
            product: .app,
            bundleId: "oronemu.SEWeather",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
            infoPlist: "Info.plist",
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "Swinject"),
                .project(target: "Common", path: .relativeToRoot("Core/Common")),
                .project(target: "NetworkProvider",
                         path: .relativeToRoot("Core/NetworkProvider")),
                .project(target: "LocationProvider",
                         path: .relativeToRoot("Core/LocationProvider")),
                .project(target: "ForecastWeather", path: "Features/ForecastWeather"),
                .project(target: "CurrentWeather", path: "Features/CurrentWeather"),
                .project(target: "Onboarding", path: "Features/Onboarding")
            ]
        )
])
