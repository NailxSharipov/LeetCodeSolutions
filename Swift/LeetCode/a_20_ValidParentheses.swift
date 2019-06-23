//
//  a_20_ValidParentheses.swift
//  LeetCode
//
//  Created by Nail Sharipov on 13/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class ValidParentheses {
    
    private struct Scope {
        let type: Int
        var count: Int = 0
    }
    
    final func isValid(_ s: String) -> Bool {
     
        var queue = [Scope]()
        queue.reserveCapacity(3)
        
        for ch in s {
            let type: Int
            let inc: Int
            switch ch {
            case "[":
                inc = 1
                type = 0
            case "]":
                inc = -1
                type = 0
            case "{":
                inc = 1
                type = 1
            case "}":
                inc = -1
                type = 1
            case "(":
                inc = 1
                type = 2
            default:
                inc = -1
                type = 2
            }
            if var last = queue.last {
                if inc == 1 {
                    if last.type == type {
                        last.count &+= 1
                        queue[queue.count &- 1] = last
                    } else {
                        queue.append(Scope(type: type, count: 1))
                    }
                } else {
                    if last.type == type && last.count > 0 {
                        last.count &-= 1
                        if last.count != 0 {
                            queue[queue.count &- 1] = last
                        } else {
                            queue.removeLast()
                        }
                    } else {
                        return false
                    }
                }
            } else {
                if inc == 1 {
                    queue.append(Scope(type: type, count: 1))
                } else {
                    return false
                }
            }
        }
        return queue.isEmpty
    }
}
