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
            checksum: "dc62f201ec4a129613792a5e2007c2f871abbc51cda1b89725fd69adf80341d3"
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
