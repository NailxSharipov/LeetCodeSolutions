//
//  IntegerToRoman.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

class IntegerToRoman {

    final func intToRoman(_ num: Int) -> String {
        var a = num
        var s = String()
        
        if a >= 1000 {
            let q = a / 1000
            s.reserveCapacity(q &+ 12)
            for _ in 0..<q {
                s.append("M")
            }
            a %= 1000
        } else {
            s.reserveCapacity(12)
        }
        
        if a >= 100 {
            let q = a / 100
            a %= 100
            switch q {
                case 1:
                s.append("C")
                case 2:
                s.append("CC")
                case 3:
                s.append("CCC")
                case 4:
                s.append("CD")
                case 5:
                s.append("D")
                case 6:
                s.append("DC")
                case 7:
                s.append("DCC")
                case 8:
                s.append("DCCC")
                default:
                s.append("CM")
            }
        }
        
        if a >= 10 {
            let q = a / 10
            a %= 10
            switch q {
            case 1:
                s.append("X")
            case 2:
                s.append("XX")
            case 3:
                s.append("XXX")
            case 4:
                s.append("XL")
            case 5:
                s.append("L")
            case 6:
                s.append("LX")
            case 7:
                s.append("LXX")
            case 8:
                s.append("LXXX")
            default:
                s.append("XC")
            }
        }
        
        if a > 0 {
            switch a {
            case 1:
                s.append("I")
            case 2:
                s.append("II")
            case 3:
                s.append("III")
            case 4:
                s.append("IV")
            case 5:
                s.append("V")
            case 6:
                s.append("VI")
            case 7:
                s.append("VII")
            case 8:
                s.append("VIII")
            default:
                s.append("IX")
            }
        }
        
        return s
    }
}
