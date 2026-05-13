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
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.11.2/SMIMultimediaCore-Release.xcframework.zip",
            checksum: "787d96e65e2521c43b9067b3ea13db3fb26d0ab02f3ade1b8f56602e39f2532e"
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
