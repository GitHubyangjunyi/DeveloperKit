//
//  CollectionsTests.swift
//  DeveloperKit
//
//  Created by 杨俊艺 on 2026/5/28.
//

@testable import DeveloperFoundation
import Testing

struct CollectionsTests {
    @Test func test() {
        #expect([].isNotEmpty == false)
        #expect([1, 2, 3].isNotEmpty)
    }
}
