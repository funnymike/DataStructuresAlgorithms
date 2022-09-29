import Foundation
import Darwin

var tree: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    return seven
}()

example(of: "tree diagram") {
    print(tree)
}
/**
 ---Example of: tree diagram---
  ┌──nil
 ┌──9
 │ └──8
 7
 │ ┌──5
 └──1
  └──0
 */


example(of: "in-order traversal") {
    tree.traverseInOrder { print($0) }
}
/**
 ---Example of: in-order traversal---
 0
 1
 5
 7
 8
 9
 */

example(of: "pre-order traversal") {
    tree.traversePreOrder { print($0) }
}
/**
 ---Example of: pre-order traversal---
 7
 1
 0
 5
 9
 8
 */

example(of: "post-order traversal") {
    tree.traversePostOrder { print($0) }
}
/**
 ---Example of: post-order traversal---
 1
 0
 5
 9
 8
 7
 */

func height<T>(of node: BinaryNode<T>?) -> Int {
    // 1
    guard let node = node else {
        return -1
    }
    return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
}

func serialize<T>(_ node: BinaryNode<T>?) -> [T?] {
    var array: [T?] = []
    node?.traversePreOrderII {
        array.append($0)
    }
    return array
}
// 1
func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    // 2
    guard let value = array.removeFirst() else { return nil }
    // 3
    let node = BinaryNode(value: value)
    node.leftChild = deserialize(&array)
    node.rightChild = deserialize(&array)
    return node
}

example(of: "serialization") {
    var array = serialize(tree)
    let node = deserialize(&array)
    print(node!)
}
/**
 ┌──nil
┌──9
│ └──8
7
│ ┌──5
└──1
 └──0
 */
