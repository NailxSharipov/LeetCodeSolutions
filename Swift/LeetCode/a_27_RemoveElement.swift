//
//  a_27_RemoveElement.swift
//  LeetCode
//
//  Created by Nail Sharipov on 24.02.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import Foundation

class RemoveElement {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var j = 0
        for a in nums {
            if a != val {
                nums[j] = a
                j &+= 1
            }
        }
        
        return j
    }
    
}
