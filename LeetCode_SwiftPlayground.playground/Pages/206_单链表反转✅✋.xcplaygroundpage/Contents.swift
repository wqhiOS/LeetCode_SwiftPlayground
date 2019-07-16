//: [Previous](@previous)

import Foundation

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        var newNode: ListNode? = nil
        var nextNode = head
        while nextNode != nil {
            let tmp = nextNode?.next
            nextNode?.next = newNode
            newNode = nextNode
            nextNode = tmp
        }
        
        return newNode
    
    }
}

//测试：生成一个0...9的链表
var listNode = ListNode(0)
var nextNode = listNode
for index in 1..<10 {
    let node = ListNode(index)
    nextNode.next = node
    nextNode = node
}

listNode.desc

let reverseListNode = Solution().reverseList(listNode)

reverseListNode?.desc ?? ""
listNode.desc
