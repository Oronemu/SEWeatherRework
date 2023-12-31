
import ProjectDescription

extension Project {

    public static func feature(
        name: String,
        packages: [Package] = [],
        dependencies: [TargetDependency] = []
    ) -> Self {
        Self(
            name: name,
            packages: packages,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .staticFramework,
                    bundleId: "oronemu.\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    dependencies: dependencies
                )
            ]
        )
    }
}
