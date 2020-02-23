//
//  RegularExpressionMatching.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

private enum Step {
    case star(Character)
    case dot(Int)
    case key(String)
}

private extension String {

    var steps: [Step] {
        var result = [Step]()
        let chars = [Character](self)
        let count = chars.count
        var j = 0
        var i = 0
        next_char:
        while i < count {
            let ch = chars[i]
            switch ch {
            case "*":
                let prevChar = chars[i &- 1]
                i &+= 1
                if let last = result.last {
                    if case .star(let pCh) = last {
                        if pCh == prevChar {
                            continue
                        }
                    }
                }
                result.append(.star(prevChar))
            case ".":
                j = i &+ 1
                
                while j < count && chars[j] == "." {
                    j &+= 1
                }
                
                if j < count && chars[j] == "*" {
                    if j &- i > 1 {
                        result.append(.dot(j &- i &- 1))
                    }
                } else {
                    result.append(.dot(j &- i))
                }
                i = j
            default:
                var j = i &+ 1
                while j < count {
                    let next = chars[j]
                    if next == "*" {
                        if j &- i > 1 {
                            result.append(.key(String(chars[i..<j &- 1])))
                        }
                        i = j
                        continue next_char
                    } else if next == "." {
                        result.append(.key(String(chars[i..<j])))
                        i = j
                        continue next_char
                    }
                    j &+= 1
                }
                result.append(.key(String(chars[i..<j])))
                i = j
            }
        }
        return result
    }
}


class RegularExpressionMatching {
    
    final func isMatch(_ s: String, _ p: String) -> Bool {
        guard !p.isEmpty else {
            return p == s
        }
        let steps = p.steps

        var buffer = Set<String>()
        buffer.insert(s)
        
        for sIx in 0..<steps.count &- 1 {
            let step = steps[sIx]
            var newBuffer = Set<String>()
            switch step {
            case .dot(let n):
                for str in buffer where str.count >= n {
                    let beginIndex = str.index(str.startIndex, offsetBy: n)
                    newBuffer.insert(String(str[beginIndex..<str.endIndex]))
                }
            case .star(let sCh):
                if sCh != "." {
                    for str in buffer {
                        var stIndex = str.startIndex
                        let edIndex = str.endIndex
                        for ch in str {
                            if ch == sCh {
                                newBuffer.insert(String(str[stIndex..<edIndex]))
                                stIndex = str.index(after: stIndex)
                            } else {
                                newBuffer.insert(String(str[stIndex..<edIndex]))
                                break
                            }
                        }
                        if stIndex == edIndex {
                            newBuffer.insert("")
                        }
                    }
                } else {
                    for str in buffer {
                        newBuffer.insert(str)
                        var stIndex = str.startIndex
                        let edIndex = str.endIndex
                        for _ in str {
                            newBuffer.insert(String(str[stIndex..<edIndex]))
                            stIndex = str.index(after: stIndex)
                        }
                        newBuffer.insert("")
                    }
                }
            case .key(let value):
                let n = value.count
                for str in buffer where str.hasPrefix(value) {
                    let beginIndex = str.index(str.startIndex, offsetBy: n)
                    newBuffer.insert(String(str[beginIndex..<str.endIndex]))
                }
            }
            if newBuffer.isEmpty {
                return false
            }
            buffer = newBuffer
        }
        
        let last = steps[steps.count &- 1]
        
        switch last {
        case .dot(let n):
            for str in buffer where str.count == n {
                return true
            }
            return false
        case .star(let sCh):
            if sCh == "." {
                return true
            }
            next_star:
            for str in buffer {
                for ch in str {
                    if ch != sCh {
                        continue next_star
                    }
                }
                return true
            }
            return false
        case .key(let value):
            for str in buffer where str == value {
                return true
            }
            return false
        }
    }
}
