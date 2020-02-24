//
//  a_30_SubstringWithConcatenationOfAllWords.swift
//  LeetCode
//
//  Created by Nail Sharipov on 24.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation

class SubstringWithConcatenationOfAllWords {
    
    @inline(__always)
    private static func test(chars: ArraySlice<Character>, originMap: [ArraySlice<Character>: Int], wordsCount: Int) -> Bool {
        var startIndex = chars.startIndex
        var key = chars[startIndex..<startIndex &+ wordsCount]
        guard let count = originMap[key] else {
            return false
        }
        var map = originMap
        map[key] = count &- 1
        
        let endIndex = chars.endIndex
        startIndex &+= wordsCount
        while startIndex < endIndex {
            key = chars[startIndex..<startIndex &+ wordsCount]
            if let cnt = map[key], cnt > 0 {
                map[key] = cnt &- 1
            } else {
                return false
            }
            startIndex &+= wordsCount
        }

        return true
    }
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !words.isEmpty else {
            return []
        }
        var originMap = [ArraySlice<Character>: Int]()
        originMap.reserveCapacity(words.count)
        let wordsCount = words[0].count
        for word in words {
            let wChars = [Character](word)[0..<wordsCount]
            if let count = originMap[wChars] {
                originMap[wChars] = count &+ 1
            } else {
                originMap[wChars] = 1
            }
        }
        let chars = [Character](s)
        let substringLength = words.count &* wordsCount
        var startIndex = 0
        let stopIndex = chars.count &- substringLength

        var result = [Int]()
        
        while startIndex <= stopIndex {
            let sub = chars[startIndex..<startIndex &+ substringLength]
            if SubstringWithConcatenationOfAllWords.test(chars: sub, originMap: originMap, wordsCount: wordsCount) {
                result.append(startIndex)
            }
            startIndex &+= 1
        }
        
        return result
    }
}
