// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeveloperKit",
    products: [
        .library(name: "DeveloperKit", targets: ["DeveloperKit"]),// 只做聚合不放具体实现
		.library(name: "DeveloperUI", targets: ["DeveloperUI"]),
		.library(name: "DeveloperRxUI", targets: ["DeveloperRxUI"]),
		.library(name: "DeveloperRx", targets: ["DeveloperRx"]),
		.library(name: "DeveloperFoundation", targets: ["DeveloperFoundation"]),
    ],
	dependencies: [
		.package(url: "https://github.com/devxoul/Then", branch: "main"),
		.package(url: "https://github.com/ReactiveX/RxSwift", exact: "6.9.1"),
		.package(url: "https://github.com/SnapKit/SnapKit", exact: "5.7.1"),
		.package(url: "https://github.com/nicklockwood/SwiftFormat", branch: "main"),
	],
    targets: [
        .target(name: "DeveloperKit",
				dependencies: [
					"Then",
					"SnapKit",
					.target(name: "DeveloperUI"),
					.target(name: "DeveloperRxUI"),
					.target(name: "DeveloperRx"),
					.target(name: "DeveloperFoundation"),
			   ]),
		.target(name: "DeveloperUI",
				dependencies: [
					"Then",
					"SnapKit",
					.target(name: "DeveloperRxUI"),
					.target(name: "DeveloperRx"),
					.target(name: "DeveloperFoundation"),
					.product(name: "RxSwift", package: "RxSwift"),
				]),
		.target(name: "DeveloperRxUI",
				dependencies: [
					.target(name: "DeveloperRx"),
					.target(name: "DeveloperFoundation"),
					.product(name: "RxSwift", package: "RxSwift"),
				]),
		.target(name: "DeveloperRx",
				dependencies: [
					.target(name: "DeveloperFoundation"),
					.product(name: "RxSwift", package: "RxSwift"),
				]),
		.target(name: "DeveloperFoundation"),
		// MARK: - 下面都是测试Target
        .testTarget(name: "DeveloperKitTests", dependencies: ["DeveloperKit"]),
		.testTarget(name: "DeveloperFoundationTests", dependencies: ["DeveloperFoundation"]),
    ],
    swiftLanguageModes: [.v6]
)
