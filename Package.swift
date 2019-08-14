// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "apple_pie",
//    dependencies: [
//        // 💧 A server-side Swift web framework.
//        .package(url: "https://github.com/vapor/vapor.git", .upToNextMinor(from: "3.3.0")),
//        //.package(url: "https://github.com/vapor/fluent-sqlite.git", .upToNextMinor(from: "3.0.0")),
//        //.package(url: "https://github.com/vapor/fluent-postgresql.git", .upToNextMinor(from: "2.1.2")),
//        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", .upToNextMinor(from: "2.0.0")),
//        //.package(url: "https://github.com/vapor/open-crypto.git", .upToNextMinor(from: "3.3.3")),
//    ],
//    targets: [
//        .target(name: "App", dependencies: ["Vapor", /*"FluentSQLite", */"FluentPostgresDriver"/*, "OpenCrypto"*/]),
//        .target(name: "Run", dependencies: ["App"]),
//        .testTarget(name: "AppTests", dependencies: ["App"]),
//    ]
    
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMinor(from: "3.3.0")),
        .package(url: "https://github.com/vapor/leaf.git", .upToNextMinor(from: "3.0.0")),
        //        .package(url: "https://github.com/vapor/fluent-sqlite.git", .upToNextMinor(from: "3.0.0")),
        //        .package(url: "https://github.com/vapor/fluent-mysql.git", .upToNextMinor(from: "3.0.0")),
        .package(url: "https://github.com/vapor/fluent-postgresql.git", .upToNextMinor(from: "1.0.0")),
        .package(url: "https://github.com/vapor/crypto.git", .upToNextMinor(from: "3.3.0")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "Leaf", "FluentPostgreSQL", "Crypto"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

