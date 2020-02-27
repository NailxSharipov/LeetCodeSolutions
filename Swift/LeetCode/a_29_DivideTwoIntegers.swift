//
//  a_29_DivideTwoIntegers.swift
//  LeetCode
//
//  Created by Nail Sharipov on 26.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation

class DivideTwoIntegers {
    
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == -2147483648 && divisor == -1 || dividend == 2147483648 {
            return 2147483647
        }
        
        var a: Int = dividend
        var b: Int = divisor
        var sign: Bool = false
        
        // normolize
        
        if b > 0 {
            if a < 0 {
                a = -a
                sign = true
            }
        } else {
            b = -b
            if a > 0 {
                sign = true
            } else {
                a = -a
            }
        }
        
        // devide
        
        var c = 0
        
        while a >= b {
            var bb = b
            var cc = 1
            repeat {
                bb = bb << 1
                cc = cc << 1
            } while a > bb
            bb = bb >> 1
            cc = cc >> 1
            a &-= bb
            c &+= cc
        }

        return sign ? -c : c
    }
}
