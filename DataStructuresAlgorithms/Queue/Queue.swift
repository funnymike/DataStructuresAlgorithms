//
//  Queue.swift
//  Queue
//
//  Created by Hi on 2022/9/23.
//

import Foundation

/// 队列协议
public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
