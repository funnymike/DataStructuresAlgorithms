import Foundation

example(of: "building a BST") {
    var bst = BinarySearchTree<Int>()
    for i in 0..<5 {
        bst.insert(i)
    }
    print(bst)
}
/**
 ---Example of: building a BST---
    ┌──4
   ┌──3
   │ └──nil
  ┌──2
  │ └──nil
 ┌──1
 │ └──nil
 0
 └──nil
 */

var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
}

example(of: "building a BST") {
    print(exampleTree)
}
/**
 ---Example of: building a BST---
  ┌──5
 ┌──4
 │ └──nil
 3
 │ ┌──2
 └──1
  └──0
 */

example(of: "finding a node") {
    if exampleTree.contains(5) {
        print("Found 5!")
    } else {
        print("Couldn’t find 5")
    }
}
/**
 ---Example of: finding a node---
 Found 5!
 */


example(of: "removing a node") {
    var tree = exampleTree
    print("Tree before removal:")
    print(tree)
    tree.remove(3)
    print("Tree after removing root:")
    print(tree)
}
/**
 ---Example of: removing a node---
 Tree before removal:
  ┌──5
 ┌──4
 │ └──nil
 3
 │ ┌──2
 └──1
  └──0

 Tree after removing root:
 ┌──5
 4
 │ ┌──2
 └──1
  └──0
 */
