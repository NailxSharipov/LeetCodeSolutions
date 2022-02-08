//
//  a_34.swift
//  LeetCode
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

final class FindFirstAndLastPositionOfElementInSortedArray {
    
    static func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else {
            return [-1, -1]
        }
        
        let left = nums.findLeft(element: target)
        guard left >= 0 else {
            return [-1, -1]
        }
        
        let right = nums.findRight(element: target, start: left)
        
        return [left, right]
    }
    
}

extension Array where Element == Int {

    func findLeft(element: Int) -> Int {
        var j0 = 0
        var jn = self.count - 1
        
        var a0 = self[j0]
        var an = self[jn]
        guard a0 <= element && element <= an else {
            return -1
        }

        var dif = jn - j0
        while dif > 2 {
            let j = j0 + dif / 2
            let a = self[j]
            if a < element {
                a0 = a
                j0 = j
            } else {
                an = a
                jn = j
            }
            dif = jn - j0
        }

        for j in j0...jn {
            let a = self[j]
            if a > element {
                return -1
            } else if a == element {
                return j
            }
        }
        
        return -1
    }
    
    func findRight(element: Int, start: Int) -> Int {
        var j0 = start
        var jn = self.count - 1
        
        var a0 = self[j0]
        var an = self[jn]
        guard a0 <= element && element <= an else {
            return -1
        }

        var dif = jn - j0
        while dif > 2 {
            let j = j0 + dif / 2
            let a = self[j]
            if a > element {
                an = a
                jn = j
            } else {
                a0 = a
                j0 = j
            }
            dif = jn - j0
        }
        
        var j = jn
        while j >= j0 {
            let a = self[j]
            if a < element {
                return -1
            } else if a == element {
                return j
            }
            j -= 1
        }

        return -1
    }
    
}
