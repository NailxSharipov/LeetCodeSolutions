//
//  a_26_RemoveDuplicatesFromSortedArray.swift
//  LeetCode
//
//  Created by Nail Sharipov on 24.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation

class RemoveDuplicatesFromSortedArray {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        guard n > 1 else {
            return n
        }
        var j = 1
        var a = nums[0]
        for i in 1..<n {
            let b = nums[i]
            if a != b {
                nums[j] = b
                j &+= 1
                a = b
            }
        }
        
        return j
    }
}
