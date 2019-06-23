//
//  ZigZagConversionTests.swift
//  LeetCode
//
//  Created by Nail Sharipov on 09/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import XCTest
//@testable import LeetCode

class ZigZagConversionTests: XCTestCase {

    func test_0() {
        let soulution = ZigZagConversion()
        let result = soulution.convert("PAYPALISHIRING", 3)
        XCTAssertEqual("PAHNAPLSIIGYIR", result)
    }
    
    func test_1() {
        let soulution = ZigZagConversion()
        let result = soulution.convert("PAYPALISHIRING", 4)
        XCTAssertEqual("PINALSIGYAHRPI", result)
    }

    func test_2() {
        let soulution = ZigZagConversion()
        let result = soulution.convert("ABC", 2)
        XCTAssertEqual("ACB", result)
    }
}
