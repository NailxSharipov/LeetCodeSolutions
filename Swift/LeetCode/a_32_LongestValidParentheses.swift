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
        let count = s.count &+ 1
        guard count > 1 else {
            return 0
        }
        
        var array = [Int](repeating: 0, count: count)

        var sum = 0
        var i = 0
        var isPrevDown = false
        var max = 0
        
        array.withUnsafeMutableBufferPointer { buffer in
            for ch in s {
                buffer[i] = sum
                if isPrevDown {
                    // test
                    var j = i
                    while j >= 0 {
                        let value = buffer[j]
                        if value == sum {
                            let length = i - j
                            if max < length {
                                max = length
                            }
                        } else if value < sum {
                            break
                        }
                        j &-= 1
                    }
                }
                if ch == "(" {
                    sum &+= 1
                    isPrevDown = false
                } else {
                    sum &-= 1
                    isPrevDown = true
                }
                i &+= 1
            }


            if isPrevDown {
                // test
                buffer[i] = sum
                var j = i
                while j >= 0 {
                    let value = buffer[j]
                    if value == sum {
                        let length = i &- j
                        if max < length {
                            max = length
                        }
                    } else if value < sum {
                        break
                    }
                    j &-= 1
                }
            }
        }
        
        return max
    }
    
}
