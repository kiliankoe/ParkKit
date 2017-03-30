import PackageDescription

let package = Package(
    name: "ParkKit",
    dependencies: [
      .Package(url: "https://github.com/utahiosmac/Marshal", Version(1,2,4))
    ]
)
