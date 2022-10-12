import Foundation

example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    print(stack)
    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    stack.pop()
}


example(of: "Challenge 1: Reverse an Array") {
    let array = [1, 2, 3, 4, 5, 6]
    print(array)
    Challenge().printInReverse([1, 2, 3, 4, 5, 6])
}


example(of: "Challenge 2: Balance the parentheses") {
    let string1 = "h((e))llo(world)()"
    if Challenge().checkParentheses(string1) {
        print("\(string1) is balanced parentheses")
    } else {
        print("\(string1) is unbalanced parentheses")
    }
    let string2 = "(hello world"
    if Challenge().checkParentheses(string2) {
        print("\(string2) is balanced parentheses")
    } else {
        print("\(string2) is unbalanced parentheses")
    }
}
