//
//  a_33.swift
//  a_33
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

import XCTest

class a_33: XCTestCase {

    func test_00() throws {
        XCTAssertEqual(SearchInRotatedSortedArray.search([4, 5, 6, 7, 0, 1, 2], 0), 4)
    }
    
    func test_01() throws {
        XCTAssertEqual(SearchInRotatedSortedArray.search([4, 5, 6, 7, 0, 1, 2], 3), -1)
    }
    
    func test_02() throws {
        XCTAssertEqual(SearchInRotatedSortedArray.search([1], 0), -1)
    }
    
    func test_10() throws {
        XCTAssertEqual([0, 1, 2, 3].findFirst(), 0)
    }
    
    func test_11() throws {
        XCTAssertEqual([5, 6, 2, 3].findFirst(), 2)
    }
    
    func test_12() throws {
        XCTAssertEqual([5, 6, 7, 3].findFirst(), 3)
    }
    
    func test_13() throws {
        XCTAssertEqual([5, 0, 1, 3].findFirst(), 1)
    }
    
    func test_14() throws {
        for n in 3...10 {
            let sorted = Array(0..<n)
            for i in 1..<n {
                let p0 = sorted[0..<i]
                let p1 = sorted[i..<n]
                let p = Array(p1 + p0)
                XCTAssertEqual(p.findFirst(), p1.count, "p: \(p)")
            }
        }
    }
    
    func test_20() throws {
        XCTAssertEqual([0, 1, 3].isContain(element: 0, start: 0, end: 2), 0)
        XCTAssertEqual([0, 1, 3].isContain(element: 1, start: 0, end: 2), 1)
        XCTAssertEqual([0, 1, 3].isContain(element: 3, start: 0, end: 2), 2)
        XCTAssertEqual([0, 1, 3].isContain(element: 2, start: 0, end: 2), -1)
        XCTAssertEqual([0, 1, 3].isContain(element: 0, start: 0, end: 1), 0)
        XCTAssertEqual([0, 1, 3].isContain(element: 1, start: 0, end: 1), 1)
    }

    func test_21() throws {
        let array = (0..<10).map({ 2 * $0 })
        XCTAssertEqual(array.isContain(element: 0, start: 0, end: 4), 0)
    }
    
    func test_22() throws {
        let array = (0..<10).map({ 2 * $0 })
        XCTAssertEqual(array.isContain(element: 1, start: 0, end: 2), -1)
    }
    
    func test_23() throws {
        let array = (0..<10).map({ 2 * $0 })
        XCTAssertEqual(array.isContain(element: 2, start: 2, end: 3), -1)
    }
    
    func test_2a() throws {
        let array = (0..<10).map({ 2 * $0 })
        for i in 0..<9 {
            for j in i+1..<10 {
                for k in 0..<10 {
                    let result = array.isContain(element: k, start: i, end: j)
                    let origin = k >= 2 * i && k <= 2 * j && k % 2 == 0
                    let index = origin ? k / 2 : -1
                    XCTAssertEqual(result, index, "element: \(k), start: \(i), end: \(j)")
                }
            }
        }
    }
    
}
