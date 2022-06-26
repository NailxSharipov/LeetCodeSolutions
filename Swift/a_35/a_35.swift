//
//  a_35.swift
//  a_35
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_35: XCTestCase {

    func test_00() throws {
        XCTAssertEqual(SearchInsertPosition.searchInsert([1, 3, 5, 6], 5), 2)
    }
    
    func test_01() throws {
        XCTAssertEqual(SearchInsertPosition.searchInsert([1, 3, 5, 6], 2), 1)
    }

    func test_02() throws {
        XCTAssertEqual(SearchInsertPosition.searchInsert([1, 3, 5, 6], 7), 4)
    }
}
