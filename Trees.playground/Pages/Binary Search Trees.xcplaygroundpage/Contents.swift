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
