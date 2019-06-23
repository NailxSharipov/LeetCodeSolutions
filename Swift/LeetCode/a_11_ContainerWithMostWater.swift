//
//  ContainerWithMostWater.swift
//  LeetCode
//
//  Created by Nail Sharipov on 10/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

class ContainerWithMostWater {
    
    final func maxArea(_ height: [Int]) -> Int {
        let n = height.count
        var maxSize = 0
        var l = 0
        var r = n &- 1
        var left = height[l]
        var right = height[r]
        while l <= r {
            let size: Int
            if left < right {
                size = (r &- l) &* left
                l &+= 1
                if l < n {
                    left = height[l]
                }
            } else {
                size = (r &- l) &* right
                r &-= 1
                if r >= 0 {
                    right = height[r]
                }
            }
            if size > maxSize {
                maxSize = size
            }
        }
        
        return maxSize
    }
}
