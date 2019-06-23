//
//  a_17_LetterCombinationsOfAPhoneNumber.swift
//  LeetCode
//
//  Created by Nail Sharipov on 11/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class LetterCombinationsOfAPhoneNumber {

    private static let d2: [Character] = ["a", "b", "c"]
    private static let d3: [Character] = ["d", "e", "f"]
    private static let d4: [Character] = ["g", "h", "i"]
    private static let d5: [Character] = ["j", "k", "l"]
    private static let d6: [Character] = ["m", "n", "o"]
    private static let d7: [Character] = ["p", "q", "r", "s"]
    private static let d8: [Character] = ["t", "u", "v"]
    private static let d9: [Character] = ["w", "x", "y", "z"]
    private static let alphabet: [[Character]] = [d2, d3, d4, d5, d6, d7, d8, d9]
    private static let map: [Character: Int] = ["2" : 0, "3" : 1, "4" : 2, "5" : 3, "6" : 4, "7" : 5, "8" : 6, "9" : 7]
    
    final func letterCombinations(_ digits: String) -> [String] {
        let n = digits.count
        
        guard n > 0 else {
            return []
        }
        
        var numbers = Array<Int>(repeating: 0, count: n)
        var alphabet = Array<[Character]>()
        alphabet.reserveCapacity(n)
        var buffer = Array<Character>(repeating: " ", count: n)

        var count = 1
        var j = 0
        for d in digits {
            let a = LetterCombinationsOfAPhoneNumber.map[d]!
            let alt = LetterCombinationsOfAPhoneNumber.alphabet[a]
            count &*= alt.count
            alphabet.append(alt)
            buffer[j] = alt[0]
            j &+= 1
        }
        
        var result = [String]()
        result.reserveCapacity(count)
        result.append(String(buffer))
        
        for _ in 0..<count {
            for i in 0..<n {
                var ix = numbers[i]
                let al = alphabet[i]
                ix &+= 1
                if ix < al.count {
                    buffer[i] = al[ix]
                    numbers[i] = ix
                    result.append(String(buffer))
                    break
                }
                // overflow case
                numbers[i] = 0
                buffer[i] = al[0]
            }
        }
        
        return result
    }
}
