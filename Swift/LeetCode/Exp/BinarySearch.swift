//
//  BinarySearch.swift
//  LeetCode
//
//  Created by Nail Sharipov on 11/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation


final class BinarySearch {

    struct Result {
        let a: Int
        let b: Int
    }
    
    static func findNearest(array: [Int], x: Int, start: Int, end: Int) -> Int {
    
        var left = start
        var right = end
        
        var k: Int = -1
        var hasNext = true
        var e = array[0]
        repeat {
            if left + 1 < right {
                k = (left + right) >> 1
            } else {
                hasNext = !(k == left || k == right)
                if k == left {
                    k = right
                } else {
                    k = left
                }
            }

            e = array[k]
            if e > x {
                right = k
            } else if e < x {
                left = k
            } else {
                return e
            }
        } while hasNext
        
        return e
    }

    
    static func isContains(array: [Int], x: Int, start: Int, end: Int) -> Bool {
        
        var left = start
        var right = end
        
        var k: Int = -1
        var hasNext = true
        repeat {
            
            if left + 1 < right {
                k = (left + right) >> 1
            } else {
                hasNext = !(k == left || k == right)
                if k == left {
                    k = right
                } else {
                    k = left
                }
            }
            
            let e = array[k]
            if e > x {
                right = k
            } else if e < x {
                left = k
            } else {
                return true
            }
        } while hasNext
        
        return false
    }
}
