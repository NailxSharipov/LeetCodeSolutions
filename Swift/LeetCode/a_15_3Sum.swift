//
//  3Sum.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class a3Sum {
    
    final func threeSum(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        guard n > 2 else {
            return []
        }
        
        var a0 = Int.min
        var b0 = a0

        let sortNums = nums.sorted()
        
        var numPresent = [Int: Int]()
        numPresent.reserveCapacity(n << 1) // with large number dictionary work better

        var i = 0
        var endI = 0
        var startI = -1
        
        let minA = -(sortNums[n - 2] + sortNums[n - 1])
        let maxC = -(sortNums[0] + sortNums[1])
        repeat {
            let a = sortNums[i]
            if a >= 0 {
                if a <= maxC && i >= 2  {
                    numPresent[a] = i
                }
                if endI == 0 && a != 0 {
                    endI = i
                }
            } else if a < minA  {
                startI = i
            }
            i &+= 1
        } while i < n
        
        i = startI + 1
        
        if endI + 2 >= n {
           endI = n - 3
        }
        if startI > endI {
            return []
        }
        
        var result = Array<Array<Int>>()
        result.reserveCapacity(numPresent.count)
        
        repeat {
            let a = sortNums[i]
            if a != a0 {
                a0 = a
                var j = i &+ 1
                repeat {
                    let b = sortNums[j]
                    
                    if b != b0 {
                        b0 = b
                        
                        let c = -(a &+ b)
                        
                        if c >= 0 {
                            if let cIx = numPresent[c], cIx > j {
                                result.append([a, b, c])
                            }
                        }
                    }
                    
                    j &+= 1
                    
                } while j < n &- 1
            }
            
            i &+= 1
            
        } while i < endI
        
        
        return result
    }
    
}
