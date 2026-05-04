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
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.11.1/SMIMultimediaCore-Release.xcframework.zip",
            checksum: "c1a744fff5bb4f5821cd1c9353410287880a405c63a7f9913dddb74e30e12818"
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
