//
//  a_25_ReverseNodesInKGroup.swift
//  LeetCode
//
//  Created by Nail Sharipov on 23/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class ReverseNodesInKGroup {
    
    final func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 1 else {
            return head
        }
        var result: ListNode? = nil
        var prevHead: ListNode? = nil
        var node = head
        
        repeat {
            var j = 1
            let start = node
            node = node?.next
            var end: ListNode? = nil
            while node != nil && j < k {
                j &+= 1
                end = node
                node = node?.next
            }
            
            if j == k {
                var node = start
                var tail = start
                node = start?.next
                j = 1
                while j < k {
                    j += 1
                    let a = node
                    node = node?.next
                    a?.next = tail
                    tail = a
                }
                if result == nil {
                    result = end
                }
                prevHead?.next = end
                start?.next = node
                prevHead = start
            }
        } while node != nil
        
        if result != nil {
            return result
        } else {
            return head
        }
    }
    
}
