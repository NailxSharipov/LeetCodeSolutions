//
//  RegularExpressionMatching.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation


class RegularExpressionMatching {
    
    final func isMatch(_ s: String, _ p: String) -> Bool {
        
        let sArray = ContiguousArray(s)
        let pArray = ContiguousArray(p)
        let m = pArray.count

        for i in 0..<m {
            let ch = pArray[i]
            let isDot = ch == "."
            let isStar = ch == "*"
            if isDot {
                
            }
        }
    
    return false
}
}
/*
class RegularExpressionMatching {

    final func isMatch(_ s: String, _ p: String) -> Bool {
    
        let sArray = ContiguousArray(s)
        let pArray = ContiguousArray(p)
        let m = pArray.count

        var keyStart = 0
        
        var j = 0
        for i in 0..<m {
            let ch = pArray[i]
            let isDot = ch == "."
            let isStar = ch == "*"
            if isDot || isStar {
                if isDot {
                    j += 1
                }
                if keyStart != i {
                    let key = pArray[keyStart..<i]
                    let result = sArray.find(sub: key, start: j)
                    if result >= 0 {
                        j = result + key.count
                    } else {
                        return false
                    }
                }
                keyStart = i + 1
            }
        }
        
        if keyStart != m {
            let key = pArray[keyStart..<m]
            let result = sArray.find(sub: key, start: j)
            if result >= 0 {
                j = result + key.count
            } else {
                return false
            }
        }
        
        let isMatch = j == sArray.count || pArray[m - 1] == "*"
        
        return isMatch
    }
    
}

private extension ContiguousArray where Element == Character {

    func find(sub: ArraySlice<Character>, start: Int) -> Int {
        let n = self.count
        let m = sub.count
        var j = start
        let subStartIndex = sub.startIndex
        while j + m <= n {
            var i = 0
            repeat {
                let a = sub[i + subStartIndex]
                let b = self[i + j]
                if a != b {
                    break
                }
                i += 1
            } while i < m
            if i == m {
                return j
            }
            j += i + 1
        }

        return -1
    }
}
*/
