//: [Previous](@previous)

import Foundation

/**
()括号中的内容 代表父节点
           ┌──────7──────┐
           │             │
       ┌─4(7)─┐       ┌─9(7)─┐
       │      │       │      │
   ┌─2(4)─┐  5(4)─┐ 8(9) ┌─11(9)─┐
   │      │       │      │       │
 1(2)    3(2)    6(5) 10(11)   12(11)
 */
let elements = [7,4,9,2,5,8,11,1,3,6,10,12]

func test0() {
    let tree = BinarySearchTree<Int>()

    elements.forEach { (element) in
        tree.add(element)
    }
    
    debugPrint(tree)
    tree.clear()
    debugPrint(tree)
}

/**
 二叉搜索树-添加、删除测试
 */
func test1() {
    let tree = BinarySearchTree<Int>()

    elements.forEach { (element) in
        tree.add(element)
    }
    debugPrint(tree)
    elements.forEach { (element) in
        print("===== \(element) =====")
        tree.remove(element)
    debugPrint(tree)
    }
}

/**
 二叉树遍历测试
 */
func test2() {
    let elements = [7,4,9,2,5,8,11,1,3,6,10,12]

    let tree = BinarySearchTree<Int>()
    elements.forEach { (element) in
        tree.add(element)
    }
    print(tree)
    
    print("preorderTraversal")
    tree.preorderTraversal { (element) in
        print(element, separator: "", terminator: " ")
    }
    print("\n")
    
    print("inorderTraversal")
    tree.inorderTraversal { (element) in
        print(element, separator: "\n", terminator: " ")
    }
    print("\n")
    
    print("postorderTraversal")
    tree.postorderTraversal { (element) in
        print(element, separator: "\n", terminator: " ")
    }
    print("\n")
    
    print("levelTraversal")
    tree.levelTraversal { (element) in
        print(element, separator: "\n", terminator: " ")
    }
    print("\n")
}

test0()
test1()
test2()

//: [Next](@next)
