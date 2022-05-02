// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BottomSheetPackage",
    platforms: [.iOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BottomSheetPackage",
            targets: ["BottomSheetPackage"]),
    ],
  
    targets: [
        .binaryTarget(name: "BottomSheetComponent", path: ".Sources/BottomSheetComponent.xcframework" )
    ]
)
