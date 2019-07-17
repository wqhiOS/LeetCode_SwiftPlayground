//: [Previous](@previous)

import Foundation

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var next = head
        var slow = next//慢指针
        var fast = next?.next//快指针
        var index = 0
        var length = 0
        var isRun = true
        var isDelete = false
        
        while next?.next != nil {
            
            index += 1
            
            if isRun {
                if fast != nil && fast?.next != nil {
                    slow = slow?.next
                    fast = fast?.next?.next
                }else {
                    length = index * 2
                    isRun = false
                    print(length)
                }
            }else {
                if index == length - n - 1 {
                    next?.next = next?.next?.next
                    isDelete = true
                    print(next?.desc)
                }
            }
            next = next?.next
            
        }
    
        return head
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

let reverseListNode = Solution().removeNthFromEnd(listNode, 3)

reverseListNode?.desc ?? ""
listNode.desc



//: [Next](@next)


