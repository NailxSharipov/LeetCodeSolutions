//
//  a_41_Solution.swift
//  LeetCode
//
//  Created by Nail Sharipov on 04.04.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

struct FirstMissingPositive {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let n = nums.count

        var positiveCount = 0
        var min = Int.max
        var max = Int.min
        var sum = 0
        var i = 0
        while i < n {
            let x = nums[i]
            i += 1
            guard x > 0 else {
                continue
            }
            
            if min > x {
                min = x
            }
            
            if max < x {
                max = x
            }
            
            sum += x
            positiveCount += 1
        }
        
        guard (min + max) * positiveCount != 2 * sum else {
            if min > 1 {
                return 1
            } else {
                return max + 1
            }
        }
        
        // swift task have a mistake cause it's not allow us to mutate original array
        var buffer = nums
        

        i = 0
        while i < n {
            let x = buffer[i]
            guard x.isInRange(max: max) else {
                buffer[i] = -1
                i += 1
                continue
            }
            i += 1
            var a = x
            
            while true {
                if a < i {
                    buffer[a] = 0
                    break
                } else {
                    let x1 = buffer[a]
                    buffer[a] = 0
                    if x1.isInRange(max: max) {
                        a = x1
                    } else {
                        break
                    }
                }
            }
        }
        
        i = 1
        while i < n {
            let x = buffer[i]
            if x == 0 {
                return i
            }
        }
        
        
        return max + 1
    }
    
}

private extension Int {
    
    @inline(__always)
    func isInRange(max: Int) -> Bool {
        self > 0 && self < max
    }
}

