// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SMIMultimediaCore",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SMIMultimediaCore",
            targets: ["SMIMultimediaCore", "SMIMultimediaCoreWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/livekit/client-sdk-swift-xcframework.git", .upToNextMinor(from: "2.16.0")),
    ],
    targets: [
        .binaryTarget(
            name: "SMIMultimediaCore",
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.13.3/SMIMultimediaCore-Release.xcframework.zip",
            checksum: "d02d53e411efb1ce04f6d4477f6c1ba88f3c6df4a62732053eb1883956a890e4"
        ),
        .target(
            name: "SMIMultimediaCoreWrapper",
            dependencies: [
                "SMIMultimediaCore",
                .product(name: "LiveKit", package: "client-sdk-swift-xcframework")
            ]
        )
    ]
)
