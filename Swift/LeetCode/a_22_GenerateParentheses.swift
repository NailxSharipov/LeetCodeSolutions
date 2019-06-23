//
//  a_22_GenerateParentheses.swift
//  LeetCode
//
//  Created by Nail Sharipov on 13/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class GenerateParentheses {
    
    final func generateParenthesis(_ n: Int) -> [String] {
        let m = n * (n + 1) / 2 - n % 2

        if n == 0 {
            return []
        }
        
        var a = [String]()
        a.reserveCapacity(m)
        var b = [String]()
        b.reserveCapacity(m)

        a.append("()")
        
        for _ in 1..<n {
            var s = a[0]
            s.append("()")
            b.append(s)
            
            s = a[0]
            s.insert("(", at: s.startIndex)
            s.append(")")
            b.append(s)
            
            var i = 1
            while i < a.count {
                let t = a[i]
                
                s = t
                s.insert("(", at: s.startIndex)
                s.append(")")
                b.append(s)
                
                s = t
                s.append("()")
                b.append(s)
                
                s = "()"
                s.append(t)
                b.append(s)
                
                i += 1
            }
            
            a = b
            b.removeAll(keepingCapacity: true)
        }

        return a
    }
}
