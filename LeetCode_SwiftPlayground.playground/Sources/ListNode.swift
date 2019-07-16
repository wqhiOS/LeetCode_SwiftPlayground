import Foundation

/// 链表
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
    
    public var desc: String {
        get {
            var descrip: String = "\(self.val)"
            var nextNode = self.next
            while nextNode != nil {
                descrip += "->" + "\(nextNode!.val)"
                nextNode = nextNode!.next
            }
            return descrip
        }
    }
    
}
