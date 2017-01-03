import PackageDescription

let package = Package(
    name: "ParkKit",
    dependencies: [
      .Package(url: "https://github.com/lyft/mapper", majorVersion: 6)
    ]
)
