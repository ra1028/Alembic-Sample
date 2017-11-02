// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Alembic-Sample",
    dependencies: [
        .package(url: "https://github.com/ra1028/Alembic.git", .upToNextMinor(from: "3.1.0"))
    ],
    targets: [
        .target(name: "Alembic-Sample", dependencies: ["Alembic"], path: "Sources")
    ]
)