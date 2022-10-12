import Foundation

public struct QueueStack<T> {
    /// 用数组表示两个栈
    private var leftStack: [T] = [], rightStack: [T] = []
    
    public init() {
        
    }
}

extension QueueStack: Queue {
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            while let element = rightStack.popLast() {
                leftStack.append(element)
            }
        }
        return leftStack.popLast()
    }
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
}








