//
//  a_38_Solution.swift
//  LeetCode
//
//  Created by Nail Sharipov on 03.04.2022.
//  Copyright © 2022 Nail Sharipov. All rights reserved.
//

struct CountAndSay {
    
    func countAndSay(_ n: Int) -> String {
        var sequence: [UInt8] = [1]
        for _ in 1..<n {
            sequence = self.next(sequence: sequence)
        }
        
        var str = String()
        str.reserveCapacity(sequence.count)
        for s in sequence {
            switch s {
            case 1:
                str.append("1")
            case 2:
                str.append("2")
            default:
                str.append("3")
            }
        }
        
        return str
    }

    private func next(sequence: [UInt8]) -> [UInt8] {
        var result = [UInt8]()
        let n = sequence.count
        result.reserveCapacity(n + (n >> 2))
        
        var cnt: UInt8 = 0
        var a: UInt8 = 10
        for x in sequence {
            if a != x {
                if cnt > 0 {
                    result.append(cnt)
                    result.append(a)
                }
                a = x
                cnt = 1
            } else {
                cnt += 1
            }
        }
        
        result.append(cnt)
        result.append(a)
        
        return result
    }
    
}
