//
//  3SumClosest.swift
//  LeetCode
//
//  Created by Nail Sharipov on 11/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class a3SumClosest {
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        guard n > 2 else {
            return nums.reduce(0) { $0 + $1 }
        }
        
        var bestSum = nums[0] + nums[1] + nums[2]
        let sortNums = nums.sorted()
        var a0 = Int.min
        for i in 0..<n - 2 {
            let a = sortNums[i]
            if a != a0 {
                a0 = a
                var b0 = Int.min
                for j in i + 1..<n - 1 {
                    let b = sortNums[j]
                    if b != b0 {
                        b0 = b
                        let c = target - a - b
                        
                        // binary search start
                        
                        var left = j + 1
                        var right = n - 1
                        
                        var k: Int = -1
                        var hasNext = true
                        var e = sortNums[0]
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
                            e = sortNums[k]
                            if e > c {
                                right = k
                            } else if e < c {
                                left = k
                            } else {
                                // exactly what we need
                                return target
                            }
                        } while hasNext
                        
                        // binary search end
                        
                        let e0 = sortNums[left]
                        let e1 = sortNums[right]
                        
                        let sum: Int
                        if abs(c - e0) < abs(c - e1) {
                            sum = a + b + e0
                        } else {
                            sum = a + b + e1
                        }
                        if abs(target - sum) < abs(target - bestSum) {
                            bestSum = sum
                        }
                    }
                }
            }
        }
        
        return bestSum
    }
}

