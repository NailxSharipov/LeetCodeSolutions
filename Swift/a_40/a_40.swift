//
//  a_40.swift
//  a_40
//
//  Created by Nail Sharipov on 04.04.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_40: XCTestCase {

    func test_00() throws {
        let solution = CombinationSum2()
        
        let result = solution.combinationSum([10,1,2,7,6,1,5], 8)
        
        let com = Set(result.map({ Set($0) }))
        
        XCTAssertEqual(com, Set([Set([2,2,3]), [7]]))
    }

}
