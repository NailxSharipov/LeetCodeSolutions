//
//  a_21_MergeTwoSortedLists.swift
//  LeetCode
//
//  Created by Nail Sharipov on 13/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class MergeTwoSortedLists {
    
    final func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil && l2 != nil else {
            return l1 ?? l2
        }

        var n1: ListNode?
        var n2: ListNode?
        var start: ListNode?

        var a1 = l1?.val ?? Int.min
        var a2 = l2?.val ?? Int.min
        
        if a1 < a2 {
            start = l1
            n1 = l1?.next
            a1 = n1?.val ?? Int.min
            n2 = l2
        } else {
            start = l2
            n1 = l1
            n2 = l2?.next
            a2 = n2?.val ?? Int.min
        }

        var n = start

        while n1 != nil && n2 != nil {
            if a1 > a2 {
                n!.next = n2
                n = n2
                n2 = n2?.next
                a2 = n2?.val ?? Int.min
            } else {
                n!.next = n1
                n = n1
                n1 = n1?.next
                a1 = n1?.val ?? Int.min
            }
        }
    
        if n1 != nil {
            n!.next = n1
        } else {
            n!.next = n2
        }

        return start
    }
    
}
