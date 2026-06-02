// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeveloperKit",
    products: [
        .library(name: "DeveloperKit", targets: ["DeveloperKit"]),// 只做聚合不放具体实现
		.library(name: "DeveloperUI", targets: ["DeveloperUI"]),
		.library(name: "DeveloperRx", targets: ["DeveloperRx"]),
		.library(name: "DeveloperFoundation", targets: ["DeveloperFoundation"]),
    ],
	dependencies: [
		.package(url: "https://github.com/devxoul/Then", branch: "master"),
		.package(url: "https://github.com/ReactiveX/RxSwift", branch: "main"),
		.package(url: "https://github.com/SnapKit/SnapKit", branch: "develop"),
		.package(url: "https://github.com/nicklockwood/SwiftFormat", branch: "main"),
	],
    targets: [
        .target(name: "DeveloperKit",
				dependencies: [
					"Then",
					"SnapKit",
					.target(name: "DeveloperUI"),
					.target(name: "DeveloperRx"),
					.target(name: "DeveloperFoundation"),
			   ]),
		.target(name: "DeveloperUI",
				dependencies: [
					"Then",
					"SnapKit",
					.target(name: "DeveloperRx"),
					.target(name: "DeveloperFoundation"),
					.product(name: "RxSwift", package: "RxSwift"),
				]),
		.target(name: "DeveloperRx",
				dependencies: [
					.target(name: "DeveloperFoundation"),
					.product(name: "RxSwift", package: "RxSwift"),
				]
			   ),
		.target(name: "DeveloperFoundation"),
		// MARK: - 下面都是测试Target
        .testTarget(name: "DeveloperKitTests", dependencies: ["DeveloperKit"]),
		.testTarget(name: "DeveloperFoundationTests", dependencies: ["DeveloperFoundation"]),
    ],
    swiftLanguageModes: [.v6]
)
