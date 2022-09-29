import Foundation

/// 二叉树节点
public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    /// 中序遍历
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
        visit(value)
    }
}

extension BinaryNode {
    public func traversePreOrderII(visit: (Element?) -> Void) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.traversePreOrderII(visit: visit)
        } else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.traversePreOrderII(visit: visit)
        } else {
            visit(nil)
        }
    }
}


extension BinaryNode: CustomStringConvertible {
    public var description: String {
            diagram(for: self)
        }
        
        private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
            guard let node = node else {
                return root + "nil\n"
            }
            if node.leftChild == nil && node.rightChild == nil {
                return root + "\(node.value)\n"
            }
            return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ") + root + "\(node.value)\n" + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
        }
}
