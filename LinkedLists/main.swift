//
//  main.swift
//  LinkedLists
//
//  Created by Hi on 2022/9/23.
//

import Foundation

example(of: "creating and linking nodes") {
    let node1 = Node(1)
    let node2 = Node(2)
    let node3 = Node(3)
    node1.next = node2
    node2.next = node3
    print(node1)
}

// ---Example of creating and linking nodes---
// 1 -> 2 -> 3

example(of: "push") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print(list)
}
// ---Example of push---
// 1 -> 2 -> 3

example(of: "append") {
  var list = LinkedList<Int>()
  list.append(1)
  list.append(2)
  list.append(3)
  print(list)
}
// ---Example of append---
// 1 -> 2 -> 3

example(of: "inserting at a particular index") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print("Before inserting: \(list)")
  var middleNode = list.node(at: 1)!
  for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
  }
  print("After inserting: \(list)")
}

// ---Example of inserting at a particular index---
// Before inserting: 1 -> 2 -> 3
// After inserting: 1 -> 2 -> -1 -> -1 -> -1 -> -1 -> 3

example(of: "pop") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before popping list: \(list)")
    let poppedValue = list.pop()
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}
// ---Example of pop---
// Before popping list: 1 -> 2 -> 3
// After popping list: 2 -> 3
// Popped value: Optional(1)

example(of: "removing the last node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print("Before removing last node: \(list)")
  let removedValue = list.removeLast()
  print("After removing last node: \(list)")
  print("Removed value: " + String(describing: removedValue))
}
// ---Example of removing the last node---
// Before removing last node: 1 -> 2 -> 3
// After removing last node: 1 -> 2
// Removed value: Optional(3)

example(of: "removing a node after a particular node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before removing at particular index: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    print("After removing at index \(index): \(list)")
    print("Removed value: " + String(describing: removedValue))
}
// ---Example of removing a node after a particular node---
// Before removing at particular index: 1 -> 2 -> 3
// After removing at index 1: 1 -> 3
// Removed value: Optional(2)

example(of: "using collection") {
    var list = LinkedList<Int>()
    for i in 0...9 {
        list.append(i)
    }
    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")
    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}

// List: 0 -> 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9
// First element: 0
// Array containing first 3 elements: [0, 1, 2]
// Array containing last 3 elements: [7, 8, 9]
// Sum of all values: 45

example(of: "array cow") {
  let array1 = [1, 2]
  var array2 = array1
  print("array1: \(array1)")
  print("array2: \(array2)")
  print("---After adding 3 to array 2---")
  array2.append(3)
  print("array1: \(array1)")
  print("array2: \(array2)")
}
// ---Example of array cow---
// array1: [1, 2]
// array2: [1, 2]
// ---After adding 3 to array 2---
// array1: [1, 2]
// array2: [1, 2, 3]

example(of: "linked list cow") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    var list2 = list1
    print("List1: \(list1)")
    print("List2: \(list2)")
    
    print("After appending 3 to list2")
    list2.append(3)
    print("List1: \(list1)")
    print("List2: \(list2)")
}

// ---Example of linked list cow---
// List1: 1 -> 2
// List2: 1 -> 2
// After appending 3 to list2
// List1: 1 -> 2 -> 3
// List2: 1 -> 2 -> 3

// ---Example of linked list cow---
// List1: 1 -> 2
// List2: 1 -> 2
// After appending 3 to list2
// List1: 1 -> 2
// List2: 1 -> 2 -> 3
