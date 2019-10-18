// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ModernAVPlayer",
	platforms: [SupportedPlatform.iOS("10.0")],
    products: [
        .library(name: "ModernAVPlayer", targets: ["ModernAVPlayer"]),
    ],
    targets: [
        .target(
            name: "ModernAVPlayer",
			path: "Sources/Core"
		)
    ]
)

