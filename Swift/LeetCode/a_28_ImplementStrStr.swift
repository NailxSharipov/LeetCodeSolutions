//
//  a_28_ImplementStrStr.swift
//  LeetCode
//
//  Created by Nail Sharipov on 26.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation
class ImplementStrStr {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        var result = -1
        [Character](haystack).withUnsafeBufferPointer() { buffer in
            var i = 0
            let m = needle.count
            let n = buffer.count &- m
            next_char:
            while i <= n {
                var a = buffer[i]
                var j = 0
                for b in needle {
                    if a == b {
                        j &+= 1
                        if j < m {
                            a = buffer[i &+ j]
                        } else {
                            break
                        }
                    } else {
                        i &+= 1
                        continue next_char
                    }
                }
                result = i
                break
            }
        }


        return result
    }
}
