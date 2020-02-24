//
//  main.swift
//  LeetCode
//
//  Created by Nail Sharipov on 09/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

let solution = RemoveElement()
var array = [0,0,1,1,1,2,2,3,3,4]
let result = solution.removeElement(&array, 0)


print(result)
print(array)
//let result = solution.reverseKGroup([1, 2, 3, 4, 5, 6].linkedList(), 3)
//let result = solution.reverseKGroup([].linkedList(), 3)
//let result = solution.mergeKListsArray([nil])
//let result = solution.mergeKListsArray([])
