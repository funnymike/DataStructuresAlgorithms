import Foundation

public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    
    public init() {
        
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

//MARK: - Inserting elements
extension BinarySearchTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        // 1 
        guard let node = node else {
            return BinaryNode(value: value)
        }
        // 2
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        // 3
        return node
    }
}
/**
 1. 这是一种递归方法，因此它需要一个基本案例来终止递归。 如果当前节点为 nil，则您已找到插入点并可以返回一个新的 BinaryNode。
 2. 由于元素类型具有可比性，您可以进行比较。 这个 if 语句控制下一个插入调用应该遍历的方式。 如果新值小于当前值，则在左子节点上调用 insert。 如果新值大于或等于当前值，您将在右孩子上调用 insert。
 3. 返回当前节点。 这使得 node = insert(from: node, value: value) 形式的赋值成为可能，因为 insert 将创建节点（如果它是 nil）或返回节点（它不是 nil）。
 */

//MARK: - Finding elements
extension BinarySearchTree {
    /// 是否包含值（中序遍历）O(n)
    /// - Parameter value: 值
    public func contains(_ value: Element) -> Bool {
        guard let root = root else { return false }
        var found = false
        root.traverseInOrder {
            if $0 == value {
                found = true
            }
        }
        return found
    }
}

extension BinarySearchTree {
    /// 是否包含值（BST特性）O(logn)
    public func containsII(_ value: Element) -> Bool {
        // 1
        var current = root
        // 2
        while let node = current {
            // 3
            if node.value == value {
                return true
            }
            // 4
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}
/**
 1. 首先将 current 设置为根节点。
 2. 当 current 不是 nil 时，检查当前节点的值。
 3. 如果该值等于您要查找的值，则返回 true。
 4. 否则，决定你是要检查左孩子还是右孩子。
 */

//MARK: - Removing elements
private extension BinaryNode {
    var min: BinaryNode {
        leftChild?.min ?? self
    }
}

extension BinarySearchTree {
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else { return nil }
        if value == node.value {
            // more to come
            // 1
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            // 2
            if node.leftChild == nil {
                return node.rightChild
            }
            // 3
            if node.rightChild == nil {
                return node.leftChild
            }
            // 4
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}
/**
 1.如果节点是叶子节点，你只需返回nil，从而移除当前节点。
 2. 如果节点没有左孩子，则返回 node.rightChild 以重新连接右子树。
 3. 如果节点没有右孩子，则返回 node.leftChild 以重新连接左子树。
 4. 这是要移除的节点既有左孩子又有右孩子的情况。 您将节点的值替换为右子树中的最小值。 然后你调用右孩子的 remove 来移除这个交换的值。
 */
