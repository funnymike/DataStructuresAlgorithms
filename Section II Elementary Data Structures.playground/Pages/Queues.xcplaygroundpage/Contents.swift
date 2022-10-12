import Foundation

example(of: "test queue array") {
    var queue = QueueArray<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.peek
    print(queue)
}
/**
 ---Example of: test queue array---
 ["Ray", "Brian", "Eric"]
 ["Brian", "Eric"]
 ["Brian", "Eric"]
 */

example(of: "test queue linked list") {
    let queue = QueueLinkedList<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.peek
    print(queue)
}
/**
 ---Example of: test queue linked list---
 Ray -> Brian -> Eric -> end
 Brian -> Eric -> end
 Brian -> Eric -> end
 */

example(of: "test queue ring buffer") {
    var queue = QueueRingBuffer<String>(count: 10)
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.peek
    print(queue)
}
/**
 ---Example of: test queue ring buffer---
 [Ray, Brian, Eric]
 [Brian, Eric]
 [Brian, Eric]
 */

example(of: "test queue stack") {
    var queue = QueueStack<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.peek
    print(queue)
}
/**
 ---Example of: test queue stack---
 QueueStack<String>(leftStack: [], rightStack: ["Ray", "Brian", "Eric"])
 QueueStack<String>(leftStack: ["Eric", "Brian"], rightStack: [])
 QueueStack<String>(leftStack: ["Eric", "Brian"], rightStack: [])

 */
