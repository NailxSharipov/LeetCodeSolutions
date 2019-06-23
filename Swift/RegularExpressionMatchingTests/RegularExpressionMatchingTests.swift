//
//  RegularExpressionMatchingTests.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import XCTest

class RegularExpressionMatchingTests: XCTestCase {
    
    func test_0() {
        let soulution = RegularExpressionMatching()
        let result = soulution.isMatch("aa", "a")
        XCTAssertEqual(result, false)
    }
    
    func test_1() {
        let soulution = RegularExpressionMatching()
        let result = soulution.isMatch("aa", "aa")
        XCTAssertEqual(result, true)
    }
    
    func test_2() {
        let soulution = RegularExpressionMatching()
        let result = soulution.isMatch("aa", "a*")
        XCTAssertEqual(result, true)
    }
    
    func test_3() {
        let soulution = RegularExpressionMatching()
        let result = soulution.isMatch("ab", ".*")
        XCTAssertEqual(result, true)
    }
    
    func test_4() {
        let soulution = RegularExpressionMatching()
        let result = soulution.isMatch("aab", "c*a*b")
        XCTAssertEqual(result, true)
    }
    
    func test_5() {
        let soulution = RegularExpressionMatching()
        let result = soulution.isMatch("mississippi", "mis*is*p*.")
        XCTAssertEqual(result, true)
    }
}
