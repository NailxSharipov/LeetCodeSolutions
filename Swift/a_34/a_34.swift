//
//  a_34.swift
//  a_34
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_34: XCTestCase {

    func test_00() throws {
        XCTAssertEqual(FindFirstAndLastPositionOfElementInSortedArray.searchRange([5, 7, 7, 8, 8, 10], 8), [3, 4])
    }
    
    func test_01() throws {
        XCTAssertEqual(FindFirstAndLastPositionOfElementInSortedArray.searchRange([5, 7, 7, 8, 8, 10], 6), [-1, -1])
    }

    func test_10() throws {
        XCTAssertEqual([0, 0, 0, 1, 1, 2].findLeft(element: 0), 0)
    }
    
    func test_11() throws {
        XCTAssertEqual([0, 0, 0, 1, 1, 2].findLeft(element: 1), 3)
    }
    
    func test_12() throws {
        XCTAssertEqual([0, 0, 0, 1, 1, 2].findLeft(element: 2), 5)
    }
    
    func test_13() throws {
        XCTAssertEqual([0, 0, 0].findLeft(element: 0), 0)
    }
    
    func test_20() throws {
        XCTAssertEqual([0, 0, 0, 1, 1, 2].findRight(element: 0, start: 0), 2)
    }
    
    func test_21() throws {
        XCTAssertEqual([0, 0, 0, 1, 1, 2].findRight(element: 1, start: 3), 4)
    }
    
    func test_22() throws {
        XCTAssertEqual([0, 0, 0, 1, 1, 2].findRight(element: 2, start: 5), 5)
    }
    
    func test_23() throws {
        XCTAssertEqual([0, 0, 0].findRight(element: 0, start: 0), 2)
    }
}
