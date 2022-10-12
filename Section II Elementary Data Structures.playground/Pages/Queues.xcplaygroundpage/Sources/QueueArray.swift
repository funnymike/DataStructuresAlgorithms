import Foundation

public struct QueueArray<T>: Queue {
    private var array: [T] = []
    
    public init() {
        
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        return array.removeFirst()
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}
