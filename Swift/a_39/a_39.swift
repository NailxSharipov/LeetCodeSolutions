//
//  a_39.swift
//  a_39
//
//  Created by Nail Sharipov on 04.04.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_39: XCTestCase {

    func test_00() throws {
        let solution = CombinationSum()
        
        let result = solution.combinationSum([2,3,6,7], 7)
        
        let com = Set(result.map({ Set($0) }))
        
        XCTAssertEqual(com, Set([Set([2,2,3]), [7]]))
    }
}
