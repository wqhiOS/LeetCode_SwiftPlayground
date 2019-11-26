//: [Previous](@previous)

import Foundation

/*
Invert a binary tree.

Example:

Input:

     4
   /   \
  2     7
 / \   / \
1   3 6   9
Output:

     4
   /   \
  7     2
 / \   / \
9   6 3   1
*/

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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        //层序遍历二叉树 然后依次交换即可（用前中后序遍历也可以）
        guard let _root = root else {
            return root
        }
        var queue = [TreeNode]()
        queue.append(_root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let tmp = node.left
            node.left = node.right
            node.right = tmp
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return root
    }
}

//: [Next](@next)
