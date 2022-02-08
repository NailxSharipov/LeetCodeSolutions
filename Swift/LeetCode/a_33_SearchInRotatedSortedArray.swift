//
//  a_33_SearchInRotatedSortedArray.swift
//  LeetCode
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

final class SearchInRotatedSortedArray {
    static func search(_ nums: [Int], _ target: Int) -> Int {
        let first = nums.findFirst()
        let end = nums.count - 1
        guard first != 0 else {
            return nums.isContain(element: target, start: 0, end: end)
        }
        
        let m0 = first - 1
        
        let i = nums.isContain(element: target, start: 0, end: m0)
        guard i == -1 else {
            return i
        }
        return nums.isContain(element: target, start: first, end: end)
    }
}

extension Array where Element == Int {
    
    func findFirst() -> Int {
        var j0 = 0
        var jn = self.count - 1
        
        var a0 = self[j0]
        var an = self[jn]
        
        guard a0 > an else { return 0 }
        
        var a = 0
        var j = 0
        
        var dif = jn - j0
        while dif > 2 {
            j = j0 + dif / 2
            a = self[j]
            
            if a > a0 {
                a0 = a
                j0 = j
            } else {
                an = a
                jn = j
            }
            dif = jn - j0
        }

        a = a0
        j = j0 + 1
        while j < jn {
            a = self[j]
            if a < a0 {
                return j
            }
            
            a0 = a
            j += 1
        }

        return j
    }

    func isContain(element: Int, start: Int, end: Int) -> Int {
        var j0 = start
        var jn = end
        
        var a0 = self[j0]
        var an = self[jn]
        guard a0 <= element && element <= an else {
            return -1
        }

        var dif = jn - j0
        while dif > 2 {
            let j = j0 + dif / 2
            let a = self[j]
            if a == element {
                return j
            } else if a < element {
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
    
}
