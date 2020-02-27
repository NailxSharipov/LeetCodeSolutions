//
//  a_32_LongestValidParentheses.swift
//  LeetCode
//
//  Created by Nail Sharipov on 27.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation

class LongestValidParentheses {
    
    func longestValidParentheses(_ s: String) -> Int {
        let count = s.count + 1
        guard count > 1 else {
            return 0
        }
        
        var map = [Int](repeating: -1, count: count)

        var sum = 0
        var i = 0
        var max = 0
        var isPrevDown = true
        for ch in s {
            if ch == "(" {
                if sum < 0 {
                    // start point
                    sum = 0
                    // clean buffer
                    for _ in 0..<count {
                        if map[sum] != -1 {
                            map[sum] = -1
                        } else {
                            break
                        }
                    }
                }
                
                // change direction from down to up
                if sum >= 0 {
                    let prevValueIndex = map[sum]
                    
                    if isPrevDown {
                        // test
                        if prevValueIndex != -1 {
                            let length = i &- prevValueIndex
                            if max < length {
                                max = length
                            }
                        }
                    }
                    
                    if prevValueIndex == -1 {
                        map[sum] = i
                    }
                }
                
                sum &+= 1
                isPrevDown = false
            } else {
                if sum == 0 {
                    // test
                    let prevValueIndex = map[sum]
                    let length = i &- prevValueIndex
                    if prevValueIndex != -1 && max < length {
                        max = length
                    }
                }
                sum &-= 1
                isPrevDown = true
            }
            
            i &+= 1
        }

        if sum >= 0 {
            // test
            let prevValueIndex = map[sum]
            let length = i &- prevValueIndex
            if prevValueIndex != -1 && max < length {
                max = length
            }
        }

        return max
    }
    
}
