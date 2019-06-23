//
//  a_18_4Sum.swift
//  LeetCode
//
//  Created by Nail Sharipov on 12/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class a4Sum {

    final func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let n = nums.count
        guard n > 3 else {
            return []
        }

        
        let sortNums = nums.sorted()
        
        var numPresent = [Int: Int]()
        numPresent.reserveCapacity(n << 1) // with large number dictionary work better
        
        var i = 3
        var a0 = Int.min
        var b0 = Int.min
        var c0 = Int.min
        
        repeat {
            let a = sortNums[i]
            numPresent[a] = i
            i &+= 1
        } while i < n
        
        

        var result = Array<Array<Int>>()
        var set = Set<Array<Int>>()
        result.reserveCapacity(numPresent.count)
        set.reserveCapacity(numPresent.count)
        
        i = 0
        
        repeat {
            let a = sortNums[i]
            var j = i &+ 1
            repeat {
                let b = sortNums[j]
            
                var k = j &+ 1
                repeat {
                    let c = sortNums[k]
                    
                    let d = target - (a &+ b &+ c)
                    if let dIx = numPresent[d], dIx > k {
                        if !(a == a0 && b == b0 && c == c0) {
                            a0 = a
                            b0 = b
                            c0 = c
                            let array = [a, b, c, d]
                            if !set.contains(array) {
                                set.insert(array)
                                result.append(array)
                            }
                        }
                    }
                    
                    k &+= 1
                    
                } while k < n &- 1

                j &+= 1
                
            } while j < n &- 2

            i &+= 1
            
        } while i < n &- 3
        
        
        return result
    }
    
}
