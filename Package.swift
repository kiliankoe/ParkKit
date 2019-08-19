// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ParkKit",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .watchOS(.v3),
        .tvOS(.v10)
    ],
    products: [
        .library(
            name: "ParkKit",
            targets: ["ParkKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ParkKit",
            dependencies: []),
        .testTarget(
            name: "ParkKitTests",
            dependencies: ["ParkKit"]),
    ]
)
