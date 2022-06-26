//
//  a_38.swift
//  a_38
//
//  Created by Nail Sharipov on 03.04.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_38: XCTestCase {

    func test_00() throws {
        let solution = CountAndSay()
        
        XCTAssertEqual(solution.countAndSay(1), "1")
    }

    func test_01() throws {
        let solution = CountAndSay()
        
        XCTAssertEqual(solution.countAndSay(2), "11")
    }
    
    func test_02() throws {
        let solution = CountAndSay()
        
        XCTAssertEqual(solution.countAndSay(3), "21")
    }
    
    func test_03() throws {
        let solution = CountAndSay()
        
        XCTAssertEqual(solution.countAndSay(4), "1211")
    }
    
}
