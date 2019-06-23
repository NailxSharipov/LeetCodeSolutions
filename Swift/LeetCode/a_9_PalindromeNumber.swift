//
//  PalindromeNumber.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

class PalindromeNumber {
    
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var a = x
        var b = 0
        repeat {
            let c = a % 10
            a /= 10
            b = 10 &* b &+ c
        } while a > 0
        
        return b == x
    }
    
}
