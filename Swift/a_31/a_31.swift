//
//  a_31.swift
//  a_31
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_31: XCTestCase {

    func test_00() throws {
        var array = [1, 2, 3]
        Next_Permutation.nextPermutation(&array)
        XCTAssertEqual(array, [1, 3, 2])
    }
    
    func test_01() throws {
        var array = [2, 3, 1]
        Next_Permutation.nextPermutation(&array)
        XCTAssertEqual(array, [3, 1, 2])
    }
    
    func test_02() throws {
        var array = [3, 2, 1]
        Next_Permutation.nextPermutation(&array)
        XCTAssertEqual(array, [1, 2, 3])
    }
    
    func test_03() throws {
        var array = [1, 3, 2]
        Next_Permutation.nextPermutation(&array)
        XCTAssertEqual(array, [2, 1, 3])
    }
    
    func test_04() throws {
        var array = [1, 5, 1]
        Next_Permutation.nextPermutation(&array)
        XCTAssertEqual(array, [5, 1, 1])
    }

}
