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
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.13.1/SMIMultimediaCore-Release.xcframework.zip",
            checksum: "dcf64c1fe257a1ea4f9c930537d94caef985391241eaf6369af7d1235c694041"
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
