//
//  a_41.swift
//  a_41
//
//  Created by Nail Sharipov on 04.04.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_41: XCTestCase {

    func test_00() throws {
        let solution = FirstMissingPositive()
        
        let result = solution.firstMissingPositive([1, 2, 0])

        XCTAssertEqual(3, result)
    }
    
    func test_01() throws {
        let solution = FirstMissingPositive()
        
        let result = solution.firstMissingPositive([3, 4, -1, 1])

        XCTAssertEqual(2, result)
    }
    
    func test_02() throws {
        let solution = FirstMissingPositive()
        
        let result = solution.firstMissingPositive([7, 8, 9, 11, 12])

        XCTAssertEqual(1, result)
    }
    
}
