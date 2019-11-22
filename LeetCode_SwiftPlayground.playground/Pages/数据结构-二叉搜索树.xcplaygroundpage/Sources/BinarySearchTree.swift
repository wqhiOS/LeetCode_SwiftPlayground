import Foundation

/// 二叉搜索树
public class BinarySearchTree<Element: Comparable> {
    
    public init(){
        
    }
   
    public var root: Node<Element>?
    public var isEmpty: Bool {return size == 0}
    
    private var size: Int = 0
    
    public func add(_ element: Element) {
        
        if root == nil {
            root = Node(element: element, parent: nil)
            size += 1
            return
        }
    
        var parentNode = root
        var targetNode = root
        var compareResult: ComparisonResult = .orderedSame
        while parentNode != nil {
            targetNode = parentNode
            compareResult = compare(element,parentNode!.element)
            switch compareResult {
            case .orderedAscending:
                parentNode = parentNode!.left
                break
            case .orderedDescending:
                parentNode = parentNode!.right
                break
            case .orderedSame:
                parentNode = nil
                break
            }
        }
        
        switch compareResult {
        case .orderedAscending:
            targetNode?.left = Node(element: element, parent: targetNode)
            size += 1
            afterAdding()
        case .orderedDescending:
            targetNode?.right = Node(element: element, parent: targetNode)
            size += 1
            afterAdding()
        case .orderedSame:
            targetNode?.element = element
//            afterAdding()
        }
        
    }
    
    public func afterAdding() {}

    public func remove(_ element: Element) {
        guard var node = node(withElement: element) else {
            return
        }
        
        // 如果删除节点度为2，那么最后还是相当于删除度为1或者0的节点。
        // 所以先判断这个
        if node.hasTowChildren {
            
            guard let predecessor = self.predecessor(node: node) else {
                return
            }
            node.element = predecessor.element
            node = predecessor
            
        }
        //走到这里，说明 node度要么是0 要么是1
        let replacement = node.left ?? node.right
        if replacement != nil {//node度为1
            
            if let parent = node.parent {
                if parent.left == node {
                    parent.left = replacement
                }else {
                    parent.right = replacement
                }
                replacement?.parent = parent
            }else {
                root = replacement
                replacement?.parent = nil
            }
            afterRemoving()
        }else {//度为0
            if node == node.parent?.left {
                node.parent?.left = nil
            }else {
                node.parent?.right = nil
            }
            
            if node == root {
                root = nil
            }
            afterRemoving()
        }
        
        size -= 1
        
    }
    
    public func afterRemoving() {}
    
    public func clear() {
        root = nil
        size = 0
    }
    
    public func contains(_ element: Element) -> Bool{
        if node(withElement: element) != nil {
            return true
        }else {
            return false
        }
    }
    
    
    /// 是否是完全二叉树
    public func isCompleted() {
        
    }
    
}

// MARK: - Traversal
extension BinarySearchTree {
    public func preorderTraversal(_ block: (Element)->Void) {
        preorderTraversal(root, block: block)
    }
    public func inorderTraversal(_ block: (Element)->Void)  {
        inorderTraversal(root, block: block)
    }
    public func postorderTraversal(_ block: (Element)->Void) {
        postorderTraversal(root, block: block)
    }
    
    public func levelTraversal(_ block: (Element)->Void) {
        guard let root = root else {
            return
        }
        var queue = [Node<Element>]()
        queue.append(root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            block(node.element)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
    }
    
    private func preorderTraversal(_ node: Node<Element>?,block: (Element)->Void) {
        guard let _node = node else {
            return
        }
        block(_node.element)
        preorderTraversal(_node.left, block: block)
        preorderTraversal(_node.right, block: block)
    }
    
    
    private func inorderTraversal(_ node: Node<Element>?, block: (Element)->Void) {
        guard let _node = node else {
            return
        }
        inorderTraversal(_node.left, block: block)
        block(_node.element)
        inorderTraversal(_node.right,block: block)
    }
    
    private func postorderTraversal(_ node: Node<Element>?, block: (Element)->Void) {
        guard let _node = node else {
            return
        }
        postorderTraversal(_node.left, block: block)
        postorderTraversal(_node.right,block: block)
        block(_node.element)
    }
}

extension BinarySearchTree {
    
    private func node(withElement element: Element) -> Node<Element>?{
        var node = root
        while node != nil {
            let result = compare(element, node!.element)
            switch result {
            case .orderedAscending:
                node = node!.left
            case .orderedDescending:
                node = node!.right
            case .orderedSame:
                return node
            }
        }
        return nil
    }
    
    private func predecessor(node: Node<Element>) -> Node<Element>?{
        
        if node.left != nil {
            var predecessor = node.left
            while predecessor?.right != nil {
                predecessor = predecessor?.right
            }
            return predecessor
        }
    
        var targetNode = node
        while targetNode.parent != nil && targetNode.parent!.left != nil && targetNode.parent!.left! == targetNode {
            targetNode = targetNode.parent!
        }
        return targetNode.parent
        
    }
    
    private func successor(node: Node<Element>) -> Node<Element>? {
        if node.right != nil {
                var predecessor = node.right
                while predecessor?.left != nil {
                    predecessor = predecessor?.left
                }
                return predecessor
            }
        
        var targetNode = node
        while targetNode.parent != nil && targetNode.parent!.right != nil && targetNode.parent!.right! == targetNode {
            targetNode = targetNode.parent!
        }
        return targetNode.parent
    }

    private func compare(_ e1: Element,_ e2: Element) -> ComparisonResult{
        
        if e1 < e2 {
            return .orderedAscending
        }else if e1 > e2 {
            return .orderedDescending
        }else {
            return .orderedSame
        }
        
    }
    
}

public class Node<Element:Comparable> {

    public var left: Node<Element>?
    public var right: Node<Element>?
    /// 注意：这里必须使用弱指针，否则调用clear的时候，root置位nil，其他节点不会销毁
    public weak var parent: Node<Element>?
    public var height: Int = 1
    public var element: Element
    
    public var isLeaf: Bool {
        return (left == nil && right == nil)
    }
    
    public var hasTowChildren: Bool {
        return (left != nil && right != nil)
    }
    
    init(element: Element,parent: Node<Element>?) {
        self.element = element
        self.parent = parent
    }
    
    deinit {
           
    }
    
}

extension Node: Equatable {
    public static func == (lhs: Node<Element>, rhs: Node<Element>) -> Bool {
        return Unmanaged.passRetained(lhs).toOpaque() == Unmanaged.passRetained(rhs).toOpaque()
//        return lhs.element == rhs.element
    }
}



