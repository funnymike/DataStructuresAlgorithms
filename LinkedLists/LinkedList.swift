//
//  LinkedList.swift
//  LinkedLists
//
//  Created by Hi on 2022/9/23.
//

import Foundation

public struct LinkedList<T> {
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

extension LinkedList {
    /// 在列表的前面添加一个值
    public mutating func push(_ value: T) {
        copyNodes()
        head = Node(value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// 在列表末尾添加一个值
    public mutating func append(_ value: T) {
        copyNodes()
        // 1
        guard !isEmpty else {
            push(value)
            return
        }
        // 2
        tail!.next = Node(value)
        // 3
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<T>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        // 2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    // 1
    @discardableResult
    public mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        copyNodes()
        // 2
        guard tail !== node else {
            append(value)
            return tail!
        }
        // 3
        node.next = Node(value, next: node.next)
        return node.next!
    }
}

extension LinkedList {
    @discardableResult
    public mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    /// 移除最后一个节点
    public mutating func removeLast() -> T? {
        // 1
        guard let head = head else {
            return nil
        }
        // 2
        guard head.next != nil else {
            return pop()
        }
        // 3
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        // 4
        prev.next = nil
        tail = prev
        return current.value
    }
    
    /// 在特定节点之后删除一个节点
    /// - Parameter node: 特定节点
    mutating func remove(after node: Node<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: Collection {
    public struct Index: Comparable {
        public var node: Node<T>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
                
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) {
                $0?.next
            }
            return nodes.contains {
                $0 === rhs.node
            }
        }
        
    }
    
    // 1
    public var startIndex: Index {
        Index(node: head)
    }
    // 2
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    // 3
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    // 4
    public subscript(position: Index) -> T {
        position.node!.value
    }
}

//MARK: copyNodes
extension LinkedList {
    private mutating func copyNodes() {
        guard var oldNode = head else {
            return
        }
        head = Node(oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        tail = newNode
    }
}
