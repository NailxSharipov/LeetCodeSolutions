//
//  ListNode.swift
//  LeetCode
//
//  Created by Nail Sharipov on 23/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    var string: String {
        var node: ListNode? = self
        var s = String()
        while node != nil {
            let val = node!.val
            s.append(String(val))
            node = node?.next
        }
        
        return s
    }
}



extension Array where Element == Int {
    
    func linkedList() -> ListNode? {
        guard self.count > 0 else { return nil }
        
        let start = ListNode(self[0])
        var node = start
        for i in 1..<self.endIndex {
            let next = ListNode(self[i])
            node.next = next
            node = next
        }
        
        return start
    }
    
}


