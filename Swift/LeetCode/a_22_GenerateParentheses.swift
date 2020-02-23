//
//  a_22_GenerateParentheses.swift
//  LeetCode
//
//  Created by Nail Sharipov on 13/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class GenerateParentheses {
    
    private struct Data {
        let str: String
        let sum: Int

        init(str: String, sum: Int) {
            self.str = str
            self.sum = sum
        }
    }

    func generateParenthesis(_ n: Int) -> [String] {
        let m = n << 1
        var buffer = [Data(str: "(", sum: 1)]

        var newBuffer = [Data]()
        newBuffer.reserveCapacity(m)
        var i = 1
        while i < m {
            for it in buffer {
                let sum = it.sum
                let l = m - i

                let aSum = sum + 1
                if aSum - l <= 0 {
                    newBuffer.append(Data(str: it.str + "(", sum: aSum))
                }

                let bSum = sum - 1
                if bSum >= 0 {
                    newBuffer.append(Data(str: it.str + ")", sum: bSum))
                }
            }
            i += 1
            buffer = newBuffer
            newBuffer.removeAll(keepingCapacity: true)
        }
        var result = [String]()
        result.reserveCapacity(buffer.count)
        for b in buffer {
            result.append(b.str)
        }

        return result
    }
}
