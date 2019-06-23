//
//  StringToInteger.swift
//  LeetCode
//
//  Created by Nail Sharipov on 09/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

class StringToInteger {
    
    private enum State {
        case trim
        case readNumber
    }
    
    func myAtoi(_ str: String) -> Int {
        
        var state: State = .trim
        var isNegative = false
        var a: Int = 0
        for char in str {

            switch state {
            case .trim:
                if char != " " {
                    state = .readNumber
                    if char == "-" {
                       isNegative = true
                    } else if char == "+" {
                        continue
                    } else {
                        fallthrough
                    }
                }
            case .readNumber:
                switch char {
                case "0":
                    a = 10 &* a
                case "1":
                    a = 10 &* a &+ 1
                case "2":
                    a = 10 &* a &+ 2
                case "3":
                    a = 10 &* a &+ 3
                case "4":
                    a = 10 &* a &+ 4
                case "5":
                    a = 10 &* a &+ 5
                case "6":
                    a = 10 &* a &+ 6
                case "7":
                    a = 10 &* a &+ 7
                case "8":
                    a = 10 &* a &+ 8
                case "9":
                    a = 10 &* a &+ 9
                default:
                    return isNegative ? -a : a
                }
             
                if isNegative && -a <= Int32.min {
                    return Int(Int32.min)
                }
                
                if !isNegative && a >= Int32.max {
                    return Int(Int32.max)
                }
            }
        }
        
        return isNegative ? -a : a
    }
}
