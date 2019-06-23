//
//  RomanToInt.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class RomanToInt {
    final func romanToInt(_ s: String) -> Int {
     
        var prev = 0
        var sum = 0
        
        for ch in s {
            let a: Int
            switch ch {
                case "M":
                a = 1000
                case "D":
                a = 500
                case "C":
                a = 100
                case "L":
                a = 50
                case "X":
                a = 10
                case "V":
                a = 5
                default:
                a = 1
            }
            if prev != 0 {
                if prev >= a {
                    sum &+= prev
                } else {
                    sum &-= prev
                }
            }
            prev = a
        }
        sum &+= prev
        
        
        return sum
    }
}
