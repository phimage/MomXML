// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MomXML",
    products: [
        .library(name: "MomXML", targets: ["MomXML"]),
    ],
    dependencies: [
        .package(url: "https://github.com/drmohundro/SWXMLHash.git", from: "8.1.0")
    ],
    targets: [
        .target(
            name: "MomXML",
            dependencies: [
                "SWXMLHash"
            ],
            path: "Sources"),
        .testTarget(
            name: "MomXMLTests",
            dependencies: ["MomXML"],
            path: "Tests",
            exclude: ["Model.xcdatamodeld"],
            resources: [
                .process("model.xml"), .process("model2.xml"), .process("modelJsonToXML.xml")
            ])
    ],
    swiftLanguageModes: [
        .v6
    ]
)
