//
//  main.swift
//  LeetCode
//
//  Created by Nail Sharipov on 09/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

let solution = RegularExpressionMatching()
//let result = solution.isMatch("mississippi", "mis*is*p*.")
//let result = solution.isMatch("mississippi", "mis*is*ip*.")
//let result = solution.isMatch("a", "")
let result = solution.isMatch("aabcbcbcaccbcaabc", ".*a*aa*.*b*.c*.*a*")


print(result)
//let result = solution.reverseKGroup([1, 2, 3, 4, 5, 6].linkedList(), 3)
//let result = solution.reverseKGroup([].linkedList(), 3)
//let result = solution.mergeKListsArray([nil])
//let result = solution.mergeKListsArray([])
