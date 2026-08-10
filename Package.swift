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
        .package(url: "https://github.com/livekit/client-sdk-swift.git", exact: "2.10.2"),
    ],
    targets: [
        .binaryTarget(
            name: "SMIMultimediaCore",
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.12.0/SMIMultimediaCore-Release.xcframework.zip",
            checksum: "f0f505508e8c4700c44a2cbf90fe463fb96bf509a6180d680134e1a96099205f"
        ),
        .target(
            name: "SMIMultimediaCoreWrapper",
            dependencies: [
                "SMIMultimediaCore",
                .product(name: "LiveKit", package: "client-sdk-swift")
            ]
        )
    ]
)
