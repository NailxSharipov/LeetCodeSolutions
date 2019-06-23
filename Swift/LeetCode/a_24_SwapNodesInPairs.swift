//
//  a_24_SwapNodesInPairs.swift
//  LeetCode
//
//  Created by Nail Sharipov on 23/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class SwapNodesInPairs {
    
    final func swapPairs(_ head: ListNode?) -> ListNode? {

        guard let result = head?.next else {
            return head
        }
        var a: ListNode? = nil
        var b = head
        var c: ListNode? = result
        
        while c != nil {
            let d = c?.next
            
            c?.next = b
            b?.next = d
            a?.next = c
            a = b
            b = d
            c = d?.next
        }

        return result
    }
    
    
}
