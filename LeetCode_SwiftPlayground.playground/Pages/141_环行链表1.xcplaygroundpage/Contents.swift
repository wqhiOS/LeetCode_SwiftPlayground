//: [Previous](@previous)

import Foundation

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        while fast != nil || fast?.next != nil {
            if slow == fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}

//测试
let node0 = ListNode(3)
//let node1 = ListNode(2)
//let node2 = ListNode(0)
//let node3 = ListNode(4)
//node0.next = node1
//node1.next = node2
//node2.next = node3
//node3.next = node1

Solution().hasCycle(node0)

//: [Next](@next)
