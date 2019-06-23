//
//  a_19_RemoveNthNodeFromEndOfList.swift
//  LeetCode
//
//  Created by Nail Sharipov on 12/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class RemoveNthNodeFromEndOfList {
    
    final func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var queue = [ListNode]()
        queue.reserveCapacity(128)

        
        var next = head?.next

        while next != nil {
            let node = next!
            queue.append(node)
            next = node.next
        }
        
        let count = queue.count
        
        if n < count {
            let prev = queue[count &- n &- 1]
            prev.next = prev.next?.next
            
            return head
        }
        
        if n > count {
            return queue.first
        }
        
        head?.next = queue.first?.next
        
        return head
    }
    
}
