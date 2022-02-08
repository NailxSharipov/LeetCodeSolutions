//
//  a_35_Solution.swift
//  LeetCode
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

final class SearchInsertPosition {
    
    static func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        var j0 = 0
        var jn = nums.count - 1
        
        var a0 = nums[j0]
        var an = nums[jn]
        guard a0 <= target && target <= an else {
            if target < a0 {
                return 0
            } else {
                return nums.count
            }
        }

        var dif = jn - j0
        while dif > 2 {
            let j = j0 + dif / 2
            let a = nums[j]
            if a == target {
                return j
            } else if a < target {
                a0 = a
                j0 = j
            } else {
                an = a
                jn = j
            }
            dif = jn - j0
        }

        for j in j0...jn {
            let a = nums[j]
            if a > target {
                return j
            } else if a == target {
                return j
            }
        }
        
        return jn
    }
    
}
