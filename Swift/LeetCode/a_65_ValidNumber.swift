//
//  a_65_ValidNumber.swift
//  LeetCode
//
//  Created by Nail Sharipov on 24.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation

class ValidNumber {
    
    func isNumber(_ s: String) -> Bool {
        let strChars = [Character](s)
        var hasDigit = false
        strChars.withUnsafeBufferPointer() { chars in
            var n = chars.count &- 1
            var i = 0
            let space = Character(" ")
            while i < n && chars[i] == space {
                i &+= 1
            }
            
            while n > i && chars[n] == space {
                n &-= 1
            }
            let digits = Set([Character]("0123456789"))

            var hasSign = false
            var dotIndex = -2
            var hasE = false

            while i <= n {
                let ch = chars[i]
                
                if digits.contains(ch) {
                    hasDigit = true
                    i &+= 1
                    continue
                }
                
                if ch == Character("+") || ch == Character("-") {
                    if hasSign || hasDigit || dotIndex == i &- 1 {
                        hasDigit = false
                        break
                    }
                    hasSign = true
                    hasDigit = false
                    i &+= 1
                    continue
                }
                
                if ch == Character(".") {
                    if dotIndex == -2 && !hasE {
                        dotIndex = i
                        i &+= 1
                        continue
                    } else {
                        hasDigit = false
                        break
                    }
                }
                
                if ch == Character("e") {
                    if hasE || !hasDigit {
                        hasDigit = false
                        break
                    }
                    hasDigit = false
                    hasSign = false
                    dotIndex = -2
                    hasE = true
                    i &+= 1
                    continue
                }
                
                hasDigit = false
                break
            }
        }

        return hasDigit
    }

}
