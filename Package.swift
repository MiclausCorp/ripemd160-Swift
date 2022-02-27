// swift-tools-version:5.5
import PackageDescription

/// ripemd160-Swift Package
let package = Package(
    /// Package Name
    name: "ripemd160-Swift",
    
    /// Package Products
    /// Products define the executables and libraries a package produces, and make them visible to other packages.
    products: [
        .library(
            name: "ripemd160-Swift",
            targets: ["ripemd160-Swift"])
    ],
    
    /// Package Targets
    /// Targets are the basic building blocks of a package. A target can define a module or a test suite.
    /// Targets can depend on other targets in this package, and on products in packages this package depends on.
    targets: [
        /// Main library
        .target(
            name: "ripemd160-Swift",
            path: "./Sources/"
        ),
        
        /// Unit tests
        .testTarget(
            name: "Tests",
            dependencies: ["ripemd160-Swift"],
            path: "./Tests/")
    ]
)
