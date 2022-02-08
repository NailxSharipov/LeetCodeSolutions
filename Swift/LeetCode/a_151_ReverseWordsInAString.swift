//
//  a_151_ReverseWordsInAString.swift
//  LeetCode
//
//  Created by Nail Sharipov on 24.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation

class ReverseWordsInAString {
    func reverseWords(_ s: String) -> String {
        if s.isEmpty {
            return s
        }

        let space = Character(" ")
        let chars = [Character](s)
        
        var n = chars.count - 1
        var i = 0
        while i < n && chars[i] == space {
            i &+= 1
        }
        
        while n > i && chars[n] == space {
            n &-= 1
        }

        var result = [Character](repeating: " ", count: n - i)
        chars.withUnsafeBufferPointer { buffer in
            var j = result.count
            var beginIndex: Int?
            while i < n {
                let ch = buffer[i]
                if space != ch {
                    if beginIndex == nil {
                        beginIndex = i
                    }
                } else if let bIx = beginIndex {
                    let size = i &- bIx
                    let range = Range(uncheckedBounds: (j &- size, j))
                    j &-= size
                    j &-= 1
                    result.replaceSubrange(range, with: buffer[bIx..<i])
                    beginIndex = nil
                }
                i &+= 1
            }
            if let bIx = beginIndex {
                let size = i &- bIx
                let range = Range(uncheckedBounds: (0, size))
                result.replaceSubrange(range, with: buffer[bIx...i])
            }
        }

        return String(result)
    }
}
