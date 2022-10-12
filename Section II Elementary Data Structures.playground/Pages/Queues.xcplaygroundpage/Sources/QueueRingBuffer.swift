import Foundation



public struct QueueRingBuffer<T> {
    
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
}

extension QueueRingBuffer: Queue {
    public mutating func enqueue(_ element: Element) -> Bool {
        ringBuffer.write(element)
    }
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    public var peek: T? {
        ringBuffer.first
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        String(describing: ringBuffer)
    }
}
