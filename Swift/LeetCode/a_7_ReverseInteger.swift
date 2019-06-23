//
//  ReverseInteger.swift
//  LeetCode
//
//  Created by Nail Sharipov on 09/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

class ReverseInteger {
    
    func reverse(_ x: Int) -> Int {
        var a = x >= 0 ? x : -x
        var b: Int = 0
        while a > 0 {
            let c = a % 10
            a /= 10
            b = 10 &* b &+ c
        }

        if b <= Int32.max {
            return x >= 0 ? b : -b
        } else {
            return 0
        }
        
    }

}
