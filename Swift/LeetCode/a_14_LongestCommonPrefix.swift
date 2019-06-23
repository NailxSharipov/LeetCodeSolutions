//
//  LongestCommonPrefix.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class LongestCommonPrefix {
    
    final func longestCommonPrefix(_ strs: [String]) -> String {

        let n = strs.count
        guard n > 0 else {
            return ""
        }
        
        let s0 = strs[0]
        if s0.isEmpty {
            return ""
        }
        var i0 = s0.startIndex
        
        var indices = [String.Index]()
        indices.reserveCapacity(n &- 1)
        for j in 1..<n {
            let s = strs[j]
            if s.isEmpty {
                return ""
            }
            indices.append(s.startIndex)
        }

        repeat {
            let a0 = s0[i0]
            var isLast = false
            for j in 1..<n {
                let s = strs[j]
                var i = indices[j &- 1]
                let a = s[i]
                if a != a0 {
                    return String(s0[s0.startIndex..<i0])
                }
                
                i = s.index(after: i)
                indices[j &- 1] = i
                if i == s.endIndex {
                    isLast = true
                }
            }
            if isLast {
                return String(s0[s0.startIndex...i0])
            }
            i0 = s0.index(after: i0)
            
        } while i0 != s0.endIndex
        
        return s0
    }
    
}
