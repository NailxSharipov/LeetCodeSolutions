//
//  a_31_Next_Permutation.swift
//  LeetCode
//
//  Created by Nail Sharipov on 08.02.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

final class Next_Permutation {
    
    static func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        guard n > 1 else {
            return
        }
        
        var i = n - 1
        var a = nums[i]
        var b = 0
        while i > 0 {
            i -= 1
            b = nums[i]
            if a > b {
                var i0 = i
                var c = a
                i += 2
                while i < n {
                    let c0 = nums[i]
                    if c0 <= b {
                        break
                    }
                    c = c0
                    i += 1
                }
                i -= 1
                
                nums[i] = b
                nums[i0] = c

                i0 += 1
                
                var i1 = n - 1
                while i1 > i0 {
                    a = nums[i0]
                    b = nums[i1]

                    nums[i0] = b
                    nums[i1] = a

                    i0 += 1
                    i1 -= 1
                }

                return
            }
            a = b
        }
        
        nums.sort()
    }
}
