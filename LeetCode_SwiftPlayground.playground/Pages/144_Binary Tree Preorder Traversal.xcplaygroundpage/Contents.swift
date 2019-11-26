//: [Previous](@previous)

import Foundation

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        guard let _root = root else {
            return list
        }
        var stack = [TreeNode]()
        stack.append(_root)
        var lastNode: TreeNode?
        while !stack.isEmpty {
            let node = stack.last
            if (node!.left == nil && node!.right == nil) || node!.left?.val == lastNode?.val || node!.right?.val == lastNode?.val {
                lastNode = node
                list.append(stack.removeLast().val)
            }else {
                if let right = node?.right {
                    stack.append(right)
                }
                if let left = node?.left {
                    stack.append(left)
                }
            }
        }
        return list
    }
}

//: [Next](@next)
