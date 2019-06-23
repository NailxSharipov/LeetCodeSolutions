//
//  ZigZagConversion.swift
//  LeetCode
//
//  Created by Nail Sharipov on 09/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

class ZigZagConversion {

    func convert(_ s: String, _ numRows: Int) -> String {
        let n = s.count
        if numRows == 1 || n <= numRows {
            return s
        }
        
        let inArray = Array(s)
        let ch = Character.init(Unicode.Scalar(0))
        var outArray = ContiguousArray<Character>(repeating: ch, count: n)
        

        let dR = (numRows &- 1) &<< 1
        var k = 0
        var i = 0
        repeat {
            var s1 = i &<< 1
            var s0 = dR &- s1
            if s0 == 0 || s1 == 0 {
                s0 = dR
                s1 = dR
            }
            var j = i
            repeat {
                outArray[k] = inArray[j]
                k &+= 1
                j &+= s0
                if j < n {
                    outArray[k] = inArray[j]
                    k &+= 1
                }
                j &+= s1
            } while j < n
            i += 1
        } while i < numRows

        return String(outArray)
    }
}
