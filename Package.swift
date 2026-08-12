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
        .package(url: "https://github.com/livekit/webrtc-xcframework.git", exact: "137.7151.10"),
    ],
    targets: [
        .binaryTarget(
            name: "SMIMultimediaCore",
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.11.3/SMIMultimediaCore-Release.xcframework.zip",
            checksum: "69a0a6130acc2209241b354c3bbe54f6bb939d690ce695614beb43c5f6d2f035"
        ),
        .target(
            name: "SMIMultimediaCoreWrapper",
            dependencies: [
                "SMIMultimediaCore",
                .product(name: "LiveKitWebRTC", package: "webrtc-xcframework")
            ]
        )
    ]
)
