//
//  a_23_MergeKSortedLists.swift
//  LeetCode
//
//  Created by Nail Sharipov on 23/06/2019.
//  Copyright © 2019 Nail Sharipov. All rights reserved.
//

import Foundation

final class MergeKSortedLists {

    final func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let start = ListNode(Int.min)
        var mList = [ListNode]()
        var n = lists.count
        mList.reserveCapacity(n)
        n = 0
        for node in lists {
            if let node = node {
                mList.append(node)
                n &+= 1
            }
        }
        var node = start
        while n > 0 {
            var minNode = mList[0]
            var minIndex = 0
            for i in 1..<n {
                let iNode = mList[i]
                if minNode.val > iNode.val {
                    minNode = iNode
                    minIndex = i
                }
            }
            node.next = minNode
            if let nextNode = minNode.next {
                mList[minIndex] = nextNode
            } else {
                mList[minIndex] = mList[n &- 1]
                n &-= 1
            }
            node = minNode
        }

        return start.next
    }
    
    private struct Range {
        var start: Int
        var end: Int
    }
    
    
    final func mergeKListsArray(_ lists: [ListNode?]) -> ListNode? {
        var n = lists.count
        
        var length = 0
        
        for var node in lists {
            while node != nil {
                length &+= 1
                node = node?.next
            }
        }
        
        
        var array = Array<Int>(repeating: 0, count: length)
        var slice = [Range]()
        slice.reserveCapacity(n)
        
        var i = 0
        for node in lists {
            if var node = node {
                let start = i
                var hasNext = true
                repeat {
                    array[i] = node.val
                    i &+= 1
                    if let next = node.next {
                        node = next
                    } else {
                        hasNext = false
                    }
                } while hasNext
                slice.append(Range(start: start, end: i &- 1))
            }
        }
        
        n = slice.count
        
        var node = ListNode(0)
        let start = node
        while n > 1 {
            var minIndex = 0
            var minValue = array[slice[0].start]
            
            var i = 1
            while i < n {
                let iMinValue = array[slice[i].start]
                if minValue > iMinValue {
                    minValue = iMinValue
                    minIndex = i
                }
                i &+= 1
            }
            
            
            var minRange = slice[minIndex]
            var j = minRange.start
            
            repeat {
                let next = ListNode(minValue)
                node.next = next
                node = next
                
                j += 1
            } while j <= minRange.end && array[j] == minValue
            
            if j <= minRange.end {
                minRange.start = j
                slice[minIndex] = minRange
            } else {
                slice[minIndex] = slice[n &- 1]
                n &-= 1
            }
        }
        
        if let last = slice.first {
            var i = last.start
            while i <= last.end {
                let next = ListNode(array[i])
                node.next = next
                node = next
                i &+= 1
            }
        }
        
        return start.next
    }
    
    final func mergeKListsSimpleSort(_ lists: [ListNode?]) -> ListNode? {
        var length = 0
        
        for var node in lists {
            while node != nil {
                length &+= 1
                node = node?.next
            }
        }
        
        guard length > 0 else { return nil }

        var array = Array<Int>(repeating: 0, count: length)
        var i = 0
        for var node in lists {
            while node != nil {
                let nd = node!
                array[i] = nd.val
                i &+= 1
                node = nd.next
            }
        }
        array.sort(by: { a, b in
            return a < b
        })
        
        i = 1
        let start = ListNode(array[0])
        var node = start
        while i < length {
            let next = ListNode(array[i])
            node.next = next
            node = next
            i &+= 1
        }
        
        return start
    }

}
